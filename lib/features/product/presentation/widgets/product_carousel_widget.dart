import 'package:flutter/material.dart';
import 'package:hungryapp/core/constants/app_colors.dart';

// استخدام الـ Widget:
// ProductCarouselWidget(
//   height: 600, // اختياري - default 600
// )

class ProductCarouselWidget extends StatefulWidget {
  final double height;

  const ProductCarouselWidget({
    Key? key,
    this.height = 600,
  }) : super(key: key);

  @override
  _ProductCarouselWidgetState createState() => _ProductCarouselWidgetState();
}

class _ProductCarouselWidgetState extends State<ProductCarouselWidget>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _fadeAnimation;
  bool isAnimating = false;

  final List<ProductModel> products = [
    ProductModel(
      name: 'Nike Metcon 9',
      color: 'Peach/Coral',
      price: '\$130',
      //gradientColors: [Color(0xFFFFD6C9), Color(0xFFFFB4A0)],
      imageUrl: 'assets/product/shoes3.png',
    ),
    ProductModel(
      name: 'Nike Air Zoom',
      color: 'Red/White',
      price: '\$150',
      //gradientColors: [Color(0xFFFFCDD2), Color(0xFFEF9A9A)],
      imageUrl: 'assets/home/choose1.png',
    ),
    ProductModel(
      name: 'Nike React',
      color: 'Light Blue',
      price: '\$140',
      //gradientColors: [Color(0xFFB3E5FC), Color(0xFF81D4FA)],
      imageUrl: 'assets/product/shoes3.png',
    ),
    ProductModel(
      name: 'Nike Pegasus',
      color: 'Royal Blue',
      price: '\$160',
      //gradientColors: [Color(0xFF90CAF9), Color(0xFF5E92F3)],
      imageUrl: 'assets/home/choose1.png',
    ),
    ProductModel(
      name: 'Nike Revolution',
      color: 'Black/Gray',
      price: '\$120',
      //gradientColors: [Color(0xFFCFD8DC), Color(0xFF90A4AE)],
      imageUrl: 'assets/product/shoes3.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    _rotationAnimation = Tween<double>(begin: 0.15, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _changePage(int index) {
    if (isAnimating || index == currentIndex) return;

    setState(() {
      isAnimating = true;
    });

    _animationController.reset();
    setState(() {
      currentIndex = index;
    });
    _animationController.forward().then((_) {
      setState(() {
        isAnimating = false;
      });
    });
  }

  void _nextPage() {
    _changePage((currentIndex + 1) % products.length);
  }

  void _previousPage() {
    _changePage((currentIndex - 1 + products.length) % products.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      child: Stack(
        children: [
          // Main Display
           Positioned(
            child: _buildMainDisplay()),
          // Thumbnails
          Positioned(
            top: 220,
            child: _buildThumbnails()),
          //SizedBox(height: 15),
          // Page Indicators
        //  _buildPageIndicators(),
          //SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildMainDisplay() {
    return SizedBox(
      
      child: Stack(
        alignment: Alignment.center,
        children: [
        
      
          // White card background
          Transform.rotate(
            angle: -.2,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              constraints: BoxConstraints(maxWidth: 500),
              decoration: BoxDecoration(
               // color: Colors.white,
               
                borderRadius: BorderRadius.circular(25),
               
              ),
              child:Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedBuilder(
                              animation: _animationController,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: _scaleAnimation.value,
                                  child: Transform.rotate(
                                    angle: _rotationAnimation.value,
                                    child: Opacity(
                                      opacity: _fadeAnimation.value,
                                      child: Image.asset(
                                        products[currentIndex].imageUrl,
                                        height: 220,
                                        fit: BoxFit.contain,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Container(
                                            height: 220,
                                            child: Icon(Icons.image, size: 80, color: Colors.grey),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 100,
                            )
                ],
              ),
                  ),
          ), 
      
                       //stage
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    child: Image.asset('assets/product/stage.png'),
                  ),
                ),              
               
          // Navigation buttons
          Positioned(
            left: 175,
            bottom: 110,
            child: Container( 
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xff707B81),
                borderRadius: BorderRadius.circular(16)
              ),
              child: Row(
                children: [
                  _buildNavigationButton(Icons.chevron_left, _previousPage),
                  Spacer(),
                   _buildNavigationButton(Icons.chevron_right, _nextPage),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }

  Widget _buildNavigationButton(IconData icon, VoidCallback onPressed) {
    return  InkWell(
        onTap: isAnimating ? null : onPressed,
        borderRadius: BorderRadius.circular(12),
          child: Icon(
            icon,
            size: 26,
            color: isAnimating ? AppColors.primary : Colors.white,
          ),
        
      
    );
  }

  Widget _buildThumbnails() {
    return Container(
      height: 80,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(products.length, (index) {
            bool isSelected = index == currentIndex;
            return GestureDetector(
              onTap: () => _changePage(index),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
                margin: EdgeInsets.symmetric(horizontal: 6),
                width: isSelected ? 75 : 65,
                height: isSelected ? 75 : 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  border: Border.all(
                    color: isSelected ? AppColors.primary : Colors.grey.shade300,
                    width: isSelected ? 3 : 2,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.4),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // gradient: LinearGradient(
                          //   colors: [
                          //     products[index].gradientColors[0].withOpacity(0.3),
                          //     products[index].gradientColors[1].withOpacity(0.3),
                          //   ],
                          // ),
                        ),
                      ),
                      Center(
                        child: Image.network(
                          products[index].imageUrl,
                          fit: BoxFit.contain,
                          width: 50,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.image, size: 35, color: Colors.grey);
                          },
                        ),
                      ),
                      if (!isSelected)
                        Container(
                          color: Colors.white.withOpacity(0.3),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

//   Widget _buildPageIndicators() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(products.length, (index) {
//         bool isSelected = index == currentIndex;
//         return GestureDetector(
//           onTap: () => _changePage(index),
//           child: AnimatedContainer(
//             duration: Duration(milliseconds: 300),
//             margin: EdgeInsets.symmetric(horizontal: 3),
//             width: isSelected ? 28 : 7,
//             height: 7,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4),
//               color: isSelected ? Color(0xFF3B82F6) : Colors.grey.shade300,
//             ),
//           ),
//         );
//       }),
//     );
//   }
 }

class ProductModel {
  final String name;
  final String color;
  final String price;
  //final List<Color> gradientColors;
  final String imageUrl;

  ProductModel({
    required this.name,
    required this.color,
    required this.price,
   // required this.gradientColors,
    required this.imageUrl,
  });
}