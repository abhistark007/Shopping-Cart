// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/models/catalogue_products.dart';
import 'package:shopping_cart/views/cart_screen.dart';


class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({Key? key}) : super(key: key);

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog Screen"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CatalogProducts(),
          MaterialButton(onPressed: (){
            Get.to(()=> CartScreen());
          },
          color: Colors.blue,
          child: Text("Goto Cart",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
}