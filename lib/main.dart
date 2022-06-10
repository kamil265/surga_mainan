
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surga_mainan/pages/shop_home/main_page.dart';
import 'package:surga_mainan/pages/sign_in_page.dart';
import 'package:surga_mainan/pages/splash_page.dart';
import 'package:surga_mainan/providers/token_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TokenProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => SplashPage(),
          '/sign-in':(context) => SignInPage(),
          '/home':(context) => MainPage(),
        },
      ),
    );
  }
}