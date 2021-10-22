import '../../components/product_component_cart.dart';
import 'package:carrinho_compras/app/shared/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cart_controller.dart';

class CartPage extends StatefulWidget {
  final String title;
  final List<ProductModel> itens;
  final Map<int, int> productList;
  const CartPage({Key key, this.title = "Cart", this.itens, this.productList})
      : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends ModularState<CartPage, CartController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    super.initState();
    controller.itens = widget.itens;
    controller.productList = widget.productList;
    controller.checkLists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) {
          if (controller.cartActualState == CartState.loading) {
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
          } else if (controller.cartActualState == CartState.success) {
            return ListView.builder(
              itemCount: controller.itensCompressed.length,
              itemBuilder: (context, index) {
                controller.itensCompressed.keys.elementAt(index).amount =
                    controller.itensCompressed.values.elementAt(index);
                return ProductCartComponent(
                  model: controller.itensCompressed.keys.elementAt(index),
                  amount: controller.itensCompressed.values.elementAt(index),
                  add: () {
                    controller.increaseQTD(index: index);
                    setState(() {});
                  },
                  remove: () {
                    controller.decreaseQTD(index: index);
                    setState(() {});
                  },
                );
              },
            );
          } else if (controller.cartActualState == CartState.error) {
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
                      text: "Ocorreu um erro ao organizar seu carrinho",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                    onPressed: () => controller.checkLists(),
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
