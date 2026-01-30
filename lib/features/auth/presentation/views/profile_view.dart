import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungryapp/core/constants/app_colors.dart';
import 'package:hungryapp/core/shared/custom_auth_button.dart';
import 'package:hungryapp/core/shared/custom_text.dart';
import 'package:hungryapp/features/auth/presentation/widgets/profile_field.dart';
import 'package:hungryapp/features/auth/presentation/widgets/profile_header.dart';

// ignore: must_be_immutable
class ProfileView extends StatefulWidget {
   ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
TextEditingController _firstName =TextEditingController();

TextEditingController _lastName =TextEditingController();

TextEditingController _Phone =TextEditingController();

TextEditingController _Email =TextEditingController();

TextEditingController _Address =TextEditingController();

@override
  void initState() {
    _firstName.text = 'Kamal';
    _lastName.text = 'Taha';
    _Phone.text = '+20 114 386 0531';
    _Email.text = 'kamaltaha298@gmail.com';
    _Address.text = 'Nefia-Tanta-Elgarbia';

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ProfileHeader(),
              ),
              Gap(30),
              Center(
                child:Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.primary,
                      radius: 67,
                      child: CircleAvatar(
                          radius: 65, // حجم الدائرة
                          backgroundImage: AssetImage('assets/home/profile.jpg'), // الصورة كخلفية
                          backgroundColor: Colors.transparent, // (اختياري) جعل الخلفية شفافة في حالة وجود أجزاء شفافة في الصورة
                        ),
                    ),
                      Gap(5),
                      CustomText(text: '${_firstName.text } ${_lastName.text }',size: 20,weight: FontWeight.bold,),
                      CustomText(text: 'Change Profile Picture',size: 14,weight: FontWeight.bold,color: AppColors.primary,),
          
                  ],
                )
                 ),
                Gap(30),
                ProfileField(controller: _firstName, labelName: 'First Name'),
                Gap(25),
                ProfileField(controller: _lastName, labelName: 'Last Name'),
                Gap(25),
                ProfileField(controller: _Phone, labelName: 'Mobile Number'),
                Gap(25),
                ProfileField(controller: _Email, labelName: 'Email'),
                Gap(25),
                ProfileField(controller: _Address, labelName: 'Address'),
                Gap(25),
                ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 13),
                    shape:RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.darkPrimary),
                      borderRadius: BorderRadiusGeometry.circular(16)
                    ),
                    leading:Image.asset('assets/home/visa.png',width: 70,) ,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Debit card', size: 16,weight: FontWeight.bold,),
                        CustomText(text: '3566 **** **** 0505', size: 16,color: Colors.grey.shade600),
                      ],
                    ),
                    tileColor:Color(0xffF3F4F6) ,
                    trailing:  CustomText(text: 'Default', size: 16,color: AppColors.primary,weight: FontWeight.bold,),
                  ),
          
                  Gap(30),
                  CustomButton(text: 'Edit', color: AppColors.primary, textColor: Colors.white, width: double.infinity),
                Gap(30)
            ],
          ),
        ),
      ),

      
    );
  }
}
