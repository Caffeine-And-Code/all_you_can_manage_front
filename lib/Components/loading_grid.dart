import 'package:all_you_can_manage/Components/card_container.dart';
import 'package:all_you_can_manage/Utilities/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingGrid extends StatelessWidget {
  final bool loading;
  final int length;
  final CardContainerMode mode;
  final Widget singleLoadingElement;

  const LoadingGrid(
      {super.key,
      required this.loading,
      required this.length,
      required this.mode,
      required this.singleLoadingElement});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        padding:
            const EdgeInsets.only(left: 100, right: 100, bottom: 35, top: 35),
        child: Skeletonizer(
          effect: ShimmerEffect(
              duration: const Duration(milliseconds: 1500),
              baseColor: ColorsGetter.getColor(ColorsNames.navAndFooterBg),
              highlightColor: ColorsGetter.getColor(ColorsNames.primary)
                  .withOpacity(1)),
          containersColor: ColorsGetter.getColor(ColorsNames.navAndFooterBg),
          enabled: loading,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: mode == CardContainerMode.square250
                  ? 250
                  : (mode == CardContainerMode.rectangle_w320 ? 320 : 425),
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              childAspectRatio: mode == CardContainerMode.square250
                  ? 1
                  : (mode == CardContainerMode.rectangle_w320 ? 1.5 : 1.6),
            ),
            itemCount: length,
            itemBuilder: (context, index) {
              return singleLoadingElement;
            },
          ),
        ));
  }
}
