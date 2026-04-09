import 'package:flutter/material.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/core/shared/custom_text.dart';
import 'package:hungryapp/features/home/widgets/love_button.dart';
import 'package:hungryapp/features/product/presentation/views/product_details.dart';



class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.itemName, required this.itemPrice, required this.itemImage});
 final String itemName;
 final String itemPrice;
 final String itemImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetails()));
      },
      child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(16)
                    ),
                    color: Colors.white,
                    child:  Container(
                        width: 180,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 5,
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                                      
                                children: [
                                  LoveButton()
                                ],
                              ),
                            ),
                            Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
      
                              child: Transform.rotate(
                                angle: -.2,
                                child: Container(
                                  height: 100,
                                  child: Image.asset(itemImage,fit: BoxFit.cover,),
                                ),
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
                            SizedBox(height: 5),
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
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Row(
                                children: [
                                  CustomText(
                                    text: '\$${itemPrice}',
                                    color: Colors.black,
                                    weight: FontWeight.w800,
                                    size: 18,
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.only(topLeft:Radius.circular(16),bottomRight: Radius.circular(16))
                                    ),
                                                                      child: Icon(Icons.add,color: Colors.white,),
                                  )
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

