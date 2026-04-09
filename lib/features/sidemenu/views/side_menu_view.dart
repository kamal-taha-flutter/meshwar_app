import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/core/shared/custom_text.dart';
import 'package:hungryapp/features/cart/views/cart_view.dart';
import 'package:hungryapp/features/sidemenu/widgets/side_item.dart';
import 'package:hungryapp/root.dart';

class SideMenuView extends StatelessWidget {
  const SideMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/home/Side Menu.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                                   onTap: () {
                                        Navigator.pop(context);
                                      },
                                  child: Container(
                                    width: 26,
                                    height: 18,
                                    child: Image.asset('assets/home/sideList.png'),
                                  ),
                                ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8,bottom: 8,left: 30,right:8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 Gap(25),    
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/home/profile.jpg'),
                    backgroundColor: Colors.transparent,
                  ),
              
                  const Gap(10),
              
                  CustomText(
                    text: 'Kamal  Taha',
                    size: 20,
                    weight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  Gap(40),
                  SideItem(text: 'Profile', icon: CupertinoIcons.person,
                   ontap: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>Root(selectScreen: 3,)));
                    }),
                  Gap(40),
                  SideItem(text: 'My Cart', icon: CupertinoIcons.cart, 
                  ontap: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>CartView()));
                    }),
                  Gap(40),
                  SideItem(text: 'Favorite', icon: CupertinoIcons.heart, 
                  ontap: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>Root(selectScreen: 1,)));
                    }),
                  Gap(40),
                  SideItem(text: 'Notifications', icon: CupertinoIcons.bell, 
                  ontap: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>Root(selectScreen: 2,)));
                    }),
                  Gap(40),
                  SideItem(text: 'Settings', icon: Icons.settings, ontap: (){}),
                  Gap(40),
                  SizedBox(
                    width: 264,
                    child: Divider()),
                  Gap(30),
                  SideItem(text: 'Sign Out', icon: Icons.logout, ontap: (){}),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


