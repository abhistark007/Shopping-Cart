// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shopping_cart/models/cart_products.dart';
import 'package:shopping_cart/models/cart_total.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Screen"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CartProducts(),
          CartTotal(),
        ],
      ),
    );
  }
}