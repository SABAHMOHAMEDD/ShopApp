import 'package:flutter/material.dart';
import 'package:shopapp/login/login_screen.dart';
import 'package:shopapp/shared/network/local/cache_helper.dart';

import 'on_board_widget.dart';

class OnBoardScreen extends StatefulWidget {
  static const String RouteName = 'onBoarding';

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  var boardingController = PageController();

  bool isLast = false;

  List itemsList = OnboardModel.getAllOnBoardItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // backgroundColor: Colors.deepOrange,
        // title: Center(child: Text('Shop App')),
        actions: [
          TextButton(
              onPressed: () {
                onSubmit();
              },
              child: Text(
                'Skip',
                style: TextStyle(
                    color: Colors.deepOrange, fontSize: 18, fontFamily: 'j'),
              ))
        ],
      ),
      body: PageView.builder(
          physics: BouncingScrollPhysics(),
          controller: boardingController,
          itemCount: itemsList.length,
          onPageChanged: (int index) {
            if (index == itemsList.length - 1) {
              setState(() {
                isLast = true;
              });
            } else {
              setState(() {
                isLast = false;
              });
            }
            ;
          },
          itemBuilder: (context, index) {
            return OnboardWidget(itemsList[index], onSubmit, boardingController,
                itemsList, isLast, index);
          }),
    );
  }

  void onSubmit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value == true) {
        Navigator.pushNamed(context, LoginScreen.RouteName);
      }
    });
  }
}

class OnboardModel {
  String imagePath;
  String title;
  String body;

  OnboardModel(this.imagePath, this.title, this.body);

  static List<OnboardModel> getAllOnBoardItems = [
    OnboardModel('assets/images/onboard_1.jpg', 'title 1', 'body 1'),
    OnboardModel('assets/images/onboard_2.jpg', 'title 2', 'body 2'),
    OnboardModel('assets/images/onboard_3.jpg', 'title 3', 'body 3'),
  ];
}
