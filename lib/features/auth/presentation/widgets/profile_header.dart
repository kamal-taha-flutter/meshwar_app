import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/core/shared/custom_text.dart';
import 'package:hungryapp/features/sidemenu/views/side_menu_view.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => SideMenuView()));
                  },
          child: Container(
            width: 26,
            height: 18,
            child: Image.asset('assets/home/homeList.png'),
          ),
        ),
        Spacer(),
        CustomText(text: 'Profile', size: 22, weight: FontWeight.bold),
        Spacer(),
        CustomText(
          text: 'Done',
          size: 18,
          color: AppColors.primary,
          weight: FontWeight.bold,
        ),
      ],
    );
  }
}


