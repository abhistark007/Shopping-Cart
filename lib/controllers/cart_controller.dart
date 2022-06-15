// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';
import 'package:shopping_cart/models/product_model.dart';

class CartController extends GetxController{
  // add a dict to store products in the cart
  var _products={}.obs;
  

  void addProducts(Product product){
    if(_products.containsKey(product)){
      _products[product]+=1;
    }else{
      _products[product]=1;
    }
  }


  get products => _products;

  void removeProduct(Product product){
    if(_products.containsKey(product) && _products[product]==1){
      _products.removeWhere((key, value) => key==product);
    }else{
      _products[product]-=1;
    }
  }

  get productSubTotal=>_products.entries.map((product) => product.key.price*product.value).toList();

  get total=>_products.entries.map((product) => product.key.price*product.value).toList()
  .reduce((value, element) => value+element).toString();

}