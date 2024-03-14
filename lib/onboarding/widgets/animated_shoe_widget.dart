import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sneakers_animation/core/constants/assets.dart';

class AnimatedShoeWidget extends StatelessWidget {
  final Duration dishPlayDuration;
  final Duration leavesDelayDuration;
  const AnimatedShoeWidget({
    super.key,
    required this.dishPlayDuration,
    required this.leavesDelayDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.shoe1,
      height: 300,
    )
        .animate()
        .scaleXY(
            delay: leavesDelayDuration,
            begin: 0,
            end: 1,
            duration: dishPlayDuration,
            curve: Curves.decelerate)
        .slide(begin: const Offset(0.7, -0.4), end: Offset.zero);
  }
}
