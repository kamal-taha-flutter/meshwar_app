import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/core/shared/custom_auth_button.dart';

import 'package:hungryapp/core/shared/custom_text.dart';
import 'package:hungryapp/core/shared/custom_text_field.dart';
import 'package:hungryapp/root.dart';

class SignupView extends StatelessWidget {
   SignupView({super.key});
final TextEditingController emailController = TextEditingController();
final TextEditingController nameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(

        body: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Spacer(),
                CustomText(text: 'Register Account', weight:FontWeight.bold, size: 40, color: Colors.black),
                SizedBox(height:5),
                CustomText(text: 'Fill your Details or continue with', weight:FontWeight.normal, size: 20, color: Color(0xff707B81)),
                CustomText(text: 'social media', weight:FontWeight.normal, size: 20, color: Color(0xff707B81)),

                Spacer(),
                CustomTextField(fieldName: 'Your Name', isPassword: false , controller: nameController),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(fieldName: 'Email Address', isPassword: false , controller: emailController),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(fieldName: 'Password', isPassword: true, controller: passwordController,),
                SizedBox(
                  height: 30,
                ),
            
               CustomButton(text: 'Sign up', color:AppColors.primary, textColor: Colors.white, width: double.infinity,),
               SizedBox(
                height: 10,
               ),
               CustomButton(text: 'Sign up with Google ', color:AppColors.grey, iconImage: 'assets/Auth/google.png', textColor: Colors.black, width: double.infinity,),
               Gap(20),
                     GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => Root()),
                              (route) => false,
                            );
                          },
                          child: CustomText(
                            text: 'Continue as a guest ?',
                            size: 14,
                            weight: FontWeight.bold,
                            color: AppColors.darkPrimary,
                          ),
                        ),  
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: 'Already Have Account?',color: Color(0xff6A6A6A),size: 18,weight: FontWeight.bold),
                        CustomText(text: ' Log In',color: Color(0xff1A1D1E),size: 18,weight: FontWeight.bold),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                
              ],
            ),
          )),

      ));
  }
}


