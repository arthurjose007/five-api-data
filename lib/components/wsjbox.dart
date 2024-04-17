import 'package:apidata/auth/wsj.dart';
import 'package:apidata/components/deviderwidget.dart';
import 'package:apidata/utils/text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

class WsjBox extends StatelessWidget {
  final String imageurl, title, time;
  const WsjBox({
    Key? key,
    required this.imageurl,
    required this.title,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                      title: const Text("Add for Later Review"),
                      content: const Text("Adding for Later Review "),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () async {
                            String id = randomAlphaNumeric(10);
                            Map<String, dynamic> datacontent = {
                              "title": title,
                              "imageurl": imageurl,
                              "time": time,
                            };
                            await DatabaseWsj()
                                .addcomtentdetails(datacontent, id)
                                .then((value) {
                              Fluttertoast.showToast(
                                  msg: "Data added sussfully",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            });

                            Navigator.of(ctx).pop();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 59, 166, 216),
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.all(14),
                            child: const Text("Add"),
                          ),
                        ),
                      ],
                    ));
          },
          child: Container(
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
                  imageUrl: imageurl,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow),
                  ),
                  placeholder: (context, url) =>
                      CircularProgressIndicator(color: Colors.blue),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      modifiedtext(color: Colors.white, size: 16, text: title),
                      SizedBox(height: 5),
                      modifiedtext(color: Colors.white38, size: 12, text: time),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        DividerWidget()
      ],
    );
  }
}
