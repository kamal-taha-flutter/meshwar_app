import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/core/shared/custom_text.dart';
import 'package:hungryapp/features/home/widgets/card_item_widget.dart';
import 'package:hungryapp/features/home/widgets/home_header.dart';
import 'package:hungryapp/features/home/widgets/search_space.dart';
import 'package:hungryapp/features/home/widgets/seeall_header.dart';
import 'package:hungryapp/features/home/widgets/shoose_category.dart';


class HomeView extends StatefulWidget {
  HomeView({super.key});
  static const String screenRoute = 'home_view';
  @override
  State<HomeView> createState() => _HomeViewState();
}


bool seeAllPopular = false;
bool seeAllNew = false;

class _HomeViewState extends State<HomeView> {
  final List category = ['All Shoes', 'Outdoor', 'Tennis', 'Running','Tennis','Running'];
  int selectedCategory = 0;
 
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
                      SizedBox(height: 10),
                     HomeHeader(),
                      SizedBox(height: 10),
                     SearchSpace(),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          CustomText(
                            text: 'Select Category',
                            color: Colors.black,
                            weight: FontWeight.bold,
                            size: 16,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ShooseCategory(category: category, selectedCategory: selectedCategory,),
                      SizedBox(height: 10),
                  
                      SeeallHeader(
                        Text: 'Popular Shoes',
                        ontap: () {
                          setState(() {
                            seeAllPopular = !seeAllPopular;
                          });
                        },
                        isSeeall: seeAllPopular,
                      ),
                    ],
                  ),
                ),
              ),

              SliverPadding(
                padding: EdgeInsetsGeometry.all(8),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: seeAllPopular == false ? 2 : 6,
                    (context, index) => CardItem(
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

              SliverToBoxAdapter(
                child: SeeallHeader(
                  Text: 'New Arrivals',
                  ontap: () {
                    setState(() {
                      seeAllNew = !seeAllNew;
                    });
                  },
                  isSeeall: seeAllNew,
                ),
              ),

              SliverPadding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 2.5,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    childCount: seeAllNew == false ? 1 : 4,
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 16,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                          ),
                          child: Image.asset('assets/home/OfferItem.png'),
                        ),
                      );
                    },
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


