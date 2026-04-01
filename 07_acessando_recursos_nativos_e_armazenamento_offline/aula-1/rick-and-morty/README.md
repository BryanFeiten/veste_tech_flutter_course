## Rick and Morty (Módulo 6 - Animações Implícitas e Consumo de API)


Integrar com um serviço (API externa)

## Requisitos
1. Página inicial (Home)
  1.1. Campo de pesquisa (busca apenas no que está local)
     1.1.1. Pelo nome
     1.1.2. Pelo Identificador
  1.2. Dois tipos de visualização:
    1.2.1. Listagem
    1.2.2. Grade
  1.3. Quando o usuário chegar ao final da lista, devemos buscar os personagens seguintes

2. Página para detalhes (Details)
  2.1. Abre quando o usuário clicar em um personagem a partir da Home

3. Sobre o consumo da API
  3.1. Paginação de 20 em 20

4. Sobre a exibição do personagem
  4.1. Deve ter o background baseado na cor predominante da imagem


---

## Api Rick and Morty
Baseurl: https://rickandmortyapi.com/api

**Listagem de pesonagens**
Rota: "/character"

**Dados Recebidos**
```json
// Retorno do backend
{
  "info": {
    "count": 826,
    "pages": 42,
    "next": "https://rickandmortyapi.com/api/character/?page=2",
    "prev": null
  },
  "results": [
    {
      "id": 1,
      "name": "Rick Sanchez",
      "status": "Alive",
      "species": "Human",
      "type": "",
      "gender": "Male",
      "origin": {
        "name": "Earth",
        "url": "https://rickandmortyapi.com/api/location/1"
      },
      "location": {
        "name": "Earth",
        "url": "https://rickandmortyapi.com/api/location/20"
      },
      "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
      "episode": [
        "https://rickandmortyapi.com/api/episode/1",
        "https://rickandmortyapi.com/api/episode/2",
        // ...
      ],
      "url": "https://rickandmortyapi.com/api/character/1",
      "created": "2017-11-04T18:48:46.250Z"
    },
    // ...
  ]
}

// Character
{
  "id": 2,
  "name": "Morty Smith",
  "status": "Alive",
  "species": "Human",
  "type": "",
  "gender": "Male",
  "origin": {
    "name": "Earth",
    "url": "https://rickandmortyapi.com/api/location/1"
  },
  "location": {
    "name": "Earth",
    "url": "https://rickandmortyapi.com/api/location/20"
  },
  "image": "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
  "episode": [
    "https://rickandmortyapi.com/api/episode/1",
    "https://rickandmortyapi.com/api/episode/2",
    // ...
  ],
  "url": "https://rickandmortyapi.com/api/character/2",
  "created": "2017-11-04T18:50:21.651Z"
}
```