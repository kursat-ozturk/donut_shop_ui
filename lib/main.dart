import 'package:donut_shop_ui/models/model.dart';
import 'package:donut_shop_ui/pages/donut_shop_main.dart';
import 'package:donut_shop_ui/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => DonutBottomBarSelectionService(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      navigatorKey: Utils.mainAppNav,
      routes: {
        '/': (context) => SplashPage(),
        '/main': (context) => DonutShopMain()
      },
    ),
  ));
}
