import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/assets.dart';
import '../../data/model/shoe.dart';

class ShoeCardWidget extends StatelessWidget {
  final Shoe shoe;
  const ShoeCardWidget({
    super.key,
    required this.shoe,
  });

  @override
  Widget build(BuildContext context) {
    final playDuration = 600.ms;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _AnimatedImageWidget(
              imageUrl: shoe.imageUrl[0],
              playDuration: playDuration,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AnimatedNameWidget(
                    playDuration: playDuration, name: shoe.name),
                _AnimatedDescriptionWidget(
                    playDuration: playDuration, description: shoe.description)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _AnimatedImageWidget extends StatelessWidget {
  final Duration playDuration;
  final String imageUrl;
  const _AnimatedImageWidget({
    required this.playDuration,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 150, maxWidth: 150),
      child: Image.network(imageUrl,
          fit: BoxFit.contain, alignment: Alignment.center,
          errorBuilder: (context, error, StackTrace) {
        return Image.asset(
          Assets.shoe1,
          fit: BoxFit.contain,
        );
      }),
    ).animate(delay: 400.ms).shimmer(duration: playDuration - 200.ms).flip();
  }
}

class _AnimatedNameWidget extends StatelessWidget {
  final Duration playDuration;
  final String name;
  const _AnimatedNameWidget({
    required this.playDuration,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 150),
      alignment: Alignment.centerLeft,
      child: Text(name,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: true,
              style: Theme.of(context).textTheme.titleLarge
              )
          .animate()
          .fadeIn(
              duration: 300.ms, delay: playDuration, curve: Curves.decelerate)
          .slideX(begin: 0.2, end: 0),
    );
  }
}

class _AnimatedDescriptionWidget extends StatelessWidget {
  final Duration playDuration;
  final String description;
  const _AnimatedDescriptionWidget({
    required this.playDuration,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 150),
      child: Text(description,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              softWrap: true,
              style: Theme.of(context).textTheme.labelLarge //label large
              )
          .animate()
          .scaleXY(
              begin: 0,
              end: 1,
              delay: 300.ms,
              duration: playDuration - 100.ms,
              curve: Curves.decelerate),
    );
  }
}
