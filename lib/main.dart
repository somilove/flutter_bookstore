import 'package:flutter/material.dart';
import 'package:flutter_bookstore/screens/screen_index.dart';
import 'package:flutter_bookstore/screens/screen_register.dart';
import 'package:flutter_bookstore/screens/screen_search.dart';
import 'package:flutter_bookstore/screens/screen_splash.dart';
import 'package:flutter_bookstore/screens/screen_login.dart';
import 'package:flutter_bookstore/screens/screen_detail.dart';
import 'package:flutter_bookstore/models/model_auth.dart';
import 'package:flutter_bookstore/models/model_item_provider.dart';
import 'package:flutter_bookstore/models/model_query.dart';
import 'package:flutter_bookstore/models/model_cart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //플러터 엔진과 통신하기위한 바인딩 초기화
  //비동기작업, 일부 플러터 플러그인에서 필요한 경우 사용

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FirebaseAuthProvider()),
          ChangeNotifierProvider(create: (_) => ItemProvider()),
          ChangeNotifierProvider(create: (_) => SearchQuery()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
        ],
      child: MaterialApp(
        title: 'Flutter Bookstore',
        routes: {
          '/': (context) => SplashScreen(),
          '/login' : (context) => LoginScreen(),
          '/index' : (context) => IndexScreen(),
          '/register' : (context) => RegisterScreen(),
          '/search' : (context) => SearchScreen(),
          '/detail' : (context) => DetailScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}