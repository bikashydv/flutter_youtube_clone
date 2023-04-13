// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AnimatedWidgetExample extends StatefulWidget {
  const AnimatedWidgetExample({super.key});

  @override
  State<AnimatedWidgetExample> createState() => _AnimatedWidgetExampleState();
}

class _AnimatedWidgetExampleState extends State<AnimatedWidgetExample>
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
    _animation = Tween<double>(begin: 0, end: 50).animate(animationCurve)
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageAnimatedWidget( animation: _animation,),
    );
  }
}

class ImageAnimatedWidget extends AnimatedWidget {
  final Animation<double> animation;
  ImageAnimatedWidget({
    required this.animation,
  }):super(listenable: animation);

  
  @override
  Widget build(BuildContext context) {
      return Transform.scale(
        scale: animation.value,
        child: Center(child: Icon(Icons.heart_broken),),
      );
  }

}
