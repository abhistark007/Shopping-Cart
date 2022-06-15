// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controllers/cart_controller.dart';
import 'package:shopping_cart/models/product_model.dart';

class CartProducts extends StatelessWidget {
  final CartController cartController=Get.find();
   CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> SizedBox(
        height: 600,
        child: ListView.builder(
          itemCount: cartController.products.length,
          itemBuilder: (context,index){
            return CartProductCard(
              cartController: cartController,
              product: cartController.products.keys.toList()[index],
              quantity: cartController.products.values.toList()[index],
              index: index,
            );
          }),
      ),
    );
  }
}


class CartProductCard extends StatelessWidget {
  final CartController cartController;
  final Product product;
  final int quantity;
  final int index;
  const CartProductCard({Key? key,
  required this.cartController,
  required this.product,
  required this.quantity,
  required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(radius: 40,backgroundImage: NetworkImage(product.imageUrl),),
          Text(product.name),
          IconButton(onPressed: (){
            cartController.removeProduct(product);
          }, icon: Icon(Icons.remove_circle)),
          Text("$quantity"),
          IconButton(onPressed: (){
            cartController.addProducts(product);
          }, icon: Icon(Icons.add_circle)),
        ],
      ),
    );
  }
}