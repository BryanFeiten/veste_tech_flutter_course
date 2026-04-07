## Arquitetura Offline-First em Flutter: Resiliência e Gestão de Estado Local

### O Cenário: O Portal para a Dimensão Offline
Imagine o seguinte cenário em nosso aplicativo do **Rick and Morty**: o usuário abriu o app, consumiu a API, carregou as 3 primeiras páginas de personagens e está rolando a lista feliz da vida. De repente, ele entra no metrô (ou atravessa um portal interdimensional) e perde o sinal de internet (4G/Wi-Fi cai).

Se ele tentar pesquisar um personagem ou simplesmente fechar e abrir o app novamente, o que acontece? 
1. **O App Quebra (Crash):** Péssimo.
2. **Tela de Carregamento Infinita:** Frustrante.
3. **Tela de "Sem Conexão":** Aceitável para apps básicos.
4. **Ele continua navegando nos dados que já baixou:** O Padrão Ouro.

É aqui que entra o conceito de **Offline-First**. Em aplicativos de nível global, não tratamos a falta de internet como uma "exceção" ou um erro fatal, mas sim como um estado natural do dispositivo móvel.

### O que é Offline-First?
Offline-First é um paradigma de engenharia de software onde a fonte da verdade primária do aplicativo não é a Nuvem (API), mas sim o **Banco de Dados Local**. A Nuvem passa a ser tratada apenas como um serviço de *sincronização*.



---

### Como fazer a UI reagir a duas fontes de dados?

Quando temos um Banco Local e uma API Remota, precisamos decidir como entregar isso para a tela. Como não estamos usando *Streams* (que funcionam como um "cano" aberto enviando vários dados), o nosso `Repository` retorna um `Future` (uma resposta única). 

Para lidar com isso, o mercado adota duas abordagens principais:

#### Abordagem 1: Cache-First (O mais rápido e recomendado hoje)
Aqui, o Banco Local manda no pedaço. Priorizamos a velocidade extrema.
1. A Store pede os dados ao `Repository`.
2. O `Repository` olha o Banco Local. **Tem dado salvo?** Se sim, ele devolve imediatamente e o fluxo acaba. Zero loading na tela.
3. **Não tem dado salvo?** O `Repository` vai na API Remota, baixa os dados, *salva no Banco Local* para a próxima vez e devolve para a Store.

#### Abordagem 2: Sincronização via Callback (Para atualizações em tempo real)
Se você quer mostrar o que tem no cache instantaneamente, mas **também** quer ir na API para ver se algo mudou e atualizar a tela logo em seguida, usamos funções de *callback*.

Veja como a lógica fica separada e limpa:

```dart
// 1. Na Store: Enviamos uma função que sabe o que fazer com os dados
void carregarPersonagens() async {
    // Essa função pode ser chamada 2 vezes (pelo local e depois pelo remoto)
    void atualizarTela(List<Character> dados) {
        _characters = dados;
    }

    await _repository.buscarPersonagens(onUpdate: atualizarTela);
}

// 2. No Repository: Ele orquestra o fluxo
Future<void> buscarPersonagens({ required Function(List<Character>) onUpdate }) async {
    // Passo 1: Busca o cache rápido e já avisa a tela
    final cache = await _localDataSource.getCharacters();
    if (cache != null) {
        onUpdate(cache); 
    }

    // Passo 2: Vai na internet ver se tem novidade
    final apiData = await _remoteDataSource.getCharacters();
    if (apiData != null) {
        await _localDataSource.saveCharacters(apiData); // Atualiza o banco
        onUpdate(apiData); // Avisa a tela de novo com os dados frescos
    }
}
```



---

### O Arsenal do Flutter: Qual Banco Local Escolher?

Não existe "bala de prata". Salvar um token no lugar errado é falha de segurança; salvar objetos complexos na ferramenta errada causa travamento visual (*jank*).



| Banco de Dados | O que salva? | Casos de Uso Reais | Ponto de Atenção |
| :--- | :--- | :--- | :--- |
| **SharedPreferences** | Tipos primitivos (`String`, `int`, `bool`). | Configurações (Tema claro/escuro), flags (`primeiro_acesso`), última página visitada. | Péssimo para listas ou objetos. Exige converter JSON manualmente, gastando muita memória. |
| **Secure Storage** | Strings encriptadas. | Tokens JWT de login, chaves de API, dados bancários (PII). | É mais lento que o SharedPreferences devido à criptografia. Não use para dados simples. |
| **Hive / Hive_ce** | Objetos complexos (Models em formato binário). | Cache pesado de API (Personagens offline), carrinhos de compras, histórico de busca. | Performance absurda, sem precisar de queries SQL. O `Hive_ce` é a versão atual mantida pela comunidade. |
| **Isar** | Volumes massivos de objetos com relacionamentos. | Dicionários offline, catálogo com 50.000 produtos com filtros complexos (cor, preço). | O "sucessor" do Hive. Excelente para buscar dados offline em milissegundos. |
| **SQLite (sqflite)** | Tabelas relacionais clássicas. | Apps de gestão (ERP) offline onde um item depende estruturalmente de vários outros (Muitos-para-Muitos). | Exige escrever queries em SQL na mão, gerando muito código repetitivo (boilerplate). |

---

### Conclusão e Próximos Passos
No nosso desafio do **Rick and Morty**, começaremos experimentando o `SharedPreferences` para salvar o estado da nossa paginação. 

Faremos também o exercício mental de tentar salvar os personagens nele, entendendo na prática o peso de serializar JSONs manualmente. Isso nos dará a fundação perfeita para, logo em seguida, introduzirmos a ferramenta correta para salvar objetos complexos: o **Hive_ce**.
