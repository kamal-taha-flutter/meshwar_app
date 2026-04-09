import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungryapp/core/shared/custom_text.dart';

class SideItem extends StatelessWidget {
  const SideItem({super.key, required this.text, required this.icon, required this.ontap});
final String text;
final IconData icon;
final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(icon,color: Colors.white,size: 30,),
                  Gap(20),
                  GestureDetector(
                    onTap: ontap,
                    child: CustomText(
                                    text: text,
                                    size: 18,
                                    weight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                  ),  
                ],
              );
  }
}

