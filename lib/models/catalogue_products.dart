// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controllers/cart_controller.dart';
import 'package:shopping_cart/models/product_model.dart';

class CatalogProducts extends StatefulWidget {
  const CatalogProducts({Key? key}) : super(key: key);

  @override
  State<CatalogProducts> createState() => _CatalogProductsState();
}

class _CatalogProductsState extends State<CatalogProducts> {
  @override
  Widget build(BuildContext context) {
    return Flexible(child: ListView.builder(
      itemCount: Product.products.length,
      itemBuilder: (context,index){
        return CatalogProductCard(index: index,);
      } ));
  }
}


class CatalogProductCard extends StatelessWidget {
  final cartController=Get.put(CartController());
  final int index;
  CatalogProductCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(radius: 40,backgroundImage: NetworkImage(Product.products[index].imageUrl),),
        Text(Product.products[index].name),
        Text(Product.products[index].price.toString()),
        IconButton(onPressed: (){
          cartController.addProducts(Product.products[index]);
        }, icon: Icon(Icons.add_circle)),
      ],
    ),
    );
  }
}