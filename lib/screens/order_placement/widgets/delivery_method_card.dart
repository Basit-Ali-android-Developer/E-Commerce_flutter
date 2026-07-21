import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DeliveryMethodCard extends StatelessWidget {
  final String title;
  final String duration;
  final String price;
  final bool isFastest;
  final bool isSelected;
  final VoidCallback onTap;

  const DeliveryMethodCard({
    super.key,
    required this.title,
    required this.duration,
    required this.price,
    this.isFastest = false,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color brandBlue = Color(0xFF0046D5);
    const Color unselectedBorderColor = Color(0xFFEFEFEF);
    const Color textGrey = Color(0xFF757575);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? brandBlue : unselectedBorderColor,
            width: isSelected ? 2.0 : 1.0,
          ),


          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.02),
          //     blurRadius: 8,
          //     offset: const Offset(0, 4),
          //   ),
          // ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left Side text info stack
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                          color: isSelected ? Colors.black : const Color(0xFF424242),
                        ),
                      ),

                      if (isFastest) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: brandBlue,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Text(
                            'FASTEST',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    duration,
                    style: const TextStyle(
                      fontSize: 14,
                      color: textGrey,
                    ),
                  ),
                ],
              ),
            ),

            // Middle Price text label
            Text(
              price,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSelected ? brandBlue : const Color(0xFF424242),
              ),
            ),
            const SizedBox(width: 16),

            // Custom CSS styled Radio Circle matching UI exactly
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? brandBlue : const Color(0xFF9E9E9E),
                  width: isSelected ? 6.5 : 2, // Thick inner border acts as native radio center filling
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}