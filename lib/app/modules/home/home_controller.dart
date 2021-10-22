import 'package:carrinho_compras/app/modules/home/services/home_service.dart';
import 'package:carrinho_compras/app/shared/models/product/product_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  HomeState actualState = HomeState.loading;

  ObservableList<ProductModel> productList = ObservableList<ProductModel>();
  Map<int, int> amounts = new Map<int, int>();

  ObservableList<ProductModel> cart = ObservableList<ProductModel>();

  Future<List<ProductModel>> get products async {
    try {
      List<dynamic> response = await HomeService.getProductsFromServer();
      final list = response.map((json) => ProductModel.fromJson(json)).toList();
      actualState = HomeState.success;
      productList.addAll(list);
      return list;
    } catch (e) {
      print(e);
      actualState = HomeState.error;
      return null;
    }
  }
}

enum HomeState { loading, success, error }
