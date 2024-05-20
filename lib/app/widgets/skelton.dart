import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../data/constants.dart';

class Skelton extends StatelessWidget {
  const Skelton({Key? key, this.height, this.width, this.radius})
      : super(key: key);
  final double? height, width, radius;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: darkColor,
      highlightColor: Colors.grey,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: darkColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(radius ?? 10)),
      ),
    );
  }
}
