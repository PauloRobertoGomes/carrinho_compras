import 'package:carrinho_compras/app/modules/home/submodules/cart/cart_module.dart';
import 'package:carrinho_compras/app/shared/constants/routes_const.dart';

import 'services/home_service.dart';
import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $HomeService,
        $HomeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter(RoutesConst.CART, module: CartModule()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
