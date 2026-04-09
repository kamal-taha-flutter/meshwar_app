import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/core/shared/custom_text.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key, required this.fieldName, required this.isPassword, required this.controller});
 final String fieldName ;
 final bool isPassword;
 final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obscureText ;
  @override
  void initState() {
    obscureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,  
                  children: [
                    CustomText(text: widget.fieldName, weight: FontWeight.w500, size: 18, color: Colors.black),
                    SizedBox(height: 4,),
                    TextFormField(
                      controller: widget.controller,
                      cursorColor: Colors.black,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20
                      ),
                      validator: (v){
                        if( v == null || v.isEmpty ){
                          return 'Please fill ${widget.fieldName}';
                        }
                        return null;
                      },
                      obscureText: obscureText,
                      
                      decoration: InputDecoration(

                        
              suffixIcon: widget.isPassword ? GestureDetector(
                onTap: () {
                  setState(() {
                     obscureText = !obscureText;
                  });
                },
                child: Icon(CupertinoIcons.eye)) : null,



              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey),
                borderRadius: BorderRadius.circular(8),
              ),

              fillColor: AppColors.grey,
              filled: true,
            ),
                    )
                  ],
                ),
              );
  }
}

