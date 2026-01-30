import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungryapp/core/shared/custom_text.dart';
import 'package:hungryapp/features/sidemenu/views/side_menu_view.dart';

class NotificationHeader extends StatelessWidget {
  const NotificationHeader({super.key});

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
                         CustomText(text: 'Notification',size: 20,weight: FontWeight.bold,),
                          Spacer(),
                         CircleAvatar(
                            backgroundColor: Colors.white,
                            child:Icon(CupertinoIcons.delete,),
                            radius: 23,
                          ),
                        ],
                      );
  }
}