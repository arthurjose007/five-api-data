import 'package:apidata/components/Applebox.dart';
import 'package:apidata/provider/apple.dart';
import 'package:apidata/provider/tesladart.dart';
import 'package:apidata/provider/wsj_provider.dart';
import 'package:apidata/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class AppleScreen extends StatefulWidget {
  const AppleScreen({super.key});

  @override
  State<AppleScreen> createState() => _AppleScreenState();
}

class _AppleScreenState extends State<AppleScreen> {
  @override
  void initState() {
    final providerdata = Provider.of<AppleProvider>(context, listen: false);
    providerdata.getDataFromApi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appledata = Provider.of<AppleProvider>(context);
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
                'Apple Data',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              actions: [
                Icon(Icons.person),
                Flexible(
                  child: Text("   "),
                ),
              ],
            ),
            body: appledata.isloading
                ? getLoadingUi()
                : appledata.error.isNotEmpty
                    ? getErrorUI(appledata.error)
                    : getBodydata()));
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
    final Appledata = Provider.of<AppleProvider>(
      context,
      listen: false,
    );
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            Appledata.search(value);
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
          builder: (context, AppleProvider appledata, child) =>
              ListView.builder(
                  itemCount: appledata.searchapple.articles.length,
                  itemBuilder: (context, index) {
                    final uriimage =
                        appledata.searchapple.articles[index].urlToImage != null
                            ? Appledata.searchapple.articles[index].urlToImage
                            : Constants.imageurl;
                    final publishtime =
                        Appledata.searchapple.articles[index].publishedAt;
                    final title = Appledata.searchapple.articles[index].title;
                    return NewsBox(
                        imageurl: uriimage!,
                        title: title!,
                        time: publishtime!.toString());
                  }),
        )),
      ],
    );
  }
}
