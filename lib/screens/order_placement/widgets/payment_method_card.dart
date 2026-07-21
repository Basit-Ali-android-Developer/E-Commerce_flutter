import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String svgPath;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.svgPath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color brandBlue = Color(0xFF0046D5);
    const Color unselectedBorderColor = Color(0xFFEFEFEF);
    const Color textGrey = Color(0xFF5E6366);

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0, // 0 elevation as requested
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            // Highlight border if selected, otherwise use a clean light grey border
            color: isSelected ? brandBlue : unselectedBorderColor,
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                width: 52,
                height: 52,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),


                child: SvgPicture.asset(
                  svgPath,
                  fit: BoxFit.contain,
                ),
              ),


              const SizedBox(width: 16),

              // --- TITLE & SUBTITLE COLUMN ---
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 13,
                        color: textGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),

              // --- RADIO SELECTOR CIRCLE ---
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? brandBlue : const Color(0xFFD1D5DB),
                    width: isSelected ? 6.5 : 1.5, // Fills inner dot smoothly when selected
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}