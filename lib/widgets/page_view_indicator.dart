import 'package:flutter/material.dart';

import '../models/model.dart';

class PageViewIndicator extends StatelessWidget {
  PageController? controller;
  int? numberOfPages;
  int? currentPage;

  PageViewIndicator(
      {super.key, this.controller, this.numberOfPages, this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(numberOfPages!, (index) {
        // each circular indicator will be
        // built off of this Container widget
        return GestureDetector(
          onTap: () {
            controller!.animateToPage(index,
                duration: const Duration(microseconds: 500),
                curve: Curves.easeInOut);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            width: 15,
            height: 15,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: currentPage == index
                  ? Utils.mainColor
                  : Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }),
    );
  }
}
