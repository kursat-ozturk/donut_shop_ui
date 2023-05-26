import 'package:donut_shop_ui/pages/donut_main_page.dart';
import 'package:donut_shop_ui/widgets/bottom_bar.dart';
import 'package:donut_shop_ui/widgets/donut_side_menu.dart';
import 'package:flutter/material.dart';

import '../models/model.dart';
import 'donut_shop_cart_page.dart';

class DonutShopMain extends StatelessWidget {
  const DonutShopMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DonutSideMenu(),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Utils.mainDark),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Image.network(Utils.donutLogoRedText, width: 120),
      ),
      body: Column(
        children: [
          Expanded(
            child: Navigator(
              key: Utils.mainListNav,
              initialRoute: '/main',
              onGenerateRoute: (RouteSettings settings) {
                Widget page;

                switch (settings.name) {
                  case '/main':
                    page = DonutMainPage();
                    break;
                  case '/favorites':
                    page = Center(child: Text('favorites'));
                    break;
                  case '/shoppingcart':
                    page = DonutShoppingCartPage();
                    break;
                  default:
                    page = Center(child: Text('main'));
                    break;
                }

                return PageRouteBuilder(
                    pageBuilder: (_, __, ___) => page,
                    transitionDuration: const Duration(seconds: 0));
              },
            ),
          ),
          DonutBottomBar(),
        ],
      ),
    );
  }
}
