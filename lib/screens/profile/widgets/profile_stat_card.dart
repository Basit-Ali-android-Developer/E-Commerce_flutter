import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileStatCard extends StatelessWidget {
  final String iconPath;
  final String count;
  final String label;
  final Color? iconColor;

  const ProfileStatCard({
    super.key,
    required this.iconPath,
    required this.count,
    required this.label,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 0,
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(
            color: AppColors.border,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 15,
                height: 15,
                colorFilter: ColorFilter.mode(
                  iconColor ?? AppColors.brown1,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                count,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}