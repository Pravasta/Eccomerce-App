import 'package:ecommerce_app/module/detail_product/view/detail_product.dart';
import 'package:ecommerce_app/module/home/controller/home_controller.dart';
import 'package:ecommerce_app/module/home/section/widgets/product_widget.dart';
import 'package:ecommerce_app/style/colors.dart';
import 'package:ecommerce_app/widgets/misc/default_circluar_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductViewSection extends StatelessWidget {
  const ProductViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return const DefaultCircularProgress(
            color: AppColors.primaryColor,
          );
        }

        return Container(
          padding: const EdgeInsets.only(bottom: 65),
          width: double.infinity,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: value.product.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 300,
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              childAspectRatio: 0.8,
              crossAxisSpacing: 14,
            ),
            itemBuilder: (context, index) {
              final data = value.product[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return DetailProduct(data: data);
                    }),
                  );
                },
                child: ProductWidget(
                  title: data.title,
                  category: data.category,
                  imageUrl: data.imageUrl,
                  rating: data.rating,
                  price: data.price,
                  selling: data.selling,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
