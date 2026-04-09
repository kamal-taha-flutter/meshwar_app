
import 'package:flutter/material.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/features/auth/presentation/views/login_view.dart';
import 'package:hungryapp/features/intro/views/onboard1_view.dart';
import 'package:hungryapp/features/intro/views/onboard2_view.dart';
import 'package:hungryapp/features/intro/views/onboard3_view.dart';
import 'package:hungryapp/features/intro/widgets/custom_button_onboard.dart';
class Onboard extends StatefulWidget {
  const Onboard({super.key});
 static const String screenRoute = 'onboarding';

  @override
  State<Onboard> createState() => _RootState();
}

class _RootState extends State<Onboard> {
late PageController controller;
late List<Widget> screens;
int currentScreen = 0;
@override
  void initState() {
    screens =[
        Onboard1View(),
        Onboard2View(),
        Onboard3View(),
    ];
    controller = PageController(initialPage: currentScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Stack(
          children: [
                 PageView(
                  controller:controller ,
                  children:screens,  
                  physics: NeverScrollableScrollPhysics(),   
              ),
             
             Container(
              alignment: Alignment(0, .90),
               child: Column(
                mainAxisSize: MainAxisSize.min,
                 children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        IconButton(onPressed: (){
                           if (currentScreen > 0) {
                                    setState(() {
                                      currentScreen--;
                                    });
                                    controller.jumpToPage(currentScreen);
                                  }   
                        }, icon: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Icon(Icons.arrow_back_ios,color: Colors.white,),
                        ))
                      ],
                    ),
                  ),
                  Spacer(),
                  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                screens.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: currentScreen == index ? 42 : 28,
                  decoration: BoxDecoration(
                    color: currentScreen == index ? Colors.white : AppColors.darkPrimary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
                    SizedBox(
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: CustomButtonOnboard(text: 'Get Started',ontap:(){
                        setState(() {
                      currentScreen ++ ;   
                        });
                      currentScreen < screens.length ? controller.jumpToPage(currentScreen) :Navigator.push(context, MaterialPageRoute(builder: (_) => LoginView())); ;   

                       
                      } 
                               
                                      ),
                    )
                 ],
               ),
             )
          
          ],
        ),
       
    );
  }
}

