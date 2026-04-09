
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:hungryapp/core/constants/app_colors.dart';


class Onboard2View extends StatelessWidget {
  const Onboard2View({super.key});

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
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/intro/onboarding2.png',
                  width: double.infinity,
                  ),
              Gap(20),    
              Image.asset('assets/intro/TEXT2.png',
                  width: double.infinity,
                  ),
                  Gap(150)
            ],
          ),
            
          ))
        
        
      );
  }
}

