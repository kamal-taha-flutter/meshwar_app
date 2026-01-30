import 'package:flutter/material.dart';

class LovesButton extends StatefulWidget {
  const LovesButton({super.key});

  @override
  State<LovesButton> createState() => _LoveButtonState();
}

class _LoveButtonState extends State<LovesButton>
    with SingleTickerProviderStateMixin {
  bool isLoved = false;

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _rotationAnimation = Tween<double>(begin: 0.1, end: 0.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    setState(() {
      isLoved = !isLoved;
    });

    _controller
      ..reset()
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Transform.rotate(
                angle: _rotationAnimation.value,
                child: Opacity(
                  opacity: _fadeAnimation.value,
                  child: Container(
                    height: 22,
                    child: Image.asset(
                      isLoved
                          ? 'assets/home/loveAfter.png'
                          : 'assets/home/loveBeforet.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
