import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownList extends StatefulWidget {
  const DropdownList({super.key});

  @override
  State<DropdownList> createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList> {
  // قائمة بالبطاقات (Model)
  final List<CardModel> cards = [
    CardModel(name: "DbL Card", number: "**** 0696 4629", imagePath: "assets/home/dollar Background Removed 1.png"),
    CardModel(name: "Visa Card", number: "**** 7421 1234", imagePath: "assets/home/visa.png"),
  ];

  // ده المتغير اللي بيخزن البطاقة اللي المستخدم اختارها
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
        child: _buildCardItem(card), // التصميم بتاعك
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
      maxHeight: 250, // ارتفاع القائمة المفتوحة
      decoration: BoxDecoration(
        color: Colors.white,
      ),
    ),

    menuItemStyleData: MenuItemStyleData(
      height: 90, // 👈 ارتفاع كل عنصر جوه القائمة
      customHeights: List.generate(cards.length, (index) => 90),
    ),
  ),
)

    );
  }

  // 📌 دي الـ widget اللي بتعمل شكل البيانات زي التصميم اللي بعتّه
  Widget _buildCardItem(CardModel card) {
    return Container(
      
      decoration: BoxDecoration(
       // إضافة Shadows
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
        // عند الضغط يتم اختيار البطاقة
        onTap: () => setState(() => selectedCard = card),

        contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
          // ✔ حتى لو مفيش leading يفضل في مسافة
        minLeadingWidth: 50,

        // ✔ ارتفاع مناسب للعنصر
        minVerticalPadding: 15,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),

        // صورة البطاقة
        leading: Image.asset(card.imagePath, width: 50),

        // اسم البطاقة
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

        // خلفية العنصر
        tileColor: Colors.white,

      ),
    );
  }
}

// Model Class - لتجميع بيانات البطاقة
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
