import 'package:flutter/material.dart';

class CarouselView extends StatelessWidget {
  final double itemExtent;
  final List<Widget> children;

  const CarouselView({
    Key? key,
    required this.itemExtent,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: itemExtent,
        itemCount: children.length,
        itemBuilder: (context, index) {
          return children[index];
        },
      ),
    );
  }
}
