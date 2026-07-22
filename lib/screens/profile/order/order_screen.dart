import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:ecommerce/core/constants/product.dart';
import 'package:ecommerce/core/widgets/product_card.dart';
import 'package:ecommerce/screens/home/widgets/section_header.dart';
import 'package:ecommerce/screens/profile/order/widgets/order_card.dart';
import 'package:ecommerce/screens/profile/widgets/account_setting_cards.dart';
import 'package:ecommerce/screens/profile/widgets/profile_header.dart';
import 'package:ecommerce/screens/profile/widgets/profile_stat_card.dart';
import 'package:ecommerce/screens/profile/widgets/recent_viewed_header.dart';
import 'package:ecommerce/screens/profile/widgets/recently_viewed_product_card.dart';
import 'package:ecommerce/screens/wishlist/widgets/wishlist_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

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
                  // Back Arrow Button
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 25,
                      color: AppColors.primary,
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Pops back to previous screen
                    },
                  ),

                  // Header Title
                  Text(
                    'E-Commerce',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      letterSpacing: 1.2,
                    ),
                  ),

                  // Right Action Button (Cart)
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.shopping_bag,
                      size: 20,
                      color: AppColors.primary,
                    ),
                    onPressed: () {
                      // Your cart action here
                    },
                  ),
                ],
              ),

              SizedBox(height: 20,),

              const Text(
                "My Orders",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.black),
              ),

              const Text(
                "Manage and track your recent purchases",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: AppColors.grey),
              ),


              const SizedBox(height: 20),

// item list---------------------------------------------------------------------

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(), // Keeps scrolling bound to the parent view
                  itemCount: mockProducts.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16), // Spacing between cards
                  itemBuilder: (context, index) {
                    final product = mockProducts[index];
                    return OrderCard(
                      product: product,
                      width: double.infinity, // Full width for top-to-bottom layout
                      onViewDetails: () {
                        // View Details logic
                      },
                      onTrackOrder: () {
                        // Track Order logic
                      },
                      onBuyAgain: () {
                        // Buy Again logic
                      },
                      onLeaveReview: () {
                        // Leave Review logic
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

            ],
          ),

        ),
      ),
    );
  }
}
