import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sneakers_animation/core/constants/strings.dart';
import '../../core/theme/app_colors.dart';


class AnimatedButtonWidget extends StatelessWidget {
  final Duration buttonDelayDuration;
  final Duration buttonPlayDuration;
  const AnimatedButtonWidget({
    super.key,
    required this.buttonDelayDuration,
    required this.buttonPlayDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
                width: double.infinity,
                height: 70,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                decoration: BoxDecoration(
                    color: AppColors.onBoardingButtonColor,
                    borderRadius: BorderRadius.circular(50)),
                child: AnimatedTextWidget(
                    buttonPlayDuration: buttonPlayDuration,
                    buttonDelayDuration: buttonDelayDuration))
            .animate()
            .slideY(
                begin: 2,
                end: 0,
                delay: buttonDelayDuration,
                duration: buttonPlayDuration,
                curve: Curves.easeInOutCubic)
      ],
    );
  }
}

class AnimatedTextWidget extends StatelessWidget {
  final Duration buttonPlayDuration;
  final Duration buttonDelayDuration;
  const AnimatedTextWidget({
    super.key,
    required this.buttonPlayDuration,
    required this.buttonDelayDuration,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(Strings.onBoardingButton,
          maxLines: 2,
          textAlign: TextAlign.center,
          
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white)),
    ).animate().scaleXY(
        begin: 0,
        end: 1,
        delay: buttonDelayDuration + 300.ms,
        duration: buttonPlayDuration,
        curve: Curves.easeInOutCubic);
  }
}
