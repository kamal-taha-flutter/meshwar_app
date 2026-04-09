import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/core/shared/custom_text.dart';

class NotificationItem extends StatefulWidget {
  const NotificationItem({super.key, required this.image, required this.title, required this.price, required this.afterPrice, required this.time});
  final String image;
  final String  title;
  final String price;
  final String afterPrice;
  final String time;

  @override
  State<NotificationItem> createState() => _CartItemState();
}

class _CartItemState extends State<NotificationItem> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return  Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Gap(10),
            Container(
              width: 120,
              height: 100,
              padding: EdgeInsets.only(right: 7),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 238, 238, 238),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(

                child: Transform.rotate(
                  angle: -.4,
                  child: Image.asset(widget.image),
                ),
              ),
            ),
            Gap(25),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Gap(120),
                    CustomText(
                          text: widget.time,
                          size: 16,
                          color: Colors.grey.shade600,
                          weight: FontWeight.bold,
                        ),
                  ],
                ),

                    CustomText(
                      text: widget.title,
                      size: 18,
                      weight: FontWeight.bold,
                    ),
                
                Gap(10),
                Row(
                  children: [
                    CustomText(text: widget.afterPrice, size: 20, weight: FontWeight.bold,color: AppColors.primary,),
                    Gap(10),
                    CustomText(
                      text: widget.price,
                      size: 16,
                      color: Colors.grey.shade600,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
  }
}


