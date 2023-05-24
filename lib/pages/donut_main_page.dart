import 'package:donut_shop_ui/widgets/donut_filter_bar.dart';
import 'package:donut_shop_ui/widgets/donut_list.dart';
import 'package:donut_shop_ui/widgets/donut_pager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/model.dart';

class DonutMainPage extends StatelessWidget {
  const DonutMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DonutPager(),
        DonutFilterBar(),
        Expanded(
          child: Consumer<DonutService>(
            builder: (context, donutService, child) {
              return DonutList(donuts: donutService.filteredDonuts);
            },
          ),
        ),
      ],
    );
  }
}
