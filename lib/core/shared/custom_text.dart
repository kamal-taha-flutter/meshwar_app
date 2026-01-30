import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.weight,
    this.size,
    this.color, 
    this.line,
  });
  final String text;
  final FontWeight? weight;
  final double? size;
  final Color? color;
  final int? line;
  
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: line,
      style: TextStyle(
        fontWeight: weight,
        fontSize: size,
        color: color,
        fontFamily: 'Raleway',
      ),
    );
  }
}
