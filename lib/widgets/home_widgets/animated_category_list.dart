import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'shoe_category_widget.dart';

class AnimatedCategoryList extends StatelessWidget {
  final Duration categoryListPlayDuration;
  final Duration categoryListDelayDuration;
  const AnimatedCategoryList({
    super.key,
    required this.categoryListPlayDuration,
    required this.categoryListDelayDuration,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 50, minHeight: 40),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 15),
        children:
            List.generate(_categories.length, (index) => _categories[index])
                .animate(interval: 100.ms, delay: categoryListDelayDuration)
                .slideX(
                    duration: categoryListPlayDuration,
                    begin: 3,
                    end: 0,
                    curve: Curves.easeInOutSine),
      ),
    );
  }
}

const _categories = [
  ShoeCategoryWidget(icon: "👨", name: "Men"),
  ShoeCategoryWidget(icon: "👩‍🦱", name: "Women"),
  ShoeCategoryWidget(icon: "🧒", name: "Kids"),
  ShoeCategoryWidget(icon: "👱‍♂️", name: "Others"),
];
