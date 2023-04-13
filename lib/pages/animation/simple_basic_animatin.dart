import 'package:flutter/material.dart';
import 'dart:math' as math;

class SimpleBasicAnimation extends StatefulWidget {
  @override
  State<SimpleBasicAnimation> createState() => _SimpleBasicAnimationState();
}

class _SimpleBasicAnimationState extends State<SimpleBasicAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    final animationCurve = CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceIn,
        reverseCurve: Curves.easeInExpo);
    _animation = Tween<double>(begin: 0, end: 200).animate(animationCurve)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //  SimpleBasicAnimation({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.scale(
        scale: _animation.value,
        // offset: Offset(_animation.value, _animation.value),
        // offset: Offset(0, _animation.value),

        child: Center(
          child: Container(
            width: 150,
            height: 150,
            child: Image.asset("assets/bird.png"),
          ),
        ),
      ),
    );
  }
}
