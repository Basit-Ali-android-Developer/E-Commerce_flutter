import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String stockStatus;
  final Color stockColor;
  final String deliveryInfo;
  final double price;
  final double originalPrice;
  final int discount;
  final int quantity;
  final bool isChecked;
  final ValueChanged<bool?> onCheckedCallback;
  // final VoidCallback onDeleteCallback;
  // final VoidCallback onIncrement;
  // final VoidCallback onDecrement;

  const CartItemCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.stockStatus,
    required this.stockColor,
    required this.deliveryInfo,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.quantity,
    required this.isChecked,
    required this.onCheckedCallback,
    // required this.onDeleteCallback,
    // required this.onIncrement,
    // required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     // margin: const EdgeInsets.only(bottom: 16), // Uncommented to separate cards
      padding: const EdgeInsets.all(12),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(16),
      //
      //   // --- UPDATED ELEVATION SHADOW ---
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black.withOpacity(0.06), // A slightly darker, natural shadow tint
      //       spreadRadius: 0,                       // Keeps the shadow crisp
      //       blurRadius: 12,                        // Makes the shadow softer and spread out more
      //       offset: const Offset(0, 4),            // Pushes the shadow down to give a floating card effect
      //     ),
      //   ],
      //   // ---------------------------------
      //
      // ),

      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20), // Matching your card radius
        border: Border.all(
          color: AppColors.border, // Matching your Card side border color
          width: 1,
        ),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Checkbox (Centered vertically relative to image)
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: isChecked,
                onChanged: onCheckedCallback,
                activeColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),


          ClipRRect(
            // Change this line to apply rounding to ALL 4 corners
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imagePath,
              width: 85,
              height: 85,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 85,
                  height: 85,
                  color: Colors.grey[200],
                  child: const Icon(Icons.image, color: Colors.grey),
                );
              },
            ),
          ),



          const SizedBox(width: 12),

          // Product Details (Expands to take remaining space)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Delete button row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(Icons.delete_outline, color: Colors.grey, size: 22),
                      //onPressed: onDeleteCallback,
                      onPressed: () {

                      },
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                // Stock status & Delivery row
                Row(
                  children: [
                    Text(
                      stockStatus,
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: stockColor),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      height: 12,
                      width: 1,
                      color: Colors.grey[300],
                    ),
                    Expanded(
                      child: Text(
                        deliveryInfo,
                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.blue),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),


                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "\$$price",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "\$$originalPrice",
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "$discount% OFF",
                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.orange),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Quantity Counter (Aligned right inside column)
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.remove, size: 16, color: Colors.grey),
                         // onPressed: onDecrement,
                          onPressed: () {
                            // Your action here
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "$quantity",
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.add, size: 16, color: Colors.blue),
                          //onPressed: onIncrement,
                          onPressed: () {
                            // Your action here
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}