# Navegação e Rotas no Flutter

## 1. Conceitos Fundamentais

Antes de codar, é preciso entender como o Flutter gerencia as telas. Ele utiliza uma estrutura de dados chamada **Pilha (Stack)**.

Imagine uma pilha de pratos lavados:
* Você só coloca pratos novos **em cima** (Push).
* Você só tira pratos **de cima** (Pop).
* A tela que o usuário está vendo é sempre o "prato" do topo.

### 1.1. Tipos de Gerenciamento
Existem três formas principais de gerenciar essa pilha no Flutter:

1.  **Imperativa (Navigator 1.0):**
    * É o feijão com arroz. Você diz explicitamente "Empurre essa tela" ou "Remova essa tela".
    * Simples de aprender, mas pode ficar bagunçado em apps complexos com deeplinks.
    * *Foco da nossa aula hoje.*

2.  **Declarativa (Navigator 2.0 / Router API):**
    * Baseada no estado do app. A pilha de telas reflete uma lista de objetos.
    * Extremamente verbosa e complexa. Quase ninguém usa "pura".

3.  **Pacotes de Roteamento (go_router, auto_route, beamer):**
    * É a evolução. O GoRouter é mantido pelo Google, simplifica a navegação declarativa.

---

## 2. Navigator 1.0: O "Clássico"

O `Navigator` é o widget que gerencia a pilha de rotas.

### 2.1. Métodos Principais (Manipulando a Pilha)

#### 2.1.a. Push (Adicionar)
Coloca uma nova tela sobre a atual. O botão "Voltar" aparece automaticamente na AppBar.
* **Uso:** Ir de uma lista para os detalhes.

```dart
Navigator.of(context).push(
  MaterialPageRoute(builder: (context) => DetalhesPage()),
);
```

#### 2.1.b. Pop (Remover)
Remove a tela atual da pilha e volta para a anterior.
* **Uso:** Botão de "Cancelar" ou "Voltar" customizado.

```dart
Navigator.of(context).pop();
```

#### 2.1.c. PushReplacement (Substituir)
Remove a tela atual e coloca a nova no lugar. O usuário **não consegue voltar** para a anterior.
* **Uso:** Tela de Login -> Tela Home.

```dart
Navigator.of(context).pushReplacement(
  MaterialPageRoute(builder: (context) => HomePage()),
);
```

#### 2.1.d. PushAndRemoveUntil (Limpar tudo e ir)
Remove todas as telas da pilha (ou até encontrar uma específica) e adiciona a nova.
* **Uso:** Logout (Limpa histórico e volta para Login).

```dart
Navigator.of(context).pushAndRemoveUntil(
  MaterialPageRoute(builder: (context) => LoginPage()),
  (route) => false, // Remove tudo
);
```

---

## 3. Troca de Dados entre Telas

### 3.1. Enviando Dados (Parâmetros)
A forma mais segura no Navigator 1.0 é passar via construtor da classe.

```dart
// Na tela de origem:
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => PerfilPage(usuario: usuarioLogado),
  ),
);

// Na tela de destino (PerfilPage):
class PerfilPage extends StatelessWidget {
  final Usuario usuario;
  const PerfilPage({required this.usuario});
  // ...
}
```

### 3.2. Retornando Dados (Pop com Resultado)
Às vezes você abre uma tela para selecionar algo e quer a resposta de volta.

```dart
// 1. Quem CHAMA fica esperando (await):
void selecionarContato() async {
  final result = await Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => SelecaoContatoPage()),
  );
  
  if (result != null) {
    print("Contato selecionado: $result");
  }
}

// 2. Quem VOLTA envia o dado no pop:
Navigator.of(context).pop("Maria da Silva");
```

---

## 4. Rotas Nomeadas vs Anônimas

### 4.1. Configuração

```dart
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => HomePage(),
    '/detalhes': (context) => DetalhesPage(),
  },
);

// Navegando:
Navigator.of(context).pushNamed('/detalhes');
```

### 4.2. Prós e Contras

* **Rotas Anônimas (Push com MaterialPageRoute):**
    * **Prós:** Tipagem forte (passa objetos direto), fácil de entender.
    * **Contras:** Acoplamento entre telas (importar classes).

* **Rotas Nomeadas (PushNamed):**
    * **Prós:** Desacoplamento, centralização no main.dart.
    * **Contras:** Passagem de argumentos perde a tipagem (vira Object), difícil manutenção.

> **Veredito:** Para apps pequenos, prefira **Rotas Anônimas**. Para apps grandes, use **GoRouter**.

---

## 5. O Futuro: GoRouter (Breve intro)

O `go_router` simplifica a navegação baseada em URL.

```dart
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) => DetailsScreen(),
    ),
  ],
);

// Uso:
context.push('/details');
```