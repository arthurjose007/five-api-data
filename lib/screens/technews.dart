import 'package:apidata/components/techbox.dart';
import 'package:apidata/model/technews.dart';
import 'package:apidata/provider/product_provider.dart';
import 'package:apidata/provider/technews.dart';
import 'package:apidata/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    final providerdata = Provider.of<NewsdataProvider>(context, listen: false);
    providerdata.getDataFromApi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newsproviderdata = Provider.of<NewsdataProvider>(context);
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
                'Tech News',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              actions: [
                Icon(Icons.person),
                Flexible(
                  child: Text("   "),
                ),
              ],
            ),
            body: newsproviderdata.isloading
                ? getLoadingUi()
                : newsproviderdata.error.isNotEmpty
                    ? getErrorUI(newsproviderdata.error)
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
    final Newsdata = Provider.of<NewsdataProvider>(
      context,
      listen: false,
    );
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            Newsdata.search(value);
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
          builder: (context, NewsdataProvider prod, child) => ListView.builder(
              itemCount: prod.searchProduct.articles.length,
              itemBuilder: (context, index) {
                final uriimage =
                    prod.searchProduct.articles[index].urlToImage != null
                        ? prod.searchProduct.articles[index].urlToImage
                        : Constants.imageurl;
                final publishtime =
                    prod.searchProduct.articles[index].publishedAt;
                final title = prod.searchProduct.articles[index].title;
                // final countent = prod.searchProduct.articles[index].content;
                return TechBox(
                    imageurl: uriimage!,
                    title: title!,
                    time: publishtime!.toString());
              }),
        )
            // child: GridView.builder(
            //     padding: EdgeInsets.symmetric(horizontal: 12),
            //     itemCount: newsdataitem.articles.length,
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         mainAxisSpacing: 4,
            //         crossAxisSpacing: 12,
            //         childAspectRatio: 1.3),
            //     itemBuilder: (constext, index) {
            //       final uriimage = newsdataitem.articles[index].urlToImage != null
            //           ? newsdataitem.articles[index].urlToImage
            //           : Constants.imageurl;
            //       final publishtime = newsdataitem.articles[index].publishedAt;
            //       final title = newsdataitem.articles[index].title;

            //       final countent = newsdataitem.articles[index].content;
            //       //final author = newsdataitem.articles[index].author;
            //       print(uriimage);
            //       print(countent);
            //       //print(author);
            //       return Container(
            //         // margin: EdgeInsets.symmetric(horizontal: 5),
            //         decoration: BoxDecoration(
            //             color: Colors.white,
            //             boxShadow: const [
            //               BoxShadow(
            //                   color: Colors.grey,
            //                   spreadRadius: 0.8,
            //                   blurRadius: 2,
            //                   offset: Offset(0, 3))
            //             ],

            //             // color: Colors.blue,
            //             borderRadius: BorderRadius.circular(15)),
            //         //height: 20,
            //         height: media.height * .14, // Adjusted height here
            //         width: media.width * .17,
            //         child: Column(
            //           // mainAxisSize: MainAxisSize.min,
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           //crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Container(
            //               //color: Colors.blue,
            //               height: media.height * .09,
            //               width: media.width * .30,
            //               decoration: BoxDecoration(
            //                 image:
            //                     DecorationImage(image: NetworkImage(uriimage!)),
            //               ),
            //             ),
            //             const SizedBox(
            //               height: 4,
            //             ),
            //             Row(
            //               mainAxisSize: MainAxisSize.min,
            //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //               children: [
            //                 Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Padding(
            //                       padding: EdgeInsets.all(.09),
            //                       child: Text(
            //                         countent!,
            //                         style: const TextStyle(
            //                             fontSize: 14,
            //                             fontWeight: FontWeight.bold),
            //                       ),
            //                     ),
            //                     Text(
            //                       "data",
            //                       style: TextStyle(
            //                           color: Colors.grey[800],
            //                           fontWeight: FontWeight.w500),
            //                     ),
            //                   ],
            //                 ),
            //                 Text(
            //                   "|",
            //                   style: TextStyle(
            //                       fontSize: 28,
            //                       color: Colors.grey.withOpacity(0.8)),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(
            //                     left: 2.0,
            //                   ),
            //                   child: SizedBox(
            //                     height: 25,
            //                     child: ElevatedButton(
            //                         style: ElevatedButton.styleFrom(
            //                             shape: RoundedRectangleBorder(
            //                                 borderRadius:
            //                                     BorderRadius.circular(10)),
            //                             backgroundColor: Colors.blue[900]),
            //                         onPressed: () {},
            //                         child: const Text(
            //                           "Add",
            //                           style: TextStyle(color: Colors.white),
            //                         )),
            //                   ),
            //                 )
            //               ],
            //             )
            //           ],
            //         ),
            //       );
            //     }),
            ),
      ],
    );
  }
}
