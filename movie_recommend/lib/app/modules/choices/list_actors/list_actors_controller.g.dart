// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_actors_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ListActorsController = BindInject(
  (i) => ListActorsController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListActorsController on _ListActorsControllerBase, Store {
  final _$listaActorAtom = Atom(name: '_ListActorsControllerBase.listaActor');

  @override
  ObservableList<ActorInfo> get listaActor {
    _$listaActorAtom.reportRead();
    return super.listaActor;
  }

  @override
  set listaActor(ObservableList<ActorInfo> value) {
    _$listaActorAtom.reportWrite(value, super.listaActor, () {
      super.listaActor = value;
    });
  }

  final _$valueAtom = Atom(name: '_ListActorsControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$getActorIDAsyncAction =
      AsyncAction('_ListActorsControllerBase.getActorID');

  @override
  Future<void> getActorID(String nome) {
    return _$getActorIDAsyncAction.run(() => super.getActorID(nome));
  }

  final _$_ListActorsControllerBaseActionController =
      ActionController(name: '_ListActorsControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_ListActorsControllerBaseActionController
        .startAction(name: '_ListActorsControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ListActorsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaActor: ${listaActor},
value: ${value}
    ''';
  }
}
