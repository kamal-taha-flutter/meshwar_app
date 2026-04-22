import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/features/onboard.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashState();
}

class _SplashState extends State<SplashView>
    with SingleTickerProviderStateMixin {

    
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => 
          const Onboard()),
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.primary,
      body: Center(
        child: Column(
          children: [
                  Gap(300),
                 Center(child: Image.asset('assets/home/splash.png',width: 500,))    
          
          ],
        ),
      ),
    );
  }
}


