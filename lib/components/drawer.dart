import 'package:apidata/screens/Review/apple_r.dart';
import 'package:apidata/screens/Review/business.dart';
import 'package:apidata/screens/Review/techn.dart';
import 'package:apidata/screens/Review/tesla.dart';
import 'package:apidata/screens/Review/wsj.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 10, 44, 71),
            ),
            child: Center(
              child: Text(
                'Later Review',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          ListTile(
            trailing: const Icon(Icons.chevron_right_sharp),
            title: const Text(
              'Apple Review',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AppleReview(),
              ));
            },
          ),
          ListTile(
            trailing: const Icon(Icons.chevron_right_sharp),
            title: const Text(
              'Business Review',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const BusinessReview(),
              ));
            },
          ),
          ListTile(
            trailing: const Icon(Icons.chevron_right_sharp),
            title: const Text(
              'Tech Review',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TechReview(),
              ));
              // Navigator.of(context).pop();
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            trailing: const Icon(Icons.chevron_right_sharp),
            title: const Text(
              'Tesla Review',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TeslaReview(),
              ));
              // Navigator.of(context).pop();
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            trailing: const Icon(Icons.chevron_right_sharp),
            title: const Text(
              'Wsj Review',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const WsjReview(),
              ));
              // Navigator.of(context).pop();
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
