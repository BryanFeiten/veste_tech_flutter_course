# Exercício

Construa um sistema de gestão de alunos e provas. O aluno deve ter um identificador único, dados pessoais e a sua lista de provas. Já uma prova deve ser composta obrigatoriamente pela disciplina e pela nota alcançada. Deve haver um relacionamento entre prova e aluno, onde o aluno é composto pela sua lista de provas.

O aluno deve ser capaz de registrar uma nova prova, mas não deve ser permitido excluir provas já registradas. Use encapsulamento para garantir esse comportamento.

O aluno também pode consultar a informação de aprovação ou reprovação baseado na média das notas. Alunos aprovados possuem nota igual ou superior a 7. Alunos em recuperação possuem nota entre 5 e 7. Abaixo de 5 o aluno é considerado reprovado.

Neste sistema, podem existir diferentes tipos de Aluno:

* **Aluno especial:** não pode ficar em recuperação, sendo assim sua nota mínima para aprovar é 5.
* **Aluno convidado:** não pode reprovar.
