## Exercício 1
####  Exercício

Crie uma classe para implementar uma conta corrente. A classe
deve possuir os seguintes atributos:

a. Número da conta  
b. Nome do correntista  
c. Saldo  

Implemente métodos para as seguintes ações:  
a. Alterar nome  
b. Depósito  
c. Saque  

No construtor, o saldo é opcional, com valor padrão zero e os
demais atributos são obrigatórios. A conta não pode ficar com saldo
negativo.


[Link]: https://drive.google.com/file/d/129WHFcLqQoWQ-KDth2zES4q-IXX7ZGS6/view

---

## Exercício 2
#### Exercício

Construa um sistema de gestão de alunos e provas. O aluno deve ter um identificador único, dados pessoais e a sua lista de provas. Já uma prova deve ser composta obrigatoriamente pela disciplina e pela nota alcançada. Deve haver um relacionamento entre prova e aluno, onde o aluno é composto pela sua lista de provas.

O aluno deve ser capaz de registrar uma nova prova, mas não deve ser permitido excluir provas já registradas. Use encapsulamento para garantir esse comportamento.

O aluno também pode consultar a informação de aprovação ou reprovação baseado na média das notas. Alunos aprovados possuem nota igual ou superior a 7. Alunos em recuperação possuem nota entre 5 e 7. Abaixo de 5 o aluno é considerado reprovado.

Neste sistema, podem existir diferentes tipos de Aluno:

* **Aluno especial:** não pode ficar em recuperação, sendo assim sua nota mínima para aprovar é 5.
* **Aluno convidado:** não pode reprovar.


[Link]: https://drive.google.com/file/d/1i4qVow9r6Jz0vGZ7JYxWfJB5HNT3SRI7/view