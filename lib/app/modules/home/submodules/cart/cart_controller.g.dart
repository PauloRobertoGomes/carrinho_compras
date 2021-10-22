// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CartController = BindInject(
  (i) => CartController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartController on _CartControllerBase, Store {
  final _$cartActualStateAtom =
      Atom(name: '_CartControllerBase.cartActualState');

  @override
  CartState get cartActualState {
    _$cartActualStateAtom.reportRead();
    return super.cartActualState;
  }

  @override
  set cartActualState(CartState value) {
    _$cartActualStateAtom.reportWrite(value, super.cartActualState, () {
      super.cartActualState = value;
    });
  }

  final _$itensCompressedAtom =
      Atom(name: '_CartControllerBase.itensCompressed');

  @override
  ObservableMap<ProductModel, int> get itensCompressed {
    _$itensCompressedAtom.reportRead();
    return super.itensCompressed;
  }

  @override
  set itensCompressed(ObservableMap<ProductModel, int> value) {
    _$itensCompressedAtom.reportWrite(value, super.itensCompressed, () {
      super.itensCompressed = value;
    });
  }

  final _$_CartControllerBaseActionController =
      ActionController(name: '_CartControllerBase');

  @override
  void increaseQTD({int index}) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.increaseQTD');
    try {
      return super.increaseQTD(index: index);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseQTD({int index}) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.decreaseQTD');
    try {
      return super.decreaseQTD(index: index);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cartActualState: ${cartActualState},
itensCompressed: ${itensCompressed}
    ''';
  }
}
