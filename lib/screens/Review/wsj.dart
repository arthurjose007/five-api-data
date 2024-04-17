import 'package:apidata/auth/apple.dart';
import 'package:apidata/auth/tesla.dart';
import 'package:apidata/auth/wsj.dart';
import 'package:apidata/components/deviderwidget.dart';
import 'package:apidata/utils/text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WsjReview extends StatefulWidget {
  const WsjReview({super.key});

  @override
  State<WsjReview> createState() => _WsjReviewState();
}

class _WsjReviewState extends State<WsjReview> {
  Stream? WsjStream;
  getloaded() async {
    WsjStream = await DatabaseWsj().getemployeeDetails();
    setState(() {});
  }

  @override
  void initState() {
    getloaded();
    // TODO: implement initState
    super.initState();
  }

  Widget allemployeedetails(double w) {
    return StreamBuilder(
        stream: WsjStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    print("Hello alllllll");
                    print(ds["imageurl"]);

                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                          width: w,
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl: ds["imageurl"],
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.yellow),
                                ),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(
                                        color: Colors.blue),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    modifiedtext(
                                        color: Colors.white,
                                        size: 16,
                                        text: "title:" + ds["title"]),
                                    SizedBox(height: 5),
                                    modifiedtext(
                                        color: Colors.white38,
                                        size: 12,
                                        text: "time:" + ds["time"]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        DividerWidget()
                      ],
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Wsj',
              style: TextStyle(color: Colors.blue, fontSize: 29),
            ),
            Text(
              'Review',
              style: TextStyle(color: Colors.orange, fontSize: 29),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(child: allemployeedetails(w)),
        ],
      ),
    );
  }
}
