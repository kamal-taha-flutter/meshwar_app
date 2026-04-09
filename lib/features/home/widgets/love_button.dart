import 'package:flutter/material.dart';

class LoveButton extends StatefulWidget {
  const LoveButton({super.key});

  @override
  State<LoveButton> createState() => _LoveButtonState();
}
bool index = false;
class _LoveButtonState extends State<LoveButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
         index = !index;
          
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 17,
          child: index == false ? Image.asset('assets/home/loveBeforet.png',fit: BoxFit.fill,): Image.asset('assets/home/loveAfter.png',fit: BoxFit.fill),
        ),
      ),
    );
  }
}


