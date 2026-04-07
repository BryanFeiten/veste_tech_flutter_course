## Laboratório Prático: Dissecando os Exemplos (`database_examples`)

Antes de aplicarmos o banco de dados em outros projetos, criamos um laboratório isolado na pasta `database_examples`. O objetivo aqui é entender como estruturar o código para que a troca de um banco de dados não quebre o resto do aplicativo.



### A Arquitetura: Protegendo a Regra de Negócio
Para garantir que nosso app seja escalável, não podemos importar pacotes de banco de dados diretamente nas nossas telas. Seguimos uma separação estrita de responsabilidades:

1. **Adapter (Infraestrutura):** É o único que sabe qual biblioteca estamos usando (Hive, Sqflite, etc.). Ele suja as mãos com SQL ou abertura de caixas (boxes), implementando um contrato (Interface).
2. **Service (Caso de Uso):** Representa uma ação de negócio específica (ex: `SalvarContatoService`). Ele recebe o Adapter e o utiliza para executar a ação, sem saber *como* o dado é salvo por baixo dos panos.
3. **Repository:** O maestro. Ele decide de onde o dado vem (neste laboratório, apenas do banco local, mas no futuro ele orquestrará com a API).
4. **Store (MobX):** Gerencia o estado da tela. Possui propriedades privadas (`_dados`) e expõe apenas permissão de leitura (`get dados`) para a View, garantindo o encapsulamento.
5. **Page (View):** Exibe a interface. Não possui regras de negócio, apenas chama as *Actions* da Store.

---

### Os 4 Cenários Implementados

Para demonstrar a especialidade de cada ferramenta, implementamos 4 cenários isolados. Você pode testar cada um deles acessando os botões na tela inicial do laboratório.

#### 1. SharedPreferences: Nome do Usuário
* **O que ensina:** Como ler e escrever strings e tipos simples de forma rápida.
* **Cenário:** Um campo de texto simples para salvar o nome do usuário localmente. O Adapter encapsula o `shared_preferences`.

#### 2. Flutter Secure Storage: O Cofre de Tokens
* **O que ensina:** Persistência de dados sensíveis utilizando a criptografia nativa do dispositivo (Keychain no iOS, Keystore no Android).
* **Cenário:** Simulação de geração e armazenamento de um Token JWT (usado para manter o usuário logado com segurança). 

#### 3. Hive CE: A Lista de Tarefas (To-Do)
* **O que ensina:** Armazenamento NoSQL de alta performance para objetos complexos.
* **Cenário:** Um CRUD (Criar, Ler, Atualizar, Deletar) de Tarefas. Demonstra como o Hive consegue salvar instâncias inteiras do modelo `Task` de forma quase instantânea, sem precisar de queries de conversão manuais.

#### 4. Sqflite: Agenda de Contatos
* **O que ensina:** Banco de dados relacional clássico e execução de código SQL.
* **Cenário:** Uma agenda com Nome e Telefone. Demonstra a conversão de Modelos para Mapas (e vice-versa) usando `toMap()` e `fromMap()`. 
* **Dica de Arquitetura:** O Adapter do Sqflite implementa o padrão **Lazy Singleton** para garantir que a conexão com o banco de dados seja aberta apenas uma vez e no exato momento em que for necessária, economizando recursos do celular.

### Como Estudar Este Laboratório?
Navegue pela pasta `lib/` e abra qualquer um dos exemplos. Comece a leitura sempre de "trás para frente": 
1. Olhe o **Adapter** (como o banco funciona).
2. Suba para o **Service** (como a ação é executada).
3. Veja o **Repository** e a **Store** (como o estado é gerenciado).
4. Por fim, olhe a **Page** (como o usuário interage).