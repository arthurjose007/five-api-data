import 'package:apidata/components/businesbox.dart';
import 'package:apidata/provider/business_provider.dart';
import 'package:apidata/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  @override
  void initState() {
    final businessdata = Provider.of<BusinessProvider>(context, listen: false);
    businessdata.getDataFromApi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final businessdata = Provider.of<BusinessProvider>(context);
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
                'Business Data',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              actions: [
                Icon(Icons.person),
                Flexible(
                  child: Text("   "),
                ),
              ],
            ),
            body: businessdata.isloading
                ? getLoadingUi()
                : businessdata.error.isNotEmpty
                    ? getErrorUI(businessdata.error)
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
    final businessdata = Provider.of<BusinessProvider>(
      context,
      listen: false,
    );
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            businessdata.search(value);
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
          builder: (context, BusinessProvider businesspro, child) =>
              ListView.builder(
                  itemCount: businesspro.searchbusiness.articles.length,
                  itemBuilder: (context, index) {
                    final uriimage = businesspro
                                .searchbusiness.articles[index].urlToImage !=
                            null
                        ? businesspro.searchbusiness.articles[index].urlToImage
                        : Constants.imageurl;
                    final publishtime =
                        businesspro.searchbusiness.articles[index].publishedAt;
                    final title =
                        businesspro.searchbusiness.articles[index].title;
                    return BusinessBox(
                        imageurl: uriimage!,
                        title: title!,
                        time: publishtime!.toString());
                  }),
        )),
      ],
    );
  }
}
