### 1. Explicação sobre Coesão e Acoplamento
Primeiro explicar o conceito teórico de ambos, o que é coesão e o que é acoplamento

Coesão (O foco): É a medida de quão focada uma classe, módulo ou função é. Uma classe com alta coesão faz apenas uma coisa e faz muito bem (Princípio da Responsabilidade Única - SRP). Se você precisa usar a palavra "E" para explicar o que uma classe faz ("Ela busca as categorias na API e salva no banco local"), ela provavelmente tem baixa coesão.

Acoplamento (A dependência): É a medida de quanto uma classe sabe sobre outra. Um acoplamento alto significa que as classes estão "coladas"; se você alterar o funcionamento interno de uma, a outra quebra inevitavelmente. Baixo acoplamento significa que as classes conversam através de contratos (interfaces), sem se importar com os detalhes de como o outro lado implementa a solução.

### 2. Usando analogias do mundo real para explicar
Usar exemplos para explicar ambos
- Coesão:
	- Imaginem um Chef de cozinha que vai abrir a porta para os clientes, leva eles até a mesa, tira o pedido, vai até a cozinha, corta os legumes, frita a carne, prepara o prato, lava a louça suja, leva o pedido até o cliente, e no final ainda vai fechar a conta do cliente no caixa.
		- Ele faz de tudo um pouco, e se a maquininha de cartão quebrar ele para a cozinha pois está atendendo no caixa.
	- Pensando em uma alta coesão, o chef apenas cozinhará, ele não fará nada além disso
	- Essa é a coesão, ela é um indicador de quantas coisas nossa função/classe/regra está fazendo. Se é mais de uma, poderia ser quebrado em duas certamente

```dart
// ❌ BAIXA COESÃO: A classe tem muitas responsabilidades diferentes.
class ChefFazTudo {
  void atenderCliente(String mesa) {
    print('Anotando pedido da $mesa no caderninho...');
  }

  void cozinhar(String prato) {
    print('Cortando cebola, fritando carne e preparando $prato...');
  }

  void lavarLouca() {
    print('Limpando os pratos sujos na pia...');
  }

  void cobrarCliente(double valor) {
    // Se a API da maquininha de cartão cair, a cozinha inteira para!
    print('Passando o cartão e cobrando R\$ $valor...');
  }
}

// ✅ ALTA COESÃO: Cada classe tem uma única responsabilidade.
class Garcom {
  String anotarPedido(String mesa) => 'Pedido da $mesa';
}

class ChefFocado {
  void cozinhar(String pedido) {
    print('Focado apenas em preparar o $pedido com excelência!');
  }
}

class Caixa {
  void cobrar(double valor) {
    print('Processando pagamento isoladamente...');
  }
}
```


- Acoplamento: 
	- Alto Acoplamento
		- O mesmo Chef de cozinha do outro exemplo exige que a cebola seja cortada por um assistente específico (o "Joãozinho") usando a faca da marca X.
		- Se o Joãozinho ficar doente ou a faca quebrar, o Chef não consegue trabalhar pois está ACOPLADO à implementação exata (Joãozinho + Faca X).
	
	- No Cenário de Baixo Acoplamento o Chef diz: "Preciso de 1kg de cebola picada" (o Contrato/Interface). Ele não quer saber se foi o Joãozinho, a Maria ou um robô processador de alimentos que picou a cebola. Desde que entreguem a cebola picada (cumpram o contrato), o Chef faz o trabalho dele.


```dart
// Dependências concretas e rígidas
class Joaozinho {
  void picar(String alimento) => print('Joãozinho picando $alimento...');
}

class FacaMarcaX {
  void afiar() => print('Afiando a Faca X...');
}

// ❌ ALTO ACOPLAMENTO: O Chef instanciou os detalhes dentro dele.
class ChefAcoplado {
  void prepararSopa() {
    // O Chef está "preso" (acoplado) ao Joãozinho e à Faca X.
    final faca = FacaMarcaX(); 
    final assistente = Joaozinho();

    faca.afiar();
    assistente.picar('Cebola');
    
    print('Fazendo a sopa...');
  }
}


/// ----------------------------------------------

// 1. O Contrato (Interface)
abstract class IProcessadorDeAlimentos {
  void processar(String alimento);
}

// 2. As várias implementações possíveis (Baixo nível)
class MariaComFacaNinja implements IProcessadorDeAlimentos {
  @override
  void processar(String alimento) => print('Maria picou $alimento rápido!');
}

class RoboProcessadorTabajara2000 implements IProcessadorDeAlimentos {
  @override
  void processar(String alimento) => print('Robô triturou $alimento em 1 segundo!');
}

// ✅ BAIXO ACOPLAMENTO: O Chef depende da abstração, não da implementação.
class ChefDesacoplado {
  final IProcessadorDeAlimentos _processador;

  // O restaurante (framework) injeta quem vai ajudar o Chef hoje
  ChefDesacoplado(this._processador);

  void prepararSopa() {
    // O Chef só manda processar. Não sabe se é a Maria ou o Robô!
    _processador.processar('Cebola');
    print('Fazendo a sopa de forma tranquila...');
  }
}

/// ---------- E se o chefe decidisse que ele não quer depender de ninguém e ele mesmo vai processar o alimento? ----------------

// O Chef tenta ser o maestro e o peão de obra ao mesmo tempo
class ChefEnganador implements IProcessadorDeAlimentos {
  
  // Ele implementa o contrato escondido na própria classe
  @override
  void processar(String alimento) {
    print('O próprio Chef parou tudo para picar $alimento na mão...');
  }

  void prepararSopa() {
    // Ele chama a si mesmo para processar
    this.processar('Cebola');
    print('Agora voltando a fazer a sopa...');
  }
}
```


E se o Chef precisar preparar mais pratos?

```dart
// O contrato continua existindo
abstract class IProcessadorDeAlimentos {
  void processar(String alimento);
}

// ✅ ALTA COESÃO E BAIXO ACOPLAMENTO COM INJEÇÃO DE MÉTODO
class ChefEficiente {
  
  // O Chef não exige o processador no momento em que é contratado (construtor vazio)
  ChefEficiente();

  // Prato 1: Não precisa de ajudante
  void fritarOvo() {
    print('O Chef quebra o ovo e frita rapidamente. Zero dependências extras.');
  }

  // Prato 2: O método exige o ajudante apenas para esta tarefa!
  void prepararSopa(IProcessadorDeAlimentos ajudanteDaSopa) {
    print('Iniciando a sopa...');
    
    // O Chef usa a ferramenta injetada especificamente aqui
    ajudanteDaSopa.processar('Cebola'); 
    ajudanteDaSopa.processar('Alho');
    
    print('Sopa finalizada com a ajuda pontual do processador!');
  }
}
```

Mas isso não fere o SRP?
- O SRP (Responsabilidade única não quer dizer Ação única)
- A definição oficial do Uncle Bob (Robert C Martin) para SRP é: "Uma classe deve ter apenas um motivo para mudar." E, mais modernamente, "Uma classe deve ser responsável por apenas um ator."

No caso do Chef:
- Qual o único motivo para o `ChefEficiente` mudar? 
	- Se as receitas ou o cardápio do restaurante mudarem. (Um único motivo = SRP respeitado)
	- O que poderia fazer o Chef ferir o SRP?
		- Se além de fazer a sopa ele:
			- Calculasse o preço da sopa
			- Servicesse a sopa na mesa
