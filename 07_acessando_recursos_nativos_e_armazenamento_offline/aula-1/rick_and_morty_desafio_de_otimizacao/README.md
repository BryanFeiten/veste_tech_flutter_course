## 🐛 Desafio de Otimização

Esse é o aplicativo base do Rick and Morty, mas estamos com um problema de otimização crítico. Precisamos que você identifique o gargalo e resolva a causa raiz disso.

![Problema](./assets/problema-de-otimizacao.gif)

### 🔍 O Problema
Ao rolar a lista de personagens, você notará que o aplicativo sofre com "janks" (engasgos). A interface não está fluida e a taxa de quadros cai. O problema não está diretamente na configuração do scroll em si (`ListView`/`GridView`), mas sim em um efeito colateral que ocorre durante a exibição dos itens.

### 🛠️ Sua Missão
Para encontrar o problema, adicione logs, verifique a contagem de *rebuilds* (recomendamos fortemente o uso do Flutter DevTools), adicione breakpoints e analise a pilha de chamadas (call-stack). Verifique se as chamadas estão acontecendo no momento correto e como podemos otimizar a renderização para que o scroll fique fluido.

### 💡 Dicas
* **Reatividade:** Preste atenção em como o gerenciador de estado (MobX) está observando a lista. O que acontece com a árvore de widgets quando um item da lista sofre uma mutação após já ter sido inicialmente renderizado?
* **Separação de Responsabilidades:** Sinta-se totalmente livre para modificar a classe `Character`. Questione-se: toda informação visual de um Card precisa obrigatoriamente fazer parte da model de dados da API?
* **Ciclo de Vida:** Avalie o escopo das operações assíncronas de UI. Onde elas devem iniciar e quem elas devem atualizar quando terminarem?

Identificar e corrigir *rebuilds* desnecessários é uma habilidade fundamental para garantir a performance e a fluidez em aplicativos mobile. Boa caçada!

### 🚀 Como Entregar
Assim que você conseguir diagnosticar o problema, modificar o código e fazer o scroll rodar de forma fluida, **abra um Pull Request (PR)** para este repositório. O PR será avaliado não apenas pelo funcionamento final, mas pela qualidade e limpeza da refatoração.