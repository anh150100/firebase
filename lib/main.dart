import 'package:a1/controller/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/google_contrller.dart';
import 'pages/wapper/wapper_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => GoogleController()),
            ChangeNotifierProvider(create: (context) => AuthController()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Wapper(),
          )),
    );
  }
}
