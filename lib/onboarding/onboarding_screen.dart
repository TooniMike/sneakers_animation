import 'package:flutter/material.dart';
import '../core/widget/annotated_scaffold.dart';
import 'widgets/onboarding_allWidgets.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedScaffold(child: OnBoardingBodyWidget());
  }
}