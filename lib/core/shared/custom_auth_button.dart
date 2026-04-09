import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungryapp/core/shared/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.text, required this.color, this.iconImage, required this.textColor, required this.width});
final Function()? onTap;
final String text;
final double width;
final Color color;
final Color textColor;
final String? iconImage;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
                  onTap:onTap,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Container(
                      height: 55,
                      width: width,
                        child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (iconImage != null) ...[
                                    Image.asset(iconImage!, height: 24),
                                  const SizedBox(width: 8),
                                ],
                                CustomText(
                                  text: text,
                                  color: textColor,
                                  weight: FontWeight.w800,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  )  );
  }
}

