import 'package:flutter/material.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/features/home/widgets/search_field.dart';

class SearchSpace extends StatelessWidget {
  const SearchSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SearchField()
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: CircleAvatar(
                              backgroundColor: AppColors.primary,
                              child: Container(
                                width: 40,
                                height: 32,
                                child: Image.asset('assets/home/filtter.png'),
                              ),
                              radius: 27,
                            ),
                          ),
                        ],
                      );
  }
}