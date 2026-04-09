import 'package:flutter/material.dart';
import 'package:hungryapp/core/shared/bag_button.dart';
import 'package:hungryapp/core/shared/custom_text.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
                       children: [

                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Container(
                                width: 40,
                                height: 32,
                                child: Stack(                          
                                  children: [
                                    Positioned(
                                      left: 14,
                                      top: 7,
                                  
                                      child: Icon(Icons.arrow_back_ios,size: 18,))],
                                ),
                              ),
                              radius: 27,
                            ),
                          ),
                            Spacer(),
                            CustomText(text: 'Sneaker Shop',color: Color(0xff2B2B2B),size: 18,weight: FontWeight.bold,),
                            Spacer(),
                            BagButton()
                          ],
                        ),
    );
  }
}

