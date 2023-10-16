import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DefaultRatingbar extends StatelessWidget {
  const DefaultRatingbar(
      {super.key,
      this.itemSize = 18,
      this.itemCount = 5,
      this.minRating = 1,
      this.initialRating = 3,
      required this.direction,
      required this.onRatingUpdate});

  final double? itemSize;
  final int? itemCount;
  final double? minRating;
  final double? initialRating;
  final Axis direction;
  final Function(double) onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: itemSize!,
      itemCount: itemCount!,
      itemPadding: const EdgeInsets.only(right: 4),
      minRating: minRating!,
      initialRating: initialRating!,
      allowHalfRating: true,
      direction: direction,
      itemBuilder: (BuildContext context, int index) {
        return const Icon(
          Icons.star,
          color: Colors.orange,
        );
      },
      onRatingUpdate: onRatingUpdate,
    );
  }
}
