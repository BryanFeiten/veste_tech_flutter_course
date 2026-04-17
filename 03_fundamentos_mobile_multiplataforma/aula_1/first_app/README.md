## Explicação básica (de cima para baixo)

**.dart_tool**
- Pasta de configuração interna do dart

**.idea**
- Pasta de configuração do ambiente do Android Studio, para quando o projeto for aberto por lá

**.vscode**
- Pasta de configuração do projeto para o VsCode

**android**
- Configuração do projeto android
- Configurações nativas de permissionamento
- Configuração de dependências nativas
- Código nativo Android (Kotlin/Java)
- Arquivos importantes (na base):
    - `android/build.gradle.kts`
        Arquivo de configuração android nível = projeto
        É um arquivo que basicamente direciona onde será o diretório de trabalho e como as tasks de build devem funcionar
    - `android/gradle.propeties`
        Arquivo de configuração do build (alocação de memória, disponibilidade de RAM, entre outras configurações disponibilizadas para o build)
        Um exemplo aqui é que se o teu projeto estiver necessitando da liberação de mais RAM para testar alguma parte específica ou para conseguir alocar memória na hora da compilação do executável (apk ou aab), a definição deverá ser feita aqui. Além de poder ativar funcionalidades de assinatura do build ou formas de compilação específicas com outro tipo de processamento.
    - `android/local.propeties`
        Arquivo que guarda as variáveis de ambiente locais (geralmente ignorado no `.gitignore`), é um arquivo para configurar as variáveis nativas android da aplicação, caso seja necessário. As variáveis são "mascaradas" após o build e não ficam disponíveis no executável final
    - `android/key.propeties`
        Arquivo que também guarda variáveis de ambiente, porém este geralmente é compartilhado entre o time, apesar de também ser ignorado no `.gitignore`.
    - `android/settings.gradle.kts`
        Arquivo de configurações da interatividade do framework com os plugins (aqui também ocorre a injeção dos plugins nativos)
- Arquivos importantes (dentro do app)
    - `android/app/build.gradle.kts`
        Arquivo de configuração da aplicação em si, como o app será construído nativamente, quais variáveis estarão disponíveis, como elas serão acessadas, qual nome do app (namespace) na assinatura, qual versão do Java será utilizada, bem como as configurações de tipos de build, o que deve ser injetado e ficar disponível.
        Também é possível adicionar a versão mínima do android que o projeto dará suporte;
        Também é possível adicionar a versão máxima do android que o projeto dará suporte;
        E por fim, é possível adicionar a versão "alvo" para a compilação, por exemplo, se a maioria dos clientes usam android 15, adicionar o `targetSdk = 35` (equivalente ao android 15), fará essa versão de android ser priorizada para otimizações internas;
    - `android/app/src/main/AndroidManifest.xml`
        Aqui configuramos principalmente as permissões do Android (agora só usaremos isso);
        Mas também podemos adicionar pontos de entrada para a aplicação (quando o usuário clicar em "compartilhar" uma foto, o app pode aparecer como um app que pode abrir com isso para fazer alguma coisa, ou mesmo, quando o usuário copiar um texto, o nosso app pode aparecer como algo para processar esse texto. Tem várias possibilidades aqui);
        Também temos a possibildade de cadastrar deep-links, que é uma maneira que o Android tem de processar a abertura de um link (se o usuário tentar abrir um link que está cadastrado para abrir nosso app, ele vai abrir diretamente nosso app, e não o navegador (padrão))
    - `android/app/src/main/kotlin/{NOME_DO_PROJETO}/{NOME_DO_APP}/MainActivity.kt`
        Arquivo que processa o código nativo, caso seja necessário adicionar algo. Como escolhemos "Kotlin" como padrão android, ele terá extensão "kt"
        Podemos trabalhar com N arquivos, mas esse é o "entry-point" do nativo para processamentos.
    - `android/app/src/main/res/`
        São os arquivos de configuração visual do ícone do app no Android, Tela de Splash/Abertura nativa (mostra antes de carregar o app) e quaisquer outras variáveis xml que você deseje adicionar

**assets**
- Pasta utilizada para guardar os arquivos (imagens, fontes, etc) utilizados dentro do projeto flutter.
- Poderíamos ter níveis dentro dela, como `assets/images/logos/...` ou `assets/fonts/...`, mas como temos poucos arquivos, podemos usar com um nível apenas

**build**
- Pasta utilizada para gerar os executáveis (no nosso caso ela está guardando apenas o build de debugging, mas quando geramos um apk, aab, ipa ou archive, ele fica dentro dela, mas em caminhos diferentes)

**ios**
- `ios/Runner/Assets.xcassets/`
    Pasta que guarda o ícone do app (`AppIcon.appiconset`) e também a imagem da tela de Splash/Abertura nativa (`LaunchImage.imageset`)
- `ios/Runner/AppDelegate.swift`
    Arquivo de código nativo, podemos implementar código em Swift dentro desse arquivo e rodar dentro do projeto via PlatformChannel (no Android isso também é possível (em Kotlin/Java))
- `ios/Runner/Info.plist`
    Aqui ficam variáveis de ambiente iOS, bem como configurações de permissionamento, descrições de uso das permissões, configurações de build, e algumas outras secundárias
- `ios/Runner.xcworkspace`
    Arquivo que poderemos executar dentro do XCode para buildar o projeto por lá, caso tenhamos problemas nativos com o iOS

**lib**
- Pasta onde concentraremos todo o código dart do aplicativo (telas, componentes, serviços, repositórios, controle de estado, adaptações, etc)

**notas**
- Utilizei apenas para deixar o que montamos no excalidraw, e também o print da tela que tínhamos de objetivo

**.gitignore**
- Arquivo para ignorar outros arquivos baseados no nome, padrão de nome ou expressões regulares (REGEX)

**.metadata**
- Arquivo de controle interno do flutter

**analysis_options.yaml**
- Arquivo de configuração de regras e padrões dentro do projeto, a parte mais usada é o linter

**{NOME_DO_APP}.iml**
- Arquivo de controle interno do flutter

**pubspec.lock**
- Arquivo que gerencia o versionamento e hash das depdendências, facilitando para não necessitar do download novamente, a menos que a dependência tenha atualizações de versão disponíveis
- Não mexemos manualmente nesse arquivo, exceto em casos extremamente específicos

**pubspec.yaml**
- Arquivo de gerenciamento/configuração das dependências flutter, além do versionamento do projeto, dependências de desenvolvimento, injeção de assets, fontes e outras configurações básicas, como nome, descrição, etc.

**README.md**
- Arquivo para entendimento do projeto (geralmente quando publicamos algo no Github, deixamos um exemplo, explicações ou declarações de como usar o projeto, neste arquivo)