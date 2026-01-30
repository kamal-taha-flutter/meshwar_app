import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/core/shared/custom_text.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          //arrow_back
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Gap(8), Icon(Icons.arrow_back_ios)],
              ),

              radius: 23,
            ),
          ),
          Spacer(),
          CustomText(
            text: 'My Cart',
            color: Color(0xff2B2B2B),
            size: 18,
            weight: FontWeight.bold,
          ),
          Spacer(),
          CircleAvatar(
              backgroundColor: AppColors.grey,

              radius: 23,
            ),
        ],
      ),
    );
  }
}
