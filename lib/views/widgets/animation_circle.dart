// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AnimationCircle extends StatefulWidget {
  Widget child;
  AnimationCircle({Key? key, required this.child}) : super(key: key);

  @override
  State<AnimationCircle> createState() => _AnimationCircleState();
}

class _AnimationCircleState extends State<AnimationCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
    );
    controller.forward();
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(controller),
      child: widget.child,
    );
  }
}
