import 'package:carrinho_compras/app/shared/models/product/product_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'cart_controller.g.dart';

@Injectable()
class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  @observable
  CartState cartActualState = CartState.loading;

  ObservableList<ProductModel> itens;
  Map<int, int> productList;

  @observable
  ObservableMap<ProductModel, int> itensCompressed =
      new ObservableMap<ProductModel, int>();

  void checkLists() {
    if (itens.isNotEmpty && productList.isNotEmpty) {
      itens.forEach((item) {
        itensCompressed[item] =
            itensCompressed[item] == null ? 1 : itensCompressed[item] + 1;
      });
      cartActualState = CartState.success;
    } else {
      cartActualState = CartState.error;
    }
  }

  @action
  void increaseQTD({int index}) {
    if (productList.values.elementAt(index) > 0) {
      itensCompressed[itensCompressed.keys.elementAt(index)] =
          itensCompressed.values.elementAt(index) + 1;
      productList.update(index + 1, (value) => --value);
    }
  }

  @action
  void decreaseQTD({int index}) {
    if (itensCompressed.keys.elementAt(index).amount > 1) {
      itensCompressed[itensCompressed.keys.elementAt(index)] =
          itensCompressed.values.elementAt(index) - 1;
      productList.update(index + 1, (value) => ++value);
    } else {
      itensCompressed.remove(itensCompressed.keys.elementAt(index));
    }
  }
}

enum CartState { loading, success, error }
