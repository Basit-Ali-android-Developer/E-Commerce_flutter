import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final double price;
  final int quantity;
  final String? variantColor;
  final String? variantSize;

  const ItemCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.price,
    required this.quantity,
    this.variantColor,
    this.variantSize,
  });

  @override
  Widget build(BuildContext context) {
    final String subtitleText = [
      variantColor ?? "Default Color",
      variantSize ?? "OS"
    ].join(" | ");

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Rounded Product Image Container
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imagePath,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 70,
                height: 70,
                color: const Color(0xFFF5F5F5),
                child: const Icon(Icons.image, color: Colors.grey),
              );
            },
          ),
        ),
        const SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16, // Slighly reduced text to look clean inside grouped listings
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A1A),
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "\$${price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                subtitleText,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF757575),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Qty: $quantity",
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF757575),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}