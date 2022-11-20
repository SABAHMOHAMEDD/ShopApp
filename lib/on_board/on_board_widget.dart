import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'on_board_screen.dart';

class OnboardWidget extends StatelessWidget {
  Function onSubmit;
  var controller;
  List itemsList;
  bool isLast;
  int index;
  OnboardModel onboardModel;

  OnboardWidget(this.onboardModel, this.onSubmit, this.controller,
      this.itemsList, this.isLast, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              child: Image(
                image: AssetImage(onboardModel.imagePath),
                //fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              onboardModel.title,
              style: const TextStyle(fontSize: 35),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(onboardModel.body, style: const TextStyle(fontSize: 20)),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                    controller: controller,
                    effect: const ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 5,
                        expansionFactor: 4,
                        activeDotColor: Colors.deepOrange),
                    count: itemsList.length),
                const SizedBox(
                  width: 120,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.deepOrange,
                  onPressed: () {
                    if (isLast) {
                      onSubmit();
                    } else {
                      controller.nextPage(
                          duration: const Duration(microseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_right,
                    size: 25,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
