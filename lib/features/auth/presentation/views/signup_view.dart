import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/core/services/service_locator.dart';
import 'package:hungryapp/core/shared/custom_auth_button.dart';
import 'package:hungryapp/core/shared/custom_text.dart';
import 'package:hungryapp/core/shared/custom_text_field.dart';
import 'package:hungryapp/features/auth/presentation/controllers/auth_cubit.dart';
import 'package:hungryapp/features/auth/presentation/views/login_view.dart';
import 'package:hungryapp/root.dart';

class SignupView extends StatefulWidget {
   SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

 AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

 String?  email, password ; 

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) => di<AuthCubit>() ,
      child: BlocConsumer<AuthCubit,AuthState>(
         listener: (BuildContext context, state) {
          if (state is AuthFailure) {
            print('failiar ${state.message}');
          }
          if (state is AuthSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Root()),
            );
          }
        }, 
         builder: (BuildContext context, state) {  
          return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
        
            body: Center(
              child: Form(
                key: formKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  children: [
                    Spacer(),
                    CustomText(text: 'Register Account', weight:FontWeight.bold, size: 40, color: Colors.black),
                    SizedBox(height:5),
                    CustomText(text: 'Fill your Details or continue with', weight:FontWeight.normal, size: 20, color: Color(0xff707B81)),
                    CustomText(text: 'social media', weight:FontWeight.normal, size: 20, color: Color(0xff707B81)),
        
                    Spacer(),
                    CustomTextField(fieldName: 'Your Name', isPassword: false ,),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      fieldName: 'Email Address',
                      isPassword: false,
                      onSaved: (value) {
                        email = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      fieldName: 'Password',
                      isPassword: true,
                      onSaved: (value) {
                        password = value;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                
                   CustomButton(
                      text: 'Sign in',
                      color: AppColors.primary,
                      textColor: Colors.white,
                      width: double.infinity,
                      onTap: () {
                        if (!formKey.currentState!.validate()) {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                          return;
                        }
                        formKey.currentState!.save();
                       context.read<AuthCubit>().register(
                            email: email!,
                            password: password!,
                          );
                      }, isLoading: state is AuthLoading,
                    ),
                   Gap(30),
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
                        child: GestureDetector(
                          onTap: (){
                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>LoginView()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(text: 'Already Have Account?',color: Color(0xff6A6A6A),size: 18,weight: FontWeight.bold),
                              CustomText(text: ' Log In',color: Color(0xff1A1D1E),size: 18,weight: FontWeight.bold),
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

         },
      ),
    );
  }
}


