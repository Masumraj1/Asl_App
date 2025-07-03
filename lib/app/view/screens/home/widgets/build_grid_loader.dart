import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGridLoader extends StatelessWidget {
  final int itemCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final int crossAxisCount;
  final double childAspectRatio;

  const ShimmerGridLoader({
    Key? key,
    this.itemCount = 10,
    this.crossAxisSpacing = 10,
    this.mainAxisSpacing = 10,
    this.crossAxisCount = 2,
    this.childAspectRatio = 0.75,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(10),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              children: [
                Container(height: 150, width: double.infinity, color: Colors.white),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(height: 20, width: double.infinity, child: DecoratedBox(decoration: BoxDecoration(color: Colors.white))),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
