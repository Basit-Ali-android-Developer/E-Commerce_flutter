import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountSettingCards extends StatelessWidget {
  final String title;
  final String? description; // Optional description parameter
  final String iconPath;
  final VoidCallback onTap;
  final Color? iconColor;

  const AccountSettingCards({
    super.key,
    required this.title,
    this.description, // Optional
    required this.iconPath,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // Soft rounded pill-style corners
        border: Border.all(
          color: const Color(0xFFF0F1F5), // Light border frame
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 4.0,
        ),
        // Leading Icon with soft blue/grey rounded background
        leading: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F6FF), // Soft background container
            borderRadius: BorderRadius.circular(12),
          ),
          child: SvgPicture.asset(
            iconPath,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
              iconColor ?? AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
        // Menu Title
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        // Subtitle / Description (Shows only if description is provided)
        subtitle: description != null && description!.isNotEmpty
            ? Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Text(
            description!,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF8C919E),
              fontWeight: FontWeight.w400,
            ),
          ),
        )
            : null,
        // Trailing Chevron Icon
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16,
          color: Color(0xFF8C919E),
        ),
      ),
    );
  }
}