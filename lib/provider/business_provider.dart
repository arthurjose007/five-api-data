import 'package:apidata/model/business.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class BusinessProvider extends ChangeNotifier {
  static const apiEndpoints =
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=25bc50e6962940729bdc168ed72c13b2';
  bool isloading = true;
  String error = '';
  Business business = Business(articles: []);

  Business searchbusiness = Business(
    articles: [],
  );
  String searchText = '';

  getDataFromApi() async {
    print("datacalled");
    try {
      print("data fetching");
      Response responseitem = await http.get(Uri.parse(apiEndpoints));

      if (responseitem.statusCode == 200) {
        print("status code");
        business = businessFromJson(responseitem.body);
        // Newsdata.fromRawJson(responseitem.body);
        print("data geting");

        print(business);
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
    searchbusiness.articles.clear();
    if (searchText.isEmpty) {
      searchbusiness.articles.addAll(business.articles);
    } else {
      searchbusiness.articles.addAll(business.articles
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
