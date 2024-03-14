import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../core/constants/assets.dart';
import 'animated_name_widget.dart';



class AnimatedAppBarWidget extends StatelessWidget {
  final Duration avatarWaitingDuration;

  final Duration avatarPlayDuration;

  final Duration nameDelayDuration;

  final Duration namePlayDuration;

  const AnimatedAppBarWidget({
    super.key,
    required this.avatarWaitingDuration,
    required this.avatarPlayDuration,
    required this.nameDelayDuration,
    required this.namePlayDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        AnimatedNameWidget(
          namePlayDuration: namePlayDuration,
          nameDelayDuration: nameDelayDuration,
        ),
        Expanded(child: Container()),
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.blue.shade900,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(Assets.profileImage)),
        )
            .animate()
            .scaleXY(
                begin: 0,
                end: 2,
                duration: avatarPlayDuration,
                curve: Curves.easeInOutSine)
            .then(delay: avatarWaitingDuration)
            .scaleXY(begin: 3, end: 1)
            .slide(begin: const Offset(-4, 6), end: Offset.zero),
        const SizedBox(
          width: 25,
        )
      ],
    );
  }
}
