import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/core/shared/custom_text.dart';


class FavouriteCard extends StatelessWidget {
  const FavouriteCard({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
  });
  final String itemName;
  final String itemPrice;
  final String itemImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        color: Colors.white,
        child: Container(
          width: 180,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 5),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 17,
                        child: Image.asset(
                                'assets/home/loveAfter.png',
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),

                child: Container(
                  height: 100,
                  child: Image.asset(itemImage, fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Best Seller',
                      color: AppColors.primary,
                      weight: FontWeight.w800,
                      size: 14,
                    ),
                  ],
                ),
              ),
              Gap(5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    CustomText(
                      text: itemName,
                      color: Color(0xff6C6C6C),
                      weight: FontWeight.w800,
                      size: 18,
                    ),
                  ],
                ),
              ),
              Gap(10),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomText(
                      text: '\$${itemPrice}',
                      color: Colors.black,
                      weight: FontWeight.w800,
                      size: 18,
                    ),
                    Spacer(),
                    CircleAvatar(radius: 8, backgroundColor: Color(0xffCB1D1D)),
                    Gap(5),
                    CircleAvatar(radius: 8, backgroundColor: Color(0xff0B2F8B)),
                    Gap(20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


