import 'package:carrinho_compras/app/shared/constants/routes_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "LOGIN"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller
  ReactionDisposer disposer;

  @override
  void dispose() {
    super.dispose();
    disposer();
  }

  @override
  Widget build(BuildContext context) {
    disposer = autorun((_) {
      if (controller.loading == false) {
        if (controller.error == true) {
          Modular.to.pop();
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) {
              return AlertDialog(
                content: Text("Ocorreu um erro ao realizar o login"),
                actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      controller.error = false;
                    },
                    child: Text("Ok"),
                  ),
                ],
              );
            },
          );
        }
      } else {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [CircularProgressIndicator()],
              ),
            );
          },
        );
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: new ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shrinkWrap: true,
          children: [
            TextField(
              autocorrect: false,
              autofocus: false,
              controller: controller.textController,
              decoration: InputDecoration(
                labelText: "Nome de Usuario",
                border: new OutlineInputBorder(
                  borderSide:
                      new BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            SizedBox(height: 30),
            RaisedButton(
              onPressed: () async {
                // dynamic response = await controller.login();
                // if (response == null) {
                //   print("error");
                // } else {
                //   Modular.to.pop();
                //   Modular.to.pushReplacementNamed(RoutesConst.HOME);
                // }
                Modular.to.pushReplacementNamed(RoutesConst.HOME);
              },
              child: Text("Realizar o Login"),
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
