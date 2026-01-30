import 'package:flutter/material.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/core/shared/custom_auth_button.dart';
//import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/core/shared/custom_text.dart';
import 'package:hungryapp/core/shared/custom_text_field.dart';
import 'package:hungryapp/features/auth/presentation/views/signup_view.dart';

class LoginView extends StatelessWidget {
   LoginView({super.key});
final TextEditingController emailController = TextEditingController();
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
                CustomText(text: 'Hello Again!', weight:FontWeight.bold, size: 40, color: Colors.black),
                SizedBox(height:5),
                CustomText(text: 'Fill your Details or continue with', weight:FontWeight.normal, size: 20, color: Color(0xff707B81)),
                CustomText(text: 'social media', weight:FontWeight.normal, size: 20, color: Color(0xff707B81)),
                //text field
                SizedBox(
                  height: 40,
                ),
                CustomTextField(fieldName: 'Email Address', isPassword: false , controller: emailController),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(fieldName: 'Password', isPassword: true, controller: passwordController,),
                SizedBox(
                  height: 20,
                ),
            
               CustomButton(text: 'Sign In', color: AppColors.primary, textColor: Colors.white, width: double.infinity,),
               SizedBox(
                height: 10,
               ),
               CustomButton(text: 'Sign In with Google ', color:AppColors.grey, iconImage: 'assets/Auth/google.png', textColor: Colors.black, width: double.infinity,),

                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (c)=>SignupView()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(text: 'New User?',color: Color(0xff6A6A6A),size: 18,weight: FontWeight.bold),
                          CustomText(text: ' h Account',color: Color(0xff1A1D1E),size: 18,weight: FontWeight.bold),
                        ],
                      ),
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
