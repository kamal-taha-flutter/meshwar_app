import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/features/favourite/widgets/favourite_card_widget.dart';
import 'package:hungryapp/features/favourite/widgets/favourite_header.dart';


class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          color: AppColors.grey,
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Gap(30),
                     FavouriteHeader(),
                     Gap(30)
                    ],
                  ),
                ),
              ),

              SliverPadding(
                padding: EdgeInsetsGeometry.all(8),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 4,
                    (context, index) => FavouriteCard(
                      itemName: 'Nike Jordan',
                      itemPrice: '302.00',
                      itemImage: 'assets/home/choose1.png',
                    ),
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    childAspectRatio: .785,
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

