import 'package:flutter/material.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/core/shared/custom_auth_button.dart';
import 'package:hungryapp/core/shared/custom_text.dart';


import 'package:hungryapp/features/product/presentation/widgets/loves_button.dart';
import 'package:hungryapp/features/product/presentation/widgets/product_carousel_widget.dart';
import 'package:hungryapp/features/product/presentation/widgets/product_header.dart';
import 'package:hungryapp/features/product/presentation/widgets/read_more.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});
 static const String screenRoute = 'product_details';
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
final String text = 'The Nike Air Max 270 delivers visible Air under every step. Inspired by two icons of big Air — the Air Max 180 and Air Max 93 — it features Nike’s biggest heel Air unit yet for a super-soft ride that feels as remarkable as it looks. The sleek, running-inspired design roots you to everything Nike while the stretchy inner sleeve and bootie construction offer a snug, comfortable fit perfect for everyday wear.';

 bool readMore = true ; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7F9),
      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 5,),
              ProductHeader(ontap: () { Navigator.pop(context); },),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(width:15 ,),
                  CustomText(text:'Nike Air Max 270 ',color: Color(0xff2B2B2B),weight: FontWeight.bold,size: 30,),
                ],
              ),
              Row(
                children: [
                  SizedBox(width:15 ,),
                  CustomText(text:'Essential ',color: Color(0xff2B2B2B),weight: FontWeight.bold,size: 30,),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  SizedBox(width:15 ,),
                  CustomText(text:'Men\'s Shoes ',color: Color(0xff707B81),weight: FontWeight.bold,size: 17,),
                ],
              ),
              Row(
                children: [
                  SizedBox(width:15 ,),
                  CustomText(text:'\$179.39 ',color: Color(0xff2B2B2B),weight: FontWeight.bold,size: 30,),
                ],
              ),
              ProductCarouselWidget(),
              
              Row(
                children: [
                  SizedBox(width:15 ,),
                  Expanded(child: CustomText(text:text,color: Color(0xff707B81),weight: FontWeight.bold,size: 17,line:readMore? 3:9,)),
                ],
              ),
            
              ReadMore(ontap: (){
                setState(() {
                  readMore = !readMore;
                });
              }, isReadMore: readMore),
        

              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xffD9D9D9),
                    child: Container(
                      width: 40,
                      height: 40,
                      child: LovesButton(),
                    ),
                    radius: 30,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  CustomButton(
                    text: 'Add To Cart',
                    color: AppColors.primary,
                    textColor: Colors.white,
                    iconImage: 'assets/product/bagButton.png',
                    width: 270,
                  ),
                ],
                            ),
              )
            ],
             
          ),
      ),
      );
  }
}

