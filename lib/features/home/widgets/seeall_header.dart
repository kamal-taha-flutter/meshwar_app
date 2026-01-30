import 'package:flutter/material.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/core/shared/custom_text.dart';

class SeeallHeader extends StatelessWidget {
  const SeeallHeader({super.key, required this.Text, required this.ontap, required this.isSeeall});
final String Text;
final Function() ontap;
final bool isSeeall;
  @override
  Widget build(BuildContext context) {
    return  Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            CustomText(
                              text: Text,//'Popular Shoes',
                              color: Colors.black,
                              weight: FontWeight.w800,
                              size: 16,
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap:ontap,
                              child: isSeeall == false
                                  ? CustomText(
                                      text: 'See all',
                                      color: AppColors.primary,
                                      weight: FontWeight.w800,
                                      size: 16,
                                    )
                                  : CustomText(
                                      text: 'See less',
                                      color: AppColors.primary,
                                      weight: FontWeight.w800,
                                      size: 16,
                                    ),
                            ),
                          ],
                        ),
                      );
  }
}