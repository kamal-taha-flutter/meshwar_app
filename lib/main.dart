import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hungryapp/features/auth/presentation/views/login_view.dart';
import 'package:hungryapp/features/auth/presentation/views/signup_view.dart';
import 'package:hungryapp/features/home/views/home_view.dart';
import 'package:hungryapp/features/onboard.dart';
import 'package:hungryapp/features/product/presentation/views/product_details.dart';
import 'package:hungryapp/root.dart';
import 'package:hungryapp/splash_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const WearMeApp());
}

class WearMeApp extends StatelessWidget {
  const WearMeApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      initialRoute: '/splash',
      routes: {
        'splash_view': (context) => SplashView(),
        'login_view': (context) => LoginView(),
        'signup_view': (context) => SignupView(),
        HomeView.screenRoute: (context) => HomeView(),
        Root.screenRoute: (context) => Root(),
        ProductDetails.screenRoute : (context) => ProductDetails(),
        Onboard.screenRoute: (context) => Onboard(),


      },
    );
  }
}


