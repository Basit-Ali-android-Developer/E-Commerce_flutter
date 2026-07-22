import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String imagePath;
  final String name;
  final String email;
  final String badgeText;
  final bool isVerified;

  const ProfileHeader({
    super.key,
    required this.imagePath,
    required this.name,
    required this.email,
    this.badgeText = "Platinum Member",
    this.isVerified = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 1. Profile Image Container with Overlay Verified Badge
        SizedBox(
          width: 110,
          height: 110,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Circular Avatar with White Border & Elevation Shadow
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 15,
                      spreadRadius: 2,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(3.0), // White border effect
                child: ClipOval(
                  child: Image.asset(
                    imagePath, // Local PNG path (e.g. 'assets/images/user.png')
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[200],
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),

              // Verified Badge Overlay at Bottom Right
              if (isVerified)
                Positioned(
                  bottom: 6,
                  right: 6,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.primary, // Blue background
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.verified,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // 2. Name Text
        Text(
          name,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            letterSpacing: -0.3,
          ),
        ),

        const SizedBox(height: 4),

        // 3. Email Text
        Text(
          email,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF7C828A),
          ),
        ),

        const SizedBox(height: 12),

        // 4. Pill Membership Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.stars_rounded,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                badgeText,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}