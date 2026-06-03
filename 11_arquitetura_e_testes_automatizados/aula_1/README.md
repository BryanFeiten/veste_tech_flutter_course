## Coesão e Acoplamento

SOLID
S -> SRP -> Solid Responsability

Coesão (O foco): É o quão focada uma classe/módulo/função é em fazer algo. Segundo o princípio da Responsabilidade Única, ela deve ser modificada apenas por um motivo (modificação de um "ator");

Acoplamento (A dependência): É a medida de quanto uma classe sabe sobre a outra. Um acoplamento alto significa que qas classes estão "coladas".


## Analogias
```dart
// Baixa coesão

class ChefFazTudo {
    void atenderOCliente(String mesa) {
        // Anota o pedido
    }

    void cozinhar(String prato) {
        // cozinhou um alimento
    }

    void lavaALouca() {
        // Lavando a louça
    }

    void cobrarCliente() {
        // -> Maquininha quebrou 
        // Cobrou o cliente
    }
}

/// ===========================

// Alta coesão
// Solução
class Garcom {
    void atenderOCliente(String mesa) {
        // Anota o pedido
    }
}

class ChefFocado {
    void cozinhar(String prato) {
        // cozinhou um alimento
    }
}

class Caixa {
    void cobrarCliente(String prato) {
        // Cobrou o cliente
    }
}
```


---

```dart
// Acoplamento: Alto
class FacaTramontina {
    void afiar() {
        print('afiando faca');
    }
}

class Mariazinha {
    void cortarLegumes(String legume) {
        print('Cortando $legume');
    }
}

class ChefAcoplado {
    void prepararSopa() {
        final faca = FacaTramontina();
        final ajudante = Mariazinha();

        faca.afiar();
        ajudante.picar('Cebola');

        print('Fazendo a sopa');
    }
}

// Acoplamento baixo
abstract class IProcessadorDeAlimentos {
    void cortar(String alimento);
}

class MariaComAFacaNinja implements IProcessadorDeAlimentos {
    @override
    void cortar(String alimento) {
        print('Maria picou o $alimento com agilidade');
    }
}

class RoboProcessadorTabajara2000 implements IProcessadorDeAlimentos {
    @override
    void cortar(String alimento) {
        print('O robô tabajara 2000 picou o $alimento com super agilidade');
    }
}

class ChefDesacoplado {
    final IProcessadorDeAlimentos _processador;

    const ChefDesacoplado(this._processador);

    void prepararSopa() {
        _processador.cortar('Cebola');
        print('Fazendo a sopa');
    }
}

// -----------------------------------------------------

// Baixa coesão, o chef faz 2 coisas difrentes (corta e prepara a sopa)
// Baixo acoplamento pois não depende de ninguém
class ChefEnganador implements IProcessadorDeAlimentos {
    @override
    void cortar(String alimento) {
        print('O chef picou o $alimento');
    }

    void prepararSopa() {
        this.cortar('Cebola');
        print('Fazendo a sopa');
    }
}

// ------------------------------------------

/// O ChefMultipreparos é Coeso?
/// - Baseado no princípio SRP, é algo especialista em algo
/// -> único motivo para alteração: Adicionar uma nova forma de preparo, se o cardápio do restaurante mudar, crescer, etc...
/// 

class ChefMultipreparos {
    void fritarOvo() {
        print('fritando ovo');
    }

    void fazerSobremesa() {
        print('Fazer sobremesa');
    }

    void fazerSopa(IProcessadorDeAlimentos processador) {
        print('Iniciando sopa');

        processador.cortar('Cebola');
        processador.cortar('Cenoura');
        processador.cortar('Batata');

        print('Sopa finalizada');
    }
}


// Classe coesa pois não fere o princípio da SRP
class UserRepository {
    final GetUserService _getUserService;
    final UserService userService;

    Future<User> getUser(String uid) async {
        final user = await _getUserService(uid);

        return user;
    }
    Future<void> createUser(User user);
    Future<void> updateUser(User user);
    Future<void> deleteUser(String uid);
}

class UserService {
    final IHttpAdapter _httpClient;

    Future<User> getUser(String uid);
    Future<void> createUser(User user);
    Future<void> updateUser(User user);
    Future<void> deleteUser(String uid);
}
```