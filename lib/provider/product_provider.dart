import 'package:apidata/model/product.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
//import 'package:taskfromplacement/models/model1.dart';

//import 'package:shopify/models/product.dart';

class ProductProvider extends ChangeNotifier {
  static const apiEndpoints = 'http://143.198.61.94/api/products/';
  bool isloading = true;
  String error = '';

  Products products = Products(
    data: [],
  );
  Products searchProduct = Products(
    data: [],
  );
  String searchText = '';

  getDataFromApi() async {
    try {
      Response responseitem = await http.get(Uri.parse(apiEndpoints));

      if (responseitem.statusCode == 200) {
        // print("status code");
        products = productsFromJson(responseitem.body);

        print(products);
      } else {
        error = responseitem.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    isloading = false;
    updatedata();
    //notifyListeners();
  }

  updatedata() {
    searchProduct.data.clear();
    if (searchText.isEmpty) {
      searchProduct.data.addAll(products.data);
    } else {
      searchProduct.data.addAll(products.data
          .where((element) => element.name.toLowerCase().startsWith(searchText))
          .toList());
    }
    notifyListeners();
  }

  search(String username) {
    searchText = username.toLowerCase();
    updatedata();
  }
}
