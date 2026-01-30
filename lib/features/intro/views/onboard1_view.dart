
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
//import 'package:hungryapp/features/intro/widgets/custom_button_onboard.dart';

class Onboard1View extends StatelessWidget {
  const Onboard1View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primary,
              AppColors.darkPrimary
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            )
        ),
        child: Center(
          child:  Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Image.asset('assets/intro/onboarding1.png',
                  width: double.infinity,
                  ),
               //  CustomButtonOnboard(text: 'Get Started')
            ],
          ),
            
          ))
        
        
      );
  }
}