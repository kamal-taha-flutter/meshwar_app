
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/features/auth/presentation/views/profile_view.dart';
import 'package:hungryapp/features/favourite/views/favourite_view.dart';
import 'package:hungryapp/features/home/views/home_view.dart';
import 'package:hungryapp/features/notification/views/notification_view.dart';

class Root extends StatefulWidget {
  const Root({super.key, this.selectScreen});
 static const String screenRoute = 'root';
 final int? selectScreen;
  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
late PageController controller;
late List<Widget> screens;
late int currentScreen ;
@override
  void initState() {
    currentScreen = widget.selectScreen ?? 0;
    screens =[
        HomeView(),
        FavouriteView(),
        NotificationView(),
        ProfileView()
    ];
    controller = PageController(initialPage: currentScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            controller:controller ,
            children: screens,  
            physics: NeverScrollableScrollPhysics(),   
        ),
        bottomNavigationBar: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(topLeft:Radius.circular(20) ,topRight:Radius.circular(20) ),
            ),
          child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              type:BottomNavigationBarType.fixed,
               unselectedItemColor:Color.fromARGB(255, 151, 151, 151),
                selectedItemColor: Colors.white,
                currentIndex: currentScreen,
                onTap: (index) {
                  setState(() {
                    currentScreen = index ;
                  });
                  controller.jumpToPage(currentScreen);
                },
              items: [
                  BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favourite'),
                  BottomNavigationBarItem(icon: Icon(Icons.notifications),label: 'Notification'),
                  BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_fill),label: 'Profile'),
              ]
              ),
        ),
    );
  }
}