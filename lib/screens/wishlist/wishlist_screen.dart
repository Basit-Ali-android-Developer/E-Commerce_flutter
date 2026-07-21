import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:ecommerce/core/constants/product.dart';
import 'package:ecommerce/core/widgets/product_card.dart';
import 'package:ecommerce/screens/cart/widgets/cart_item_card.dart';
import 'package:ecommerce/screens/home/widgets/wishlist_product_card.dart';
import 'package:ecommerce/screens/order_placement/check_out_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecommerce/core/widgets/static/cart_item.dart';
import 'package:ecommerce/core/widgets/static/mock_cart_data.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  SizedBox(width: 5,),

                  Text(
                    'E-Commerce',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary, // Matches your brand blue
                      letterSpacing: 1.2,
                    ),
                  ),


                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.shopping_bag,
                      size: 20,
                      // Note: Make sure AppColors.primary is defined elsewhere in your project!
                      color: AppColors.primary,
                    ),
                    onPressed: () {
                      // Your action here
                    },
                  ),

                ],
              ),

              SizedBox(height: 20,),

              const Text(
                "Your Wishlist",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.black),
              ),

              const Text(
                "6 items saved for later",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: AppColors.grey),
              ),


              const SizedBox(height: 20),


              // Vertical Product Grid

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child:

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: mockProducts.length,
                  itemBuilder: (context, index) {
                    final product = mockProducts[index];
                    return WishlistProductCard(
                      product: product,
                      width: null, // Width is managed by GridView cell constraints
                      onTap: () {
                        // Navigate to product details screen
                      },
                      onRemoveTap: () {
                        // Handle removing item from wishlist
                      },
                      onMoveToCartTap: () {
                        // Handle moving item to cart
                      },
                    );
                  },
                ),
              ),


            ],
          ),

        ),
      ),
    );
  }
}
