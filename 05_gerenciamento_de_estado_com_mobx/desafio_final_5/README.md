## Desafio final - Módulo 5

Base: Mercado Livre


### Requisitos base:
1. Página de listagem de produtos
2. Página para o carrinho de compras
3. Simular carregamento de dados usando um Circular progress indicator
4. Utilizar Mobx
5. Listar 15 produtos
    -> Preço deve ir aumentando randomicamente, iniciando com 599,99; Depois 1198,98; Depois 1799,97
6. Regras ao adicionar produto ao carrinho:
    6.a. Se ele já estiver no carrinho de compras, deve aparecer um SnackBar vermelho informando que o produto não foi adicionado;
    6.b. Se o produto não estiver no carrinho de compras, deve aparecer um SnackBar amarelo informando que o produto foi adicionado;
7. Cada produto deve ter uma avaliação de 5 estrelas que o usuário pode interagir e alterar (DICA: Usar o pkg 'rating');
8. Adicionar as Keys para automação

---

### Requisitos implícitos:
1. Deve ser possível pesquisar os produtos (filtro)