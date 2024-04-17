import 'package:apidata/components/Teslabox.dart';
import 'package:apidata/model/technews.dart';
import 'package:apidata/provider/product_provider.dart';
import 'package:apidata/provider/technews.dart';
import 'package:apidata/provider/tesladart.dart';
import 'package:apidata/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class TeslaScreen extends StatefulWidget {
  const TeslaScreen({super.key});

  @override
  State<TeslaScreen> createState() => _TeslaScreenState();
}

class _TeslaScreenState extends State<TeslaScreen> {
  @override
  void initState() {
    final providerdata = Provider.of<TeslaProvider>(context, listen: false);
    providerdata.getDataFromApi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Tesladata = Provider.of<TeslaProvider>(context);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.arrow_back_ios_new_outlined)),
              centerTitle: true,
              title: const Text(
                'Tesla Datas',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              actions: [
                Icon(Icons.person),
                Flexible(
                  child: Text("   "),
                ),
              ],
            ),
            body: Tesladata.isloading
                ? getLoadingUi()
                : Tesladata.error.isNotEmpty
                    ? getErrorUI(Tesladata.error)
                    : getBodydata(
                        //foodproviders.food
                        )));
  }

  Widget getLoadingUi() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpinKitSpinningLines(
            color: Colors.grey,
            size: 70.0,
          ),
          Text(
            "Loading....",
            style: TextStyle(fontSize: 19, color: Colors.amber),
          )
        ],
      ),
    );
  }

  Widget getErrorUI(String error) {
    return Center(
      child: Text(
        error,
        style: const TextStyle(color: Colors.orange, fontSize: 22),
      ),
    );
  }

  Widget getBodydata() {
    final Tesladata = Provider.of<TeslaProvider>(
      context,
      listen: false,
    );
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            Tesladata.search(value);
          },
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              hintText: 'Search',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        ),
        const SizedBox(
          height: 12,
        ),
        Expanded(
            child: Consumer(
          builder: (context, TeslaProvider teslap, child) => ListView.builder(
              itemCount: teslap.searchtesla.articles.length,
              itemBuilder: (context, index) {
                final uriimage =
                    teslap.searchtesla.articles[index].urlToImage != null
                        ? teslap.searchtesla.articles[index].urlToImage
                        : Constants.imageurl;
                final publishtime =
                    teslap.searchtesla.articles[index].publishedAt;
                final title = teslap.searchtesla.articles[index].title;
                return TeslaBox(
                    imageurl: uriimage!,
                    title: title!,
                    time: publishtime!.toString());
              }),
        )),
      ],
    );
  }
}
