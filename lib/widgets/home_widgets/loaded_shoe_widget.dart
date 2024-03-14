import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sneakers_animation/data/model/shoe.dart';
import 'shoe_card_widget.dart';

class LoadedShoeWidget extends StatelessWidget {
  final List<Shoe> shoe;
  const LoadedShoeWidget({
    super.key,
    required this.shoe,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: shoe.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                'shoe_details',
                arguments: shoe[index],
              );
            },
            child: ShoeCardWidget(shoe: shoe[index]).animate().slideX(
                duration: 200.ms,
                delay: 0.ms,
                begin: 1,
                end: 0,
                curve: Curves.easeInOutSine),
          );
        });
  }
}
