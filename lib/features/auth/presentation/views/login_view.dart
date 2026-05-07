import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/core/services/service_locator.dart';
import 'package:hungryapp/core/shared/custom_auth_button.dart';
import 'package:hungryapp/core/shared/custom_text.dart';
import 'package:hungryapp/core/shared/custom_text_field.dart';
import 'package:hungryapp/features/auth/presentation/controllers/auth_cubit.dart';
import 'package:hungryapp/features/auth/presentation/views/signup_view.dart';
import 'package:hungryapp/root.dart';

class LoginView extends StatefulWidget {
   LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

 String?  email, password ; 

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => di<AuthCubit>(),
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
          return  GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
        
            body: Center(
              child: Form(
                key: formKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  children: [
                    Spacer(),
                    CustomText(text: 'Hello Again!', weight:FontWeight.bold, size: 40, color: Colors.black),
                    SizedBox(height:5),
                    CustomText(text: 'Fill your Details or continue with', weight:FontWeight.normal, size: 20, color: Color(0xff707B81)),
                    CustomText(text: 'social media', weight:FontWeight.normal, size: 20, color: Color(0xff707B81)),
        
                    SizedBox(
                      height: 40,
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
                      height: 20,
                    ),
                
                    CustomButton(
                      text: 'Login',
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
                       context.read<AuthCubit>().signup(
                            email: email!,
                            password: password!,
                          );
                      }, isLoading: state is AuthLoading,
                    ),
                   SizedBox(
                    height: 10,
                   ),
                   CustomButton(
                    onTap: (){
                       context.read<AuthCubit>().signInWithGoogle();
                    },
                    text: 'Login with Google ', color:AppColors.grey, iconImage: 'assets/Auth/google.png', textColor: Colors.black, width: double.infinity, isLoading: false,),
        
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GestureDetector(
                          onTap: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>SignupView()));
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
          },
      ),
    );
  }
}


