import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/widget/annotated_scaffold.dart';
import '../widgets/home_widgets/animated_appbar_widget.dart';
import '../widgets/home_widgets/animated_category_list.dart';
import '../widgets/home_widgets/animated_selected_category_widget.dart';
import '../widgets/home_widgets/animated_shoe_widget.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showShoeList = false;
  void changeListVisibility() {
    setState(() {
      _showShoeList = true;
    });
  }

  @override
  void initState() {
    Future.delayed(2550.ms, () => changeListVisibility());
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final avatarPlayDuration = 500.ms;
    final avatarWaitingDuration = 400.ms;
    final nameDelayDuration =
        avatarWaitingDuration + avatarWaitingDuration + 200.ms;
    final namePlayDuration = 800.ms;
    final categoryListPlayDuration = 750.ms;
    final categoryListDelayDuration =
        nameDelayDuration + namePlayDuration - 400.ms;
    final selectedCategoryPlayDuration = 400.ms;
    final selectedCategoryDelayDuration =
        categoryListDelayDuration + categoryListPlayDuration;
    return AnnotatedScaffold(
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 30,
                ),
                AnimatedAppBarWidget(
                    avatarWaitingDuration: avatarWaitingDuration,
                    avatarPlayDuration: avatarPlayDuration,
                    nameDelayDuration: nameDelayDuration,
                    namePlayDuration: namePlayDuration),
                const SizedBox(
                  height: 30,
                ),
                AnimatedCategoryList(
                  categoryListPlayDuration: categoryListPlayDuration,
                  categoryListDelayDuration: categoryListDelayDuration,
                ),
                const SizedBox(
                  height: 30,
                ),

                // Shoes Text
                AnimatedSelectedCategoryWidget(
                  selectedCategoryPlayDuration: selectedCategoryPlayDuration,
                  selectedCategoryDelayDuration: selectedCategoryDelayDuration,
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
          _showShoeList
              ? const AnimatedShoeWidget()
              : const SliverToBoxAdapter(
                  child: SizedBox(),
                )
        ],
      ),
    );
  }
}
