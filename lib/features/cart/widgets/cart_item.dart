import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/core/shared/custom_text.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.image, required this.title, required this.price});
  final String image;
  final String  title;
  final String price;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          ///زيادة ونقصان
          CustomSlidableAction(
            onPressed: (context) {},
            borderRadius: BorderRadius.circular(16),
            backgroundColor: AppColors.primary,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: Icon(Icons.add, color: Colors.white, size: 30)),
                Gap(20),
                CustomText(text: '$count', size: 25, color: Colors.white),
                Gap(20),
                GestureDetector(
                  onTap: () {
                    if(count > 0){
                      setState(() {
                        count--;
                      });
                    }
                  },
                  child: Icon(Icons.remove, color: Colors.white, size: 30)),
              ],
            ),
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          CustomSlidableAction(
            onPressed: (context) {},

            borderRadius: BorderRadius.circular(16),
            backgroundColor: Color(0xffFF1900),
            child: Icon(CupertinoIcons.delete, color: Colors.white, size: 35),
          ),
        ],
      ),
      child: Container(
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
                //rotate
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
                CustomText(
                  text: widget.title,
                  size: 18,
                  weight: FontWeight.bold,
                ),
                Gap(10),
                CustomText(text: widget.price, size: 18, weight: FontWeight.bold),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
