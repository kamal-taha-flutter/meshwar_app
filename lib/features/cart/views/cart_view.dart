import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/core/shared/custom_auth_button.dart';
import 'package:hungryapp/core/shared/custom_text.dart';
import 'package:hungryapp/features/cart/widgets/cart_header.dart';
import 'package:hungryapp/features/cart/widgets/cart_item.dart';
import 'package:hungryapp/features/cart/widgets/dashed_divider.dart';
import 'package:hungryapp/features/cart/widgets/dropdown_list.dart';

// ignore: must_be_immutable
class CartView extends StatelessWidget {
   CartView({super.key});
  final String selectedCard = "DbL Card";

List<ProductModel> products = [
  ProductModel(
    image: 'assets/home/choose1.png',
    title: 'Nike Air Max 200',
    price: '\$94.05',
  ),
  ProductModel(
    image: 'assets/product/Shoes2.png',
    title: 'Nike Air Max 720',
    price: '\$120.00',
  ),
  ProductModel(
    image: 'assets/product/shoes3.png',
    title: 'Nike Revolution 5',
    price: '\$80.00',
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
          padding: const EdgeInsets.only(right: 8,left: 8,top: 8,bottom: 300),
          child:CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                    CartHeader(),
                      SizedBox(height: 10),
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
                      return CartItem(
                      image: Product.image,
                      title: Product.title,
                       price: Product.price,
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

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 330,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      
                          CustomText(text: 'Contact Information',size: 16,weight: FontWeight.bold,),
                          Gap(20),

                        Row(
                          children: [
                            
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(8)
                              ),
                              child: Icon(Icons.mail_outline)),
                            Gap(6),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: 'emmanueloyiboke@gmail.com',size: 18,weight: FontWeight.bold,),
                                CustomText(text: 'Email',size: 16,weight: FontWeight.bold,color: Colors.grey.shade600,),
                              ],
                            ),
                            Spacer(),
                            Icon(CupertinoIcons.pencil,size: 35,color: Colors.grey.shade600 ,)
                          ],
                        ),
                        Gap(20),

                        Row(
                          children: [
                            
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(8)
                              ),
                              child: Icon(CupertinoIcons.phone)),
                            Gap(6),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text( '+234-811-732-5298',style:TextStyle( fontSize: 18,fontWeight: FontWeight.bold)),
                                CustomText(text: 'Phone',size: 16,weight: FontWeight.bold,color: Colors.grey.shade600,),
                              ],
                            ),
                            Spacer(),
                            Icon(CupertinoIcons.pencil,size: 35,color: Colors.grey.shade600 ,)
                          ],
                        ),
                        Gap(20),
                          CustomText(text: 'Payment Method',size: 16,weight: FontWeight.bold,),

                        DropdownList()


                        ],
                      ),
                    ),
                  ),
                ),
              ),
              
            ],
          ),
      ),
       



      bottomSheet: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            children: [
              Row(
                children: [
                  CustomText(
                    text: 'Subtotal',
                    size: 18,
                    color: Colors.grey.shade700,
                    weight: FontWeight.w600,
                  ),
                  Spacer(),
                  CustomText(
                    text: '\$753.95',
                    size: 18,
                    weight: FontWeight.w900,
                  ),
                ],
              ),
              Gap(20),
              Row(
                children: [
                  CustomText(
                    text: 'Delivery',
                    size: 18,
                    color: Colors.grey.shade700,
                    weight: FontWeight.w600,
                  ),
                  Spacer(),
                  CustomText(
                    text: '\$60.20',
                    size: 18,
                    weight: FontWeight.w900,
                  ),
                ],
              ),
              Gap(20),
              DashedDivider(
                color: Colors.grey.shade500,
                dashWidth: 5,
                dashSpace: 7,
              ),
              Gap(20),
              Row(
                children: [
                  CustomText(
                    text: 'Total Cost',
                    size: 18,
                    weight: FontWeight.bold,
                  ),
                  Spacer(),
                  CustomText(
                    text: '\$814.15',
                    size: 18,
                    color: AppColors.primary,
                    weight: FontWeight.w900,
                  ),
                ],
              ),
              Gap(30),
              CustomButton(
                text: 'Checkout',
                color:AppColors.primary,
                textColor: Colors.white,
                width: double.infinity,
                onTap: (){
                   showDialog(
                    context: context,
                    builder: (context){
                     return Dialog(
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 15),
                        child: Container(
                          color: Colors.white,
                           width: double.infinity,
                            child:Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('assets/home/success.png',height: 150,),
                                Gap(15),
                                CustomText(text: 'Your Payment Is\n     Successful', size: 20,weight: FontWeight.bold,),
                                 Gap(30),
                                CustomButton(text: 'Back To Shopping',
                                 onTap: (){
                                  Navigator.pop(context);
                                }, width: 210, color: AppColors.primary, textColor: Colors.white, isLoading: false,)
                              ],
                            ) ,
                          ),
                      ),
                      
                     ); 
                    });
                }, isLoading: false,)
            ],
          ),
        ),
      ),
    );
  }
}



class ProductModel {
  final String image;
  final String title;
  final String price;

  ProductModel({
    required this.image,
    required this.title,
    required this.price,
  });
}


