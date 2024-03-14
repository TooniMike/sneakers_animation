import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/widget/annotated_scaffold.dart';
import '../data/model/shoe.dart';
import '../widgets/shoe_widgets/animated_app_bar_widget.dart';
import '../widgets/shoe_widgets/animated_shoe_widget.dart';

class ShoeScreen extends StatelessWidget {
  final Shoe shoe;
  const ShoeScreen({
    super.key,
    required this.shoe,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedScaffold(
      // assetPath: "assets/images/recipe_details.png",
      child: LayoutBuilder(builder: (context, constraints) {
        final appBarPlayTime = 800.ms;
        final appBarDelayTime = 400.ms;
        final dishPlayTime = 600.ms;
        return  Column(
              children: [
                AnimatedAppBarWidget(
                  name: shoe.name,
                  appBarPlayTime: appBarPlayTime,
                  appBarDelayTime: appBarDelayTime,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.04,
                ),
                const Spacer(),
                AnimatedShoeWidget(
                  constraints: constraints,
                  imageUrl: shoe.imageUrl[0],
                  dishPlayTime: dishPlayTime, 
                  title: shoe.title,
                  description: shoe.description,
                  name: shoe.name,
                  price: shoe.price,
                ),
              ],
            );
      }),
    );
  }
}
