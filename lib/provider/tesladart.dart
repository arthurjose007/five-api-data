import 'package:apidata/model/technews.dart';
import 'package:apidata/model/tesla.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TeslaProvider extends ChangeNotifier {
  static const apiEndpoints =
      'https://newsapi.org/v2/everything?q=tesla&from=2024-03-16&sortBy=publishedAt&apiKey=25bc50e6962940729bdc168ed72c13b2';
  bool isloading = true;
  String error = '';
  Tesla tesla = Tesla(articles: []);

  Tesla searchtesla = Tesla(
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
        tesla = teslaFromJson(responseitem.body);
        // Newsdata.fromRawJson(responseitem.body);
        print("data geting");

        print(tesla);
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
    searchtesla.articles.clear();
    if (searchText.isEmpty) {
      searchtesla.articles.addAll(tesla.articles);
    } else {
      searchtesla.articles.addAll(tesla.articles
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
