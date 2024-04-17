import 'package:apidata/components/wsjbox.dart';
import 'package:apidata/provider/wsj_provider.dart';
import 'package:apidata/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class WsjScreen extends StatefulWidget {
  const WsjScreen({super.key});

  @override
  State<WsjScreen> createState() => _WsjScreenState();
}

class _WsjScreenState extends State<WsjScreen> {
  @override
  void initState() {
    final providerdata = Provider.of<WsjProvider>(context, listen: false);
    providerdata.getDataFromApi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Wsjdata = Provider.of<WsjProvider>(context);
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
                'WSJ Data',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              actions: [
                Icon(Icons.person),
                Flexible(
                  child: Text("   "),
                ),
              ],
            ),
            body: Wsjdata.isloading
                ? getLoadingUi()
                : Wsjdata.error.isNotEmpty
                    ? getErrorUI(Wsjdata.error)
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
    final Wsjdata = Provider.of<WsjProvider>(
      context,
      listen: false,
    );
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            Wsjdata.search(value);
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
          builder: (context, WsjProvider Wsjdata, child) => ListView.builder(
              itemCount: Wsjdata.searchwsj.articles.length,
              itemBuilder: (context, index) {
                final uriimage =
                    Wsjdata.searchwsj.articles[index].urlToImage != null
                        ? Wsjdata.searchwsj.articles[index].urlToImage
                        : Constants.imageurl;
                final publishtime =
                    Wsjdata.searchwsj.articles[index].publishedAt;
                final title = Wsjdata.searchwsj.articles[index].title;
                return WsjBox(
                    imageurl: uriimage!,
                    title: title!,
                    time: publishtime!.toString());
              }),
        )),
      ],
    );
  }
}
