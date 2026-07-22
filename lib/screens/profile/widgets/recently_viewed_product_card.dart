import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:ecommerce/core/constants/product.dart';
import 'package:flutter/material.dart';

class RecentlyViewedProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final bool isFavorite;
  final double? width;

  const RecentlyViewedProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.onFavoriteTap,
    this.isFavorite = false,
    this.width = 180,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.circular(16),
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.black.withOpacity(0.04),
        //       blurRadius: 8,
        //       spreadRadius: 1,
        //       offset: const Offset(0, 3),
        //     ),
        //   ],
        // ),

        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20), // Matching your card radius
          border: Border.all(
            color: AppColors.border, // Matching your Card side border color
            width: 1,
          ),
        ),


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // 1. Image Container with Floating Heart Button
            Stack(
              children: [
                // Rounded Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(20), // All-around rounded corners
                  child: Image.network(
                    product.imageUrl,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 150,
                      color: Colors.grey[200],
                      child: const Icon(Icons.broken_image, color: Colors.grey),
                    ),
                  ),
                ),

                // Floating Favorite Heart Button (Top-Right)
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: onFavoriteTap,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9), // Soft white background
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
                        size: 18,
                        color: isFavorite ? Colors.red : AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            Text(
              product.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 4),

            // 3. Price
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            ]
            ),
            )
          ],
        ),

      ),
    );
  }
}