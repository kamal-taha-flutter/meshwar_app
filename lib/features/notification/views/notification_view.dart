import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/core/shared/custom_text.dart';
import 'package:hungryapp/features/notification/widgets/notification_header.dart';
import 'package:hungryapp/features/notification/widgets/notification_item.dart';


class NotificationView extends StatelessWidget {
   NotificationView({super.key});
  final String selectedCard = "DbL Card";

final List<ProductModel> products = [
  ProductModel(
    image: 'assets/home/choose1.png',
    title: 'Nike Air Max 200',
    price: '\$364.95',
    afterPrice: '\$260.00',
    time: '7 min ago',
  ),
  ProductModel(
    image: 'assets/product/Shoes2.png',
    title: 'Nike Air Max 720',
    price: '\$120.00',
    afterPrice: '\$90.00', 
    time: '2 hour ago',
  ),
  ProductModel(
    image: 'assets/product/shoes3.png',
    title: 'Nike Revolution 5',
    price: '\$80.00', 
    afterPrice: '\$59.99',
    time: '40 min ago',
  ),
  ProductModel(
    image: 'assets/home/choose1.png',
    title: 'Nike Air Max 200',
    price: '\$364.95',
    afterPrice: '\$260.00',
    time: '7 min ago',
  ),
  ProductModel(
    image: 'assets/product/Shoes2.png',
    title: 'Nike Air Max 720',
    price: '\$120.00',
    afterPrice: '\$90.00', 
    time: '2 hour ago',
  ),
  ProductModel(
    image: 'assets/product/shoes3.png',
    title: 'Nike Revolution 5',
    price: '\$80.00', 
    afterPrice: '\$59.99',
    time: '40 min ago',
  ),
];


final List<String> cards = [
  "DbL Card",
  "Visa Card",
  "MasterCard",
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
     
      body:  Padding(
          padding: const EdgeInsets.only(right: 8,left: 8,bottom: 8),
          child:CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    children: [
                      Gap(30),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: NotificationHeader(),
                    ),
                      Gap(20),
                      Row(
                        children: [
                          Gap(20),
                          CustomText(text: 'Recent',weight: FontWeight.bold,size: 22,)],
                      )
                    ],
                  ),
                ),
              ),

              SliverPadding(
                padding: EdgeInsetsGeometry.all(8),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount:products.length,
                    (context, index) {
                      final Product = products[index];
                      return NotificationItem(
                      image: Product.image,
                      title: Product.title,
                       price: Product.price,
                       afterPrice: Product.afterPrice, 
                       time: Product.time,
                    );
                    }
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3,
                  ),
                ),
              ),

            ],
          ),
        ),
    );
  }
}



class ProductModel {
  final String image;
  final String title;
  final String afterPrice;
  final String price;
  final String time;


  ProductModel({
    required this.image,
    required this.title,
    required this.price,
    required this.afterPrice,
    required this.time,
  });
}


