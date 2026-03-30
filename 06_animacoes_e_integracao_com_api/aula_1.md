# Consumo de APIs

## 1. O que é uma API?
API = Application Programming Interface

- Serviço externo utilizado na nossa aplicação
- Interação entre códigos
- Garçom?

## 2. O que é HTTP/HTTPS?
* É um protocolo de comunicação utilizado para conectar diferentes computadores utilizando um empacotamento de dados que permite trafegar dados corretamente entre 2 pontos distintos apenas com o endereço deles. No HTTPS nós temos também uma criptografia desses dados, estruturada em camadas, então é garantido que somente a última camada do ponto de destino conseguirá desempacotar e decifrar esses dados. Isso tudo por meio de um Hand-shake que faz a troca de chaves para iniciar uma comunicação segura.



## 3. O que precisamos para fazer uma chamada HTTP?
* Cliente HTTP
* Endereço que queremos acessar (na porta de quem você quer bater?)
* Informações que vamos enviar
https://{host}/{path}
    ?
    // Query 1
    uid=123
        &
    // Query 2
    name=algum-nome
{
    headers: {
        'Authentication': 'Bearer xxxxxxx.xxxxxxx.xxxxx',
        'Content-Type': 'json',
        'x-auth': 'outro token'
    },
    body: {
        name: 'Bryan',
        password: 'Bryan123',
        age: 18
    },
}



## 4. Quais as formas de passar informações?
* Header (Cabeçalho)
* Body (Corpo da requisição)
* Query (Junto com o endereço mesmo, irá no final (dado público))



## 5. Formas diferentes de requisição (Verbo/Método HTTP)
* GET -> Utilizado para buscar/listar dados
* POST -> Utilizado para enviar dados (criação de usuário por exemplo)
* DELETE -> Utilizado para deletar um dado específico
* PUT -> Utilizado para atualizar um dado totalmente
* PATCH -> Utilizado para atualizar um dado parcialmente



## 6. A resposta

### 6.1. Quais os códigos de resposta possível? (https://contabo.com/blog/http-response-codes-server-statuses)
* 200 -> Sucesso
    * 201 -> Criado com sucesso
    * 204 -> Sucesso sem conteúdo
* 300 ->  300 a 399 Indicam redirecionamento ou alteração no endereço desse conteúdo
* 400 - 499 -> Códigos de erro por parte do cliente
    * 400 -> Bad request (Requisição mal formulada)
    * 401 -> Unauthorized (Não autorizado)
    * 403 -> Forbidden (Proibido)
    * 404 -> Not Found (Conteúdo não encontrado)
    * 408 -> Request Timeout (Excedeu o tempo de conexão limite)
    * 413 -> Payload Too Large (Conteúdo enviado excedeu o limite máximo de tamanho)
    * 429 -> Too Many Requests (Excedeu o limite de requisições)
* 500 - 599 -> Erros do lado do servidor
    * 500 -> O servidor pegou fogo
    * 502 -> Bad Gateway (Servidor não conseguiu iniciar)
    * 504 -> Timeout do lado do servidor

### 6.2. Onde a resposta da requisição vem?
* Assim como a solicitação envia no body (corpo), o resultado vem dentro do body do retorno, então
