import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungryapp/core/constants/app_colors.dart';

class ProfileField extends StatelessWidget {
  const ProfileField({super.key, required this.controller, required this.labelName});
final TextEditingController controller ;
final String labelName;
  @override
  Widget build(BuildContext context) {
    return TextField(

              controller: controller,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.grey.shade700,fontSize: 18),
              decoration: InputDecoration(
                labelText: labelName,
                labelStyle: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Icon(CupertinoIcons.check_mark,size: 18,color: AppColors.primary,),
        
                enabledBorder:OutlineInputBorder(
                 borderSide: BorderSide(
                  color: AppColors.darkPrimary
                 ),
                 borderRadius: BorderRadius.circular(16) 
                ),
                focusedBorder:OutlineInputBorder(
                 borderSide: BorderSide(
                  color: AppColors.darkPrimary
                 ),
                 borderRadius: BorderRadius.circular(16) 
                ), 
                filled: true,
                fillColor: AppColors.grey
              ),
            );
  }
}

