import 'package:flutter/material.dart';
import 'package:hungryapp/core/shared/bag_button.dart';
import 'package:hungryapp/features/sidemenu/views/side_menu_view.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

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
                          Container(
                            width: 120,
                            height: 80,
                            child: Image.asset('assets/home/home.png'),
                          ),
                          Spacer(),
                          BagButton()

                        ],
                      );
  }
}

