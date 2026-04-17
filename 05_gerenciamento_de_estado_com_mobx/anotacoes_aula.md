## 1. Stateless v.s. Statefull

- StatelessWidget: Não possui alteração de estado -> Como ele nascer, ele morre
- StatefullWidget: Possui um estado que é alterado e reconstruído internamente (método build roda novamente quando o setState é chamado)

## 2. Ciclo de vida de um Widget
1. StatelessWidget:
    - build()
2. StatefullWidget:
    - Possui um método createState que armazena o estado do widget
    - O estado do widget tem os seguintes métodos:
        - initState()
        - didChangeDependencies() -> Verifica se precisa de alteração com base nos dados recebidos pelo widget pai

        - build() -> Constrói os dados na tela
        - setState() -> Marca o estado de tela como "desatualizado"/"dirty"
        - didUpdateWidget() -> Marca o estado de tela como "atualizado"/"clean"

        - didChangeDependencies()
        - dispose()