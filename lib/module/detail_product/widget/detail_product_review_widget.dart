import 'package:ecommerce_app/widgets/misc/default_rating_bar.dart';
import 'package:flutter/material.dart';

import '../../../common/constant/url_assets.dart';
import '../../../style/colors.dart';
import '../../../style/text.dart';
import '../../../widgets/misc/default_divider_widget.dart';

class DetailProductReviewWidget extends StatelessWidget {
  const DetailProductReviewWidget(
      {super.key,
      required this.name,
      required this.review,
      required this.imageUrl,
      required this.initialRating});

  final String name;
  final String review;
  final String imageUrl;
  final double initialRating;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Image.asset(
                    imageUrl,
                    width: 50,
                  ),
                  const SizedBox(),
                ],
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultRatingbar(
                              initialRating: initialRating,
                              direction: Axis.horizontal,
                              onRatingUpdate: (p0) {},
                            ),
                            const SizedBox(height: 8),
                            Text(
                              name,
                              style: AppTextStyle.textMedium.copyWith(
                                color: AppColors.greyLightColor,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(UrlAsset.like, width: 25),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      review,
                      style: AppTextStyle.textMedium.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 14),
          const DefaultDividerWidget(
            thickness: 0.6,
          ),
        ],
      ),
    );
  }
}
