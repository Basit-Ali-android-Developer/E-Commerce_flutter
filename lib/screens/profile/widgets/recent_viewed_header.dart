import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RecentViewedHeader extends StatelessWidget {
  final String title;
 // final IconData icon;
  final Color iconColor;
  final VoidCallback? onClearPressed;

  const RecentViewedHeader({
    super.key,
    required this.title,
   // this.icon = Icons.bolt,
    this.iconColor = const Color(0xFF9E6514),
    this.onClearPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Side: Icon & Title
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black, // Matches your brand blue
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),

          // Right Side: "View All" Button
          GestureDetector(
            onTap: onClearPressed,
            behavior: HitTestBehavior.opaque,
            child: Text(
              'Clear',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: AppColors.primary, // Your blue brand color
              ),
            ),
          ),
        ],
      ),
    );
  }
}