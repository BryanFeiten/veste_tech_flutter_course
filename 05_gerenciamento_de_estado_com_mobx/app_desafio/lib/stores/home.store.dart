import 'dart:developer';

import 'package:mobx/mobx.dart';

part 'home.store.g.dart';

// ignore: library_private_types_in_public_api
class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  // ignore: prefer_final_fields
  ObservableList<String> _exercicios = ObservableList.of([
    'Flexão',
    'Supino Reto',
  ]);

  @computed
  List<String> get exercicios => _exercicios;

  @action
  String? adicionarNovoExercicio(String nomeDoExecicio) {
    log(nomeDoExecicio, name: 'Novo exercício');

    if (nomeDoExecicio.length < 3) {
      return 'O nome deve conter pelo menos 3 caracteres';
    }

    if (_exercicios.contains(nomeDoExecicio)) {
      return 'Esse exercício já está cadastrado';
    }

    _exercicios.add(nomeDoExecicio);
    return null;
  }
}
