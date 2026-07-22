import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:ecommerce/core/constants/product.dart';
import 'package:ecommerce/core/widgets/product_card.dart';
import 'package:ecommerce/screens/home/widgets/section_header.dart';
import 'package:ecommerce/screens/profile/order/order_screen.dart';
import 'package:ecommerce/screens/profile/setting/setting_screen.dart';
import 'package:ecommerce/screens/profile/widgets/account_setting_cards.dart';
import 'package:ecommerce/screens/profile/widgets/profile_header.dart';
import 'package:ecommerce/screens/profile/widgets/profile_stat_card.dart';
import 'package:ecommerce/screens/profile/widgets/recent_viewed_header.dart';
import 'package:ecommerce/screens/profile/widgets/recently_viewed_product_card.dart';
import 'package:ecommerce/screens/wishlist/widgets/wishlist_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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

// user profile details ---------------------------------------------------------

              const Center(
                child: ProfileHeader(
                  imagePath: 'assets/images/user_profile.png',
                  name: "Basit Ali",
                  email: "ali@premium.com",
                  badgeText: "Platinum Member",
                  isVerified: true,
                ),
              ),

              SizedBox(height: 20,),
// state gird 4 cards -----------------------------------------------------------


              Row(
                children: [


                  ProfileStatCard(
                    iconPath: 'assets/icons/order_icon.svg',
                    count: '12',
                    label: 'orders',
                  ),

                  const SizedBox(width: 5),

                  ProfileStatCard(
                    iconPath: 'assets/icons/heart_icon.svg',
                    count: '2',
                    label: 'Wishlist',
                  ),

                ],
              ),


              SizedBox(height: 5,),

              Row(
                children: [

                  ProfileStatCard(
                    iconPath: 'assets/icons/coupen_icon.svg',
                    count: '1',
                    label: 'Coupons',
                  ),


                  const SizedBox(width: 5),

                  ProfileStatCard(
                    iconPath: 'assets/icons/location_icon.svg',
                    count: '2',
                    label: 'Saved',
                  ),

                ],
              ),

              SizedBox(height: 20,),

//  Account setting portion -------------------------------------------------------

              Text(
                'Account Settings',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black, // Matches your brand blue
                  letterSpacing: 1.2,
                ),
              ),


              AccountSettingCards(
                title: "My Orders",
                iconPath: 'assets/icons/bag_icon.svg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderScreen(), // Replace OrderScreen with your screen's class name
                    ),
                  );
                },
              ),


              AccountSettingCards(
                title: "Payment Methods",
                iconPath: 'assets/icons/cardd_icon.svg',
                onTap: () {
                  // Navigate to Orders screen
                },
              ),

              AccountSettingCards(
                title: "Notifications",
                iconPath: 'assets/icons/bel_icon.svg',
                onTap: () {
                  // Navigate to Orders screen
                },
              ),


              AccountSettingCards(
                title: "Customer Support",
                iconPath: 'assets/icons/support_icon.svg',
                onTap: () {
                  // Navigate to Orders screen
                },
              ),


              AccountSettingCards(
                title: "Settings",
                iconPath: 'assets/icons/setting_icon.svg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingScreen(),
                    ),
                  );
                },
              ),

              SizedBox(height: 5,),

// RECENTLY VIEWED ---------------------------------------------------------------

              RecentViewedHeader(
                title: "Recently Viewed",
                onClearPressed: () {

                },
              ),


              SizedBox(
                height: 270, //
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),

                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  itemCount: mockProducts.length,
                  itemBuilder: (context, index) {
                    final product = mockProducts[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 14.0),
                      child: RecentlyViewedProductCard(
                        product: product,
                        onTap: () {
                          print("Tapped on ${product.title}");
                        },
                      ),
                    );
                  },
                ),
              ),




              SizedBox(height: 12),

            ],
          ),

        ),
      ),
    );
  }
}
