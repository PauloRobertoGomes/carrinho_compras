import 'package:carrinho_compras/app/modules/login/services/login_service.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  TextEditingController textController = TextEditingController();

  @observable
  bool loading = false;
  bool error = false;

  @action
  Future<List<dynamic>> login({String id}) async {
    var identification = id ?? textController.text;
    error = false;
    loading = true;
    List<dynamic> response =
        await LoginService.loginUserOnBackEnd(identification: identification);
    loading = false;
    if (response.isEmpty) {
      error = true;
      return null;
    } else {
      return response;
    }
  }
}
