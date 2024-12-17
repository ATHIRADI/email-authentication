import 'package:flutter/material.dart';
import 'package:version2/utils/utils.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final double customVerticalPadding;
  final bool isLoading;

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.color,
    this.customVerticalPadding = AppSizes.paddingMd,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: customVerticalPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        child: Material(
          color: isLoading
              ? AppColors.BlackColor.withOpacity(0.6)
              : AppColors.Primary,
          child: InkWell(
            onTap: isLoading ? null : onPressed,
            child: Container(
              alignment: Alignment.center,
              padding: AppSizes.buttonpadding,
              child: Text(
                isLoading ? "Loading..." : text.toUpperCase(),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.WhiteColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
