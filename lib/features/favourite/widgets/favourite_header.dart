import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungryapp/core/shared/bag_button.dart';
import 'package:hungryapp/core/shared/custom_text.dart';
import 'package:hungryapp/features/sidemenu/views/side_menu_view.dart';

class FavouriteHeader extends StatelessWidget {
  const FavouriteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                        children: [
                            GestureDetector(
                              onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => SideMenuView()));
                                },
                              child: Container(
                              width: 26,
                              height: 18,
                              child: Image.asset('assets/home/homeList.png'),
                                                        ),
                            ),
                          Spacer(),
                         CustomText(text: 'Favourite',size: 20,weight: FontWeight.bold,),
                          Spacer(),
                         BagButton()
                        ],
                      );
  }
}

