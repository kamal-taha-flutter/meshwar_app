import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownList extends StatefulWidget {
  const DropdownList({super.key});

  @override
  State<DropdownList> createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList> {

  final List<CardModel> cards = [
    CardModel(name: "DbL Card", number: "**** 0696 4629", imagePath: "assets/home/dollar Background Removed 1.png"),
    CardModel(name: "Visa Card", number: "**** 7421 1234", imagePath: "assets/home/visa.png"),
  ];


  CardModel? selectedCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12, ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),

      child:DropdownButtonHideUnderline(
  child: DropdownButton2<CardModel>(
    isExpanded: true,
    hint: Text("Select Payment Method"),

    value: selectedCard,

    selectedItemBuilder: (context) {
  return cards.map((card) {
    return Row(
      children: [
        Image.asset(card.imagePath, width: 50, height: 50),
        SizedBox(width: 10),
        Text(card.name, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
      ],
    );
  }).toList();
},


    items: cards.map((card) {
      return DropdownMenuItem<CardModel>(
        value: card,
        child: _buildCardItem(card),
      );
    }).toList(),

    onChanged: (value) {
      setState(() {
        selectedCard = value;
      });
    },

    dropdownStyleData: DropdownStyleData(
      padding: EdgeInsets.zero,
      width: MediaQuery.of(context).size.width * 1, 
      maxHeight: 250,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
    ),

    menuItemStyleData: MenuItemStyleData(
      height: 90,
      customHeights: List.generate(cards.length, (index) => 90),
    ),
  ),
)

    );
  }


  Widget _buildCardItem(CardModel card) {
    return Container(
      
      decoration: BoxDecoration(

        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(16),
      ),

      child: ListTile(

        onTap: () => setState(() => selectedCard = card),

        contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),

        minLeadingWidth: 50,


        minVerticalPadding: 15,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),


        leading: Image.asset(card.imagePath, width: 50),


        title: Column(
          children: [
            Text(
              card.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, ),
            ),
            Text(
              card.number,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.grey.shade500 ),
            ),
          ],
        ),


        tileColor: Colors.white,

      ),
    );
  }
}


class CardModel {
  final String name;
  final String number;
  final String imagePath;

  CardModel({
    required this.name,
    required this.number,
    required this.imagePath,
  });
}


