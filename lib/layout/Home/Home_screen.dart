import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/cubit/states.dart';
import 'package:shopapp/modules/Search/search_screen.dart';

import '../cubit/cubit.dart';

class HomeScreen extends StatelessWidget {
  static const String RouteName = 'home';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          //  backgroundColor: Colors.red,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backwardsCompatibility: false,
            title: const Text(
              'Shop',
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SearchScreen.RouteName);
                  },
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                  ))
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            //  enableFeedback: true,
            showUnselectedLabels: true,
            showSelectedLabels: true,

            unselectedLabelStyle: TextStyle(color: Colors.black),

            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.Changebottom(index);
            },
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.home),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.apps,
                  ),
                  label: 'Categories'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.favorite),
                  label: 'Favorites'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.person),
                  label: 'Profile'),
            ],
          ),
        );
      },
    );
  }

  List<IconData> iconlist = [
    Icons.home,
    Icons.apps,
    Icons.favorite,
    Icons.person
  ];
}

// AnimatedBottomNavigationBar(
// borderColor: Color(0xFFC8C9CB),
// height: 70,
// iconSize: 35,
// icons: iconlist,
//
// borderWidth: 1,
// activeIndex: cubit.currentIndex,
// gapLocation: GapLocation.none,
// notchSmoothness: NotchSmoothness.softEdge,
// leftCornerRadius: 10,
// rightCornerRadius: 10,
// onTap: (index) {
// cubit.Changebottom(index);
// },
// inactiveColor: Color(0xFFC8C9CB),
// activeColor: MyTheme.primaryColor,
// backgroundColor: Colors.white)
