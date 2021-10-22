import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:carrinho_compras/app/shared/models/product/product_model.dart';

class ProductComponent extends StatelessWidget {
  final ProductModel model;
  final Function onPressed;

  const ProductComponent({Key key, this.model, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15.0,
            offset: Offset(0.0, 0.8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Componente da imagem
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
              topLeft: Radius.circular(5),
            ),
            child: Image.network(
              model.image,
              fit: BoxFit.contain,
              width: 100,
            ),
          ),
          SizedBox(width: 10),

          //Informações sobre o produto
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    model.title,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "R\$" + model.value.toString() + ",00",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "QTD: " + model.amount.toString(),
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Controles
          Container(
            child: IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              splashColor: Theme.of(context).accentColor,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
