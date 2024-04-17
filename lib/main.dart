import 'package:apidata/firebase_options.dart';
import 'package:apidata/provider/apple.dart';
import 'package:apidata/provider/business_provider.dart';
import 'package:apidata/provider/product_provider.dart';
import 'package:apidata/provider/technews.dart';
import 'package:apidata/provider/tesladart.dart';
import 'package:apidata/provider/wsj_provider.dart';
import 'package:apidata/screens/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => NewsdataProvider()),
        ChangeNotifierProvider(create: (_) => TeslaProvider()),
        ChangeNotifierProvider(create: (_) => BusinessProvider()),
        ChangeNotifierProvider(create: (_) => WsjProvider()),
        ChangeNotifierProvider(create: (_) => AppleProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
