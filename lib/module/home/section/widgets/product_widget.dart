import 'package:ecommerce_app/common/helper/string_helper.dart';
import 'package:ecommerce_app/style/colors.dart';
import 'package:ecommerce_app/style/text.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget(
      {super.key,
      required this.imageUrl,
      required this.category,
      required this.title,
      required this.rating,
      required this.selling,
      required this.price});

  final String imageUrl;
  final String category;
  final String title;
  final double rating;
  final int selling;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1 / 2,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 11),
      decoration: BoxDecoration(
        color: const Color(0xffFDF5F3),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              imageUrl,
              width: 150,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            category,
            style: AppTextStyle.textSmall.copyWith(
              color: AppColors.lightGrey,
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Text(
              title,
              style: AppTextStyle.textLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.orange,
                size: 14,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  '$rating/5 | ${formatNumber(double.parse(selling.toString()))} Terjual',
                  maxLines: 1,
                  style: AppTextStyle.textSmall.copyWith(
                    color: AppColors.lightGrey,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 13),
          Text(
            formatCurrency('$price'),
            style: AppTextStyle.textLarge.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
