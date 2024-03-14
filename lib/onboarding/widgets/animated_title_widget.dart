import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sneakers_animation/core/theme/app_colors.dart';

import '../../core/constants/strings.dart';

class AnimatedTitleWidget extends StatelessWidget {
  final Duration titleDuration;
  final Duration mainPlayDuration;

  const AnimatedTitleWidget({
    super.key,
    required this.titleDuration,
    required this.mainPlayDuration,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text.rich(
          TextSpan(
              style: Theme.of(context).textTheme.displaySmall,
              children: const [
                TextSpan(
                  text: Strings.onBoardingTitle,
                ),
                TextSpan(
                    text: ' everyday',
                    style: TextStyle(color: AppColors.timeLineColor)),
              ]),
          textAlign: TextAlign.center,
        ),
      ),
    )
        .animate()
        .slideY(
            begin: -0.2,
            end: 0,
            delay: titleDuration,
            duration: mainPlayDuration,
            curve: Curves.easeInOutCubic)
        .scaleXY(
            begin: 0,
            end: 1,
            delay: titleDuration,
            duration: mainPlayDuration,
            curve: Curves.easeInOutCubic);
  }
}
