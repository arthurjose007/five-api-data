import 'package:apidata/components/drawer.dart';
import 'package:apidata/components/home_screen.dart';
import 'package:apidata/screens/apple.dart';
import 'package:apidata/screens/business.dart';
import 'package:apidata/screens/technews.dart';
import 'package:apidata/screens/teslanews.dart';
import 'package:apidata/screens/wsj.dart';
import 'package:flutter/material.dart';

//import 'package:shopify/screens/customer_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> dataitem = [
    const HomeScreenItems(icon: Icons.newspaper_outlined, data: "Tech News"),
    const HomeScreenItems(icon: Icons.rocket, data: "Tesla"),
    const HomeScreenItems(icon: Icons.movie, data: "Business"),
    const HomeScreenItems(icon: Icons.wb_shade_outlined, data: "Wsj"),
    const HomeScreenItems(icon: Icons.apple, data: "Apple"),
  ];
  void ontapps(int index) {
    if (index == 0) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const NewsScreen(),
      ));
    } else if (index == 1) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const TeslaScreen(),
      ));
    } else if (index == 2) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const BusinessScreen(),
      ));
    } else if (index == 3) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const WsjScreen(),
      ));
    } else if (index == 4) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const AppleScreen(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        actions: [
          const Icon(
            Icons.person,
            size: 12,
          ),
          Flexible(
            child: Text("   "),
          ),
        ],
        // leading: const Padding(
        //   padding: EdgeInsets.all(8.0),
        //   child: CircleAvatar(
        //     child: Icon(Icons.menu),
        //   ),
        // ),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          itemCount: dataitem.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 17,
            crossAxisCount: 2,
            mainAxisSpacing: 18,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            return SizedBox(
              width: 3,
              child: InkWell(
                onTap: () {
                  ontapps(index);
                },
                child: Container(
                  width: 7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0.8,
                          blurRadius: 2,
                          offset: Offset(0, 3))
                    ],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: dataitem[index],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
