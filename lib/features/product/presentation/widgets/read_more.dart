import 'package:flutter/material.dart';
import 'package:hungryapp/core/shared/custom_text.dart';

class ReadMore extends StatelessWidget {
  const ReadMore({super.key, required this.ontap, required this.isReadMore});

final Function() ontap;
final bool isReadMore ;
  @override
  Widget build(BuildContext context) {
    return  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                        child: Row(
                          children: [
                            
                            Spacer(),
                            GestureDetector(
                              onTap:ontap,
                              child: isReadMore == true
                                  ? CustomText(
                                      text: 'Read more',
                                      color: Color(0xff0D6EFD),
                                      weight: FontWeight.bold,
                                      size: 17,
                                    )
                                  : CustomText(
                                      text: 'Read less',
                                      color: Color(0xff0D6EFD),
                                      weight: FontWeight.bold,
                                      size: 17,
                                    ),
                            ),
                          ],
                        ),
                      );
  }
}

