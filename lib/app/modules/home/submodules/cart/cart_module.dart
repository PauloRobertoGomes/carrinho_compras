import 'cart_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cart_page.dart';

class CartModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $CartController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => CartPage(
            itens: args.data['itens'],
            productList: args.data['productList'],
          ),
        ),
      ];

  static Inject get to => Inject<CartModule>.of();
}
