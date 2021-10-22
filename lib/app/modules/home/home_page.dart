import 'dart:ui';

import 'components/badge_component.dart';
import 'components/product_component.dart';
import 'package:carrinho_compras/app/shared/constants/routes_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Produtos"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Observer(
            builder: (_) {
              return Badge(
                top: 8,
                right: 8,
                value: controller.cart.length.toString(),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart_outlined),
                  splashColor: Theme.of(context).accentColor,
                  onPressed: () {
                    Modular.to.pushNamed(
                      RoutesConst.HOME + RoutesConst.CART,
                      arguments: {
                        'itens': controller.cart,
                        'productList': controller.amounts,
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          if (controller.actualState == HomeState.loading) {
            controller.products;
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: "Buscando Produtos",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            );
          } else if (controller.actualState == HomeState.success) {
            return ListView.builder(
              itemCount: controller.productList.length,
              itemBuilder: (context, index) {
                return Observer(
                  builder: (context) {
                    controller.amounts[controller.productList[index].id] =
                        controller.productList[index].amount;
                    return ProductComponent(
                      model: controller.productList[index],
                      onPressed: () {
                        if (controller.productList[index].amount >= 1) {
                          controller.cart.add(controller.productList[index]);
                          controller.productList[index].amount--;
                          setState(() {});
                          print(controller.amounts);
                        }
                      },
                    );
                  },
                );
              },
            );
          } else if (controller.actualState == HomeState.error) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 50,
                  ),
                  SizedBox(height: 15),
                  RichText(
                    text: TextSpan(
                      text: "Ocorreu um erro ao buscar os produtos",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                    onPressed: () => controller.products,
                    child: Text(
                      "Tentar Novamente",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Theme.of(context).accentColor,
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
