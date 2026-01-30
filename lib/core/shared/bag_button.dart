import 'package:flutter/material.dart';
import 'package:hungryapp/features/cart/views/cart_view.dart';

class BagButton extends StatelessWidget {
  const BagButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => CartView()));
      },
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Container(
          width: 40,
          height: 32,
          child: Image.asset('assets/home/bag.png'),
        ),
        radius: 23,
      ),
    );
  }
}
