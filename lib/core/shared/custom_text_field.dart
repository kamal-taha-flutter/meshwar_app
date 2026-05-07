import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/core/shared/custom_text.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.fieldName,
    required this.isPassword,
   // required this.controller,
    this.onSaved,
    this.onChange,
  });
  final String fieldName;
  final bool isPassword;
 // final TextEditingController controller;
  final Function(String?)? onSaved;
  final Function(String?)? onChange;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obscureText;
  @override
  void initState() {
  obscureText = widget.isPassword;
  super.initState();
}
void _togglePassword(){
  setState(() {
    obscureText = !obscureText;
  });
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: widget.fieldName,
            weight: FontWeight.w500,
            size: 18,
            color: Colors.black,
          ),
          SizedBox(height: 4),
          TextFormField(
            onSaved: widget.onSaved,
            onChanged: widget.onChange,
          
            cursorColor: Colors.black,
            style: TextStyle(color: Colors.grey, fontSize: 20),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Field is required';
              } else {
                return null;
              }
            },
            obscureText: obscureText,

            decoration: InputDecoration(
              suffixIcon: widget.isPassword ? GestureDetector(
                    onTap: _togglePassword,
                    child: obscureText ? Icon(CupertinoIcons.eye):Icon(CupertinoIcons.eye_slash )) : null,

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
          ),
        ],
      ),
    );
  }
}
