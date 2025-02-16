import 'package:flutter/material.dart';

enum CardContainerMode{
    square200,
    rectangle_w320,
    rectangle_w400
  } 

class CardContainer extends StatelessWidget {
  final List<Widget> children;
  final CardContainerMode mode;
  late final SliverGridDelegateWithMaxCrossAxisExtent gridDelegate;
  CardContainer({super.key,required this.children,required this.mode}){
    gridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: mode == CardContainerMode.square200 ? 200 : (mode == CardContainerMode.rectangle_w320 ? 320 : 425),
      crossAxisSpacing: 30,
      mainAxisSpacing: 30,
      childAspectRatio: mode == CardContainerMode.square200 ? 1 : (mode == CardContainerMode.rectangle_w320 ? 1.5 : 1.6),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 100,right: 100,bottom: 35,top: 35),
          child:
          GridView.builder(
            gridDelegate: gridDelegate,
            clipBehavior: Clip.none,
            itemCount: children.length,
            itemBuilder: (BuildContext context, int index) {
              return children[index];
            },
          ), 
          
        );
  }
}