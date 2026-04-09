import 'package:flutter/material.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/core/shared/custom_text.dart';


// ignore: must_be_immutable
class ShooseCategory extends StatefulWidget {
   ShooseCategory({super.key, required this.category, required this.selectedCategory});
  final List<dynamic> category;
  int selectedCategory;
  @override
  State<ShooseCategory> createState() => _ShooseCategoryState();
}

class _ShooseCategoryState extends State<ShooseCategory> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: List.generate(widget.category.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                widget.selectedCategory = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              decoration: BoxDecoration(
                color:widget.selectedCategory == index
                    ? AppColors.primary
                    : Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: CustomText(
                text: widget.category[index],
                weight: FontWeight.bold,
                color: widget.selectedCategory == index ? Colors.white : Colors.black,
              ),
            ),
          );
        }),
      ),
    );
  }
}


