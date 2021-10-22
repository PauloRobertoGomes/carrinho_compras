import 'shared/services/external_api_service.dart';
import 'shared/services/local_storage_service.dart';
import 'package:carrinho_compras/app/modules/login/login_module.dart';
import 'package:carrinho_compras/app/shared/constants/routes_const.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:carrinho_compras/app/app_widget.dart';
import 'package:carrinho_compras/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $ExternalApiService,
        $LocalStorageService,
        $AppController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(RoutesConst.HOME, module: HomeModule()),
        ModularRouter(RoutesConst.LOGIN, module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
