## Desafio de consumo de um end-point que liste as lojas/ponto de venda da Veste S.A.

https://5acf-189-6-235-147.ngrok-free.app (temporário)
- Você pode rodar o veste_maps_api (mesmo nível da pasta do app) e servir a porta usando o ngrok para consumir do seu próprio celular. Ou configurar a rede para acessar via localhost

```json
{
	"id": 1,
	"nome": "Veste S.A. - Av. Paulista (SP)",
	"latitude": -23.561684,
	"longitude": -46.655981
}
```

### Requisitos
1. Consumir uma api (ngrok) com um json
2. Tratar os possíveis estados:
    1. Carregamento
    2. Sucesso
    3. Erro
3. Encontrar a localização atual do usuário e calcular:
    1. A distância até as lojas, afim de encontrar a loja mais próxima
4. Determinar qual a loja mais próxima do usuário
    1. Mostrar um marcador diferente nessa loja
    2. Ao clicar nesse marcador, mostrar um modal informando dados daquela loja

### Extra
- Oferecer a opção de abrir o Maps com uma rota para o endereço dentro do modal de informações da loja
- Mostrar a distância em km até a loja e oferecer a informação de que a loja mais próxima está muito longe/ser inteligente com as opções

Chave de API para a aula: AIza...3pl (**INVALIDADA PÓS AULA**)

Lojas:
```json
[
  {
    "id": 1,
    "nome": "Veste S.A. - Av. Paulista (SP)",
    "latitude": -23.561684,
    "longitude": -46.655981
  },
  {
    "id": 2,
    "nome": "Veste S.A. - Copacabana (RJ)",
    "latitude": -22.971177,
    "longitude": -43.182543
  },
  {
    "id": 3,
    "nome": "Veste S.A. - Savassi (MG)",
    "latitude": -19.938600,
    "longitude": -43.932218
  },
  {
    "id": 4,
    "nome": "Veste S.A. - Pelourinho (BA)",
    "latitude": -12.971842,
    "longitude": -38.508544
  },
  {
    "id": 5,
    "nome": "Veste S.A. - Boa Viagem (PE)",
    "latitude": -8.118991,
    "longitude": -34.899066
  },
  {
    "id": 6,
    "nome": "Veste S.A. - Aldeota (CE)",
    "latitude": -3.738128,
    "longitude": -38.502322
  },
  {
    "id": 7,
    "nome": "Veste S.A. - Asa Sul (DF)",
    "latitude": -15.823334,
    "longitude": -47.904870
  },
  {
    "id": 8,
    "nome": "Veste S.A. - Batel (PR)",
    "latitude": -25.443150,
    "longitude": -49.280963
  },
  {
    "id": 9,
    "nome": "Veste S.A. - Ponta Negra (AM)",
    "latitude": -3.076629,
    "longitude": -60.088320
  },
  {
    "id": 10,
    "nome": "Veste S.A. - Setor Marista (GO)",
    "latitude": -16.697410,
    "longitude": -49.263889
  },
  {
    "id": 11,
    "nome": "Veste S.A. - Centro Histórico (Porto Alegre)",
    "latitude": -30.033056,
    "longitude": -51.230000
  },
  {
    "id": 12,
    "nome": "Veste S.A. - Shopping Iguatemi (Porto Alegre)",
    "latitude": -30.027878,
    "longitude": -51.163351
  },
  {
    "id": 13,
    "nome": "Veste S.A. - Centro (Canoas)",
    "latitude": -29.919722,
    "longitude": -51.180278
  },
  {
    "id": 14,
    "nome": "Veste S.A. - ParkShopping (Canoas)",
    "latitude": -29.931750,
    "longitude": -51.171480
  },
  {
    "id": 15,
    "nome": "Veste S.A. - Centro (São Leopoldo)",
    "latitude": -29.761000,
    "longitude": -51.144400
  },
  {
    "id": 16,
    "nome": "Veste S.A. - Bourbon Shopping (São Leopoldo)",
    "latitude": -29.771210,
    "longitude": -51.134560
  },
  {
    "id": 17,
    "nome": "Veste S.A. - Centro (Novo Hamburgo)",
    "latitude": -29.682330,
    "longitude": -51.131150
  },
  {
    "id": 18,
    "nome": "Veste S.A. - I Fashion Outlet (Novo Hamburgo)",
    "latitude": -29.702580,
    "longitude": -51.136280
  },
  {
    "id": 19,
    "nome": "Veste S.A. - Centro (Campo Bom)",
    "latitude": -29.676640,
    "longitude": -51.053890
  },
  {
    "id": 20,
    "nome": "Veste S.A. - Centro (Sapiranga)",
    "latitude": -29.638520,
    "longitude": -51.006930
  }
]
```
