import 'package:ecommerce_app/style/colors.dart';
import 'package:flutter/material.dart';

class DefaultDividerWidget extends StatelessWidget {
  const DefaultDividerWidget({
    super.key,
    this.height,
    this.color = AppColors.lightGrey,
    this.indent,
    this.endIndent,
    this.thickness = 0.6,
  });

  final double? height;
  final Color? color;
  final double? indent;
  final double? endIndent;
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      color: AppColors.lightGrey,
      height: height,
      indent: indent,
      endIndent: endIndent,
    );
  }
}
