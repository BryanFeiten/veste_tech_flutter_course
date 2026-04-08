# Módulo 07: Acessando Recursos Nativos e Armazenamento Offline

Este guia consolida todo o conteúdo do Módulo 07, abrangendo desde os conceitos teóricos de arquitetura Offline-First até a implementação prática dos principais bancos de dados disponíveis para Flutter.

---

## 1. Arquitetura Offline-First: Resiliência e Gestão de Estado Local

### O Conceito
**Offline-First** é um paradigma onde a fonte da verdade primária do aplicativo não é a Nuvem (API), mas sim o **Banco de Dados Local**. A Nuvem passa a ser tratada apenas como um serviço de *sincronização*.

O objetivo é evitar que o usuário encontre telas de "Sem Conexão" ou carregamentos infinitos, permitindo que ele continue navegando nos dados que já foram baixados anteriormente.

### Estratégias de Entrega de Dados (UI)

Quando temos um Banco Local e uma API Remota, o `Repository` orquestra a entrega:

#### Abordagem 1: Cache-First (Recomendado para velocidade)
1. A Store pede os dados ao `Repository`.
2. O `Repository` verifica o Banco Local. Se houver dados, retorna-os imediatamente.
3. Se não houver, busca na API, salva no Banco Local e então retorna para a Store.

#### Abordagem 2: Sincronização via Callback (Para atualizações em tempo real)
Permite mostrar o cache instantaneamente e atualizar a tela assim que a API responder.
- **Store:** Define uma função de atualização (callback).
- **Repository:** 
    1. Busca no cache $\rightarrow$ chama o callback $\rightarrow$ UI atualiza.
    2. Busca na API $\rightarrow$ salva no banco $\rightarrow$ chama o callback $\rightarrow$ UI atualiza com dados frescos.

#### Abordagem 3: Reatividade via Streams (Avançado)
Existe ainda a abordagem utilizando `Streams`, onde o `Repository` expõe um fluxo de dados constante. A UI (via Store) se inscreve nessa Stream e recebe imediatamente a informação do banco local. Assim que a requisição da API for finalizada e o banco for atualizado, o `Repository` emite o novo valor através da Stream, atualizando a tela automaticamente. Esta é a abordagem mais indicada para aplicações de alta complexidade e tempo real.
*Nota: Devido à complexidade, não aprofundaremos nesta abordagem agora, mas é importante saber que ela existe.*

---

## 2. Guia Detalhado de Persistência

A escolha da ferramenta depende do tipo de dado, necessidade de performance e segurança. Abaixo, a análise detalhada de cada opção.

### 🛠 SharedPreferences
**Como funciona?**
$\rightarrow$ É um banco chave-valor que armazena dados em tipos primitivos (`String`, `bool`, `int`, `double` e `List<String>`).

**Para que serve**
$\rightarrow$ Guardar preferências básicas (Idioma, Tema, flags de Onboarding, último item selecionado).

**Quando evitar**
$\rightarrow$ Informações complexas (classes inteiras) ou dados sensíveis.

**Curva de Aprendizado**
$\rightarrow$ Baixíssima. Não exige config nativa nem geração de código.

**Variantes Importantes:**
- **Sync (Síncrono):** Operações imediatas, mas podem travar a UI se o dado for grande.
- **Async (Assíncrono):** Recomendado para a maioria dos casos, utilizando `await` para não bloquear a thread principal (`SharedPreferences.getInstance()`).

### 🔐 FlutterSecureStorage
**Como funciona?**
$\rightarrow$ Uma ponte para o armazenamento seguro nativo do dispositivo (Keychain no iOS e Keystore/EncryptedSharedPreferences no Android).

**Para que serve**
$\rightarrow$ Dados que causariam problemas reais se vazassem (Tokens JWT, senhas, chaves de criptografia).

**Quando evitar**
$\rightarrow$ Preferências simples. É mais lento que o SharedPreferences devido ao processo de criptografia/descriptografia.

**Curva de Aprendizado**
$\rightarrow$ Baixa. Sintaxe similar ao SharedPreferences.

### 📦 Hive / Hive_ce
**Como funciona?**
$\rightarrow$ Banco NoSQL escrito totalmente em Dart. Armazena dados em "Boxes" (caixas) e permite salvar objetos complexos (classes) em formato binário.

**Para que serve:**
$\rightarrow$ Cache de respostas de API, carrinhos de compras offline, favoritos.

**Quando evitar:**
$\rightarrow$ Dados altamente relacionais que exijam joins complexos entre várias tabelas.

**Curva de Aprendizado:**
$\rightarrow$ Média. Requer o uso de `build_runner` para gerar `TypeAdapters` ao salvar classes customizadas.

### 🗄 Sqflite
**Como funciona?**
$\rightarrow$ Implementação do SQLite para Flutter. Banco relacional clássico utilizando a linguagem SQL.

**Para que serve**
$\rightarrow$ Sistemas offline-first robustos, apps com buscas complexas, ordenações e filtros avançados no local.

**Quando evitar**
$\rightarrow$ Coisas simples. Usar Sqflite para salvar a cor do tema é excessivo.

**Curva de Aprendizado**
$\rightarrow$ Alta. Exige conhecimento de SQL, escrita de queries manuais (sujeitas a erros de digitação) e bastante boilerplate de configuração.

---

## 3. Laboratório Prático: `database_examples`

Para aplicar esses conceitos, utilizamos um laboratório isolado focado na separação de responsabilidades, garantindo que a troca de um banco de dados não quebre a regra de negócio.

### A Estrutura de Camadas (Arquitetura)

Para garantir a escalabilidade e manutenibilidade, seguimos este fluxo:

| Camada | Responsabilidade | Detalhe |
| :--- | :--- | :--- |
| **Adapter** | Infraestrutura | Único que importa o pacote do banco. Executa queries brutas e esconde a implementação. |
| **Service** | Caso de Uso | Representa a ação de negócio (ex: `SalvarContatoService`). Usa o Adapter para persistir dados. |
| **Repository** | Orquestração | Decide se busca dados no banco local, na API remota ou entrega o cache existente. |
| **Store** | Estado (MobX) | Gerencia o estado da tela. Usa propriedades privadas e getters para garantir encapsulamento. |
| **Page** | Interface (View) | Exibe a UI e chama as ações da Store. **Zero regra de negócio aqui.** |

### Cenários Implementados no Laboratório

- **SharedPreferences:** Salvamento simples do nome do usuário.
- **Flutter Secure Storage:** Armazenamento seguro de Tokens JWT.
- **Hive CE:** CRUD completo de Tarefas (`Task`), demonstrando a persistência de objetos complexos.
- **Sqflite:** Agenda de contatos com SQL, demonstrando `toMap`/`fromMap` e o padrão **Lazy Singleton** para conexão.

### Dica de Estudo
Ao analisar o código do laboratório, leia de "trás para frente" para entender a dependência:
`Adapter` $\rightarrow$ `Service` $\rightarrow$ `Repository/Store` $\rightarrow$ `Page`.
