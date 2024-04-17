import 'dart:convert';

import 'package:apidata/model/product.dart';
import 'package:apidata/model/technews.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
//import 'package:taskfromplacement/models/model1.dart';

//import 'package:shopify/models/product.dart';

class NewsdataProvider extends ChangeNotifier {
  static const apiEndpoints =
      'https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=25bc50e6962940729bdc168ed72c13b2';
  bool isloading = true;
  String error = '';
  Newsdata newsdata = Newsdata(articles: []);

  Newsdata searchProduct = Newsdata(
    articles: [],
  );
  String searchText = '';

  getDataFromApi() async {
    print("datacalled");
    try {
      print("data fetching");
      Response responseitem = await http.get(Uri.parse(apiEndpoints));
      print(responseitem);

      if (responseitem.statusCode == 200) {
        print("status code");
        newsdata =
            //jsonDecode(responseitem.body);
            newsdataFromJson(responseitem.body);
        // Newsdata.fromRawJson(responseitem.body);
        print("data geting");
        //productsFromJson(responseitem.body);

        print(newsdata);
      } else {
        error = responseitem.statusCode.toString();
        print(error);
      }
    } catch (e) {
      print("error message");
      error = e.toString();
    }
    isloading = false;
    updatedata();
    //notifyListeners();
  }

  updatedata() {
    searchProduct.articles.clear();
    if (searchText.isEmpty) {
      searchProduct.articles.addAll(newsdata.articles);
    } else {
      searchProduct.articles.addAll(newsdata.articles
          .where(
              (element) => element.title!.toLowerCase().startsWith(searchText))
          .toList());
    }
    notifyListeners();
  }

  search(String title) {
    searchText = title.toLowerCase();
    updatedata();
  }
}
