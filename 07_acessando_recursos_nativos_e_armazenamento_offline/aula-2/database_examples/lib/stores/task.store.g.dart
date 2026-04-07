// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on _TaskStore, Store {
  late final _$_tasksAtom = Atom(name: '_TaskStore._tasks', context: context);

  @override
  ObservableList<Task> get _tasks {
    _$_tasksAtom.reportRead();
    return super._tasks;
  }

  @override
  set _tasks(ObservableList<Task> value) {
    _$_tasksAtom.reportWrite(value, super._tasks, () {
      super._tasks = value;
    });
  }

  late final _$_isLoadingAtom = Atom(
    name: '_TaskStore._isLoading',
    context: context,
  );

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_newTaskTitleAtom = Atom(
    name: '_TaskStore._newTaskTitle',
    context: context,
  );

  @override
  String get _newTaskTitle {
    _$_newTaskTitleAtom.reportRead();
    return super._newTaskTitle;
  }

  @override
  set _newTaskTitle(String value) {
    _$_newTaskTitleAtom.reportWrite(value, super._newTaskTitle, () {
      super._newTaskTitle = value;
    });
  }

  late final _$loadTasksAsyncAction = AsyncAction(
    '_TaskStore.loadTasks',
    context: context,
  );

  @override
  Future<void> loadTasks() {
    return _$loadTasksAsyncAction.run(() => super.loadTasks());
  }

  late final _$createTaskAsyncAction = AsyncAction(
    '_TaskStore.createTask',
    context: context,
  );

  @override
  Future<void> createTask() {
    return _$createTaskAsyncAction.run(() => super.createTask());
  }

  late final _$toggleTaskAsyncAction = AsyncAction(
    '_TaskStore.toggleTask',
    context: context,
  );

  @override
  Future<void> toggleTask(String taskId) {
    return _$toggleTaskAsyncAction.run(() => super.toggleTask(taskId));
  }

  late final _$_TaskStoreActionController = ActionController(
    name: '_TaskStore',
    context: context,
  );

  @override
  void setNewTaskTitle(String value) {
    final _$actionInfo = _$_TaskStoreActionController.startAction(
      name: '_TaskStore.setNewTaskTitle',
    );
    try {
      return super.setNewTaskTitle(value);
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
