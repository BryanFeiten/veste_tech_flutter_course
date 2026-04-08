import 'package:hive_ce/hive.dart';

part 'task.model.g.dart';

/// Modelo que representa uma tarefa na lista de tarefas.
@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String titulo;

  @HiveField(2)
  bool isCompleted;

  Task({required this.id, required this.titulo, this.isCompleted = false});
}

// /// Modelo que representa uma tarefa na lista de tarefas.
// @HiveType(typeId: 1)
// class User extends HiveObject {
//   @HiveField(0)
//   String id;

//   @HiveField(1)
//   String titulo;

//   @HiveField(2)
//   bool isCompleted;

//   User({
//     required this.id,
//     required this.titulo,
//     this.isCompleted = false,
//   });
// }
