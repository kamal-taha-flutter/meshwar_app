import 'package:flutter/material.dart';

class CustomButtonOnboard extends StatelessWidget {
  const CustomButtonOnboard({super.key, required this.text, required this.ontap});
 final String text;
 final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return  Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: ontap,
                  child:  Text( text ,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xff2B2B2B),
                    fontFamily: 'Raleway'
                  ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                        horizontal:140 ,
                        vertical: 24,
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                       ),),
                  );
  }
}

