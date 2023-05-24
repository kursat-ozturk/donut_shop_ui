import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/model.dart';

class DonutFilterBar extends StatelessWidget {
  const DonutFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Consumer<DonutService>(builder: (context, donutService, child) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
                  List.generate(donutService.filterBarItems.length, (index) {
                DonutFilterBarItem item = donutService.filterBarItems[index];

                return GestureDetector(
                  onTap: () {
                    donutService.filteredDonutsByType(item.id!);
                  },
                  child: Container(
                    child: Text(
                      '${item.label!}',
                      style: TextStyle(
                          color: donutService.selectedDonutType == item.id
                              ? Utils.mainColor
                              : Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 10),
            Stack(
              children: [
                AnimatedAlign(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  alignment:
                      alignmentBasedOnTab(donutService.selectedDonutType),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3 - 20,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Utils.mainColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }

  Alignment alignmentBasedOnTab(filterBarId) {
    switch (filterBarId) {
      case 'classic':
        return Alignment.centerLeft;
      case 'sprinkled':
        return Alignment.center;
      case 'stuffed':
        return Alignment.centerRight;
      default:
        return Alignment.centerLeft;
    }
  }
}
