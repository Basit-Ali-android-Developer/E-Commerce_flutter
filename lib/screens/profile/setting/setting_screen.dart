import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:ecommerce/core/constants/product.dart';
import 'package:ecommerce/core/widgets/product_card.dart';
import 'package:ecommerce/screens/home/widgets/section_header.dart';
import 'package:ecommerce/screens/profile/order/widgets/order_card.dart';
import 'package:ecommerce/screens/profile/setting/widgets/account_setting_theme_card.dart';
import 'package:ecommerce/screens/profile/setting/widgets/logout_button.dart';
import 'package:ecommerce/screens/profile/widgets/account_setting_cards.dart';
import 'package:ecommerce/screens/profile/widgets/profile_header.dart';
import 'package:ecommerce/screens/profile/widgets/profile_stat_card.dart';
import 'package:ecommerce/screens/profile/widgets/recent_viewed_header.dart';
import 'package:ecommerce/screens/profile/widgets/recently_viewed_product_card.dart';
import 'package:ecommerce/screens/wishlist/widgets/wishlist_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  bool isDarkMode = false;

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
                    'Setting',
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

// profile details ---------------------------------------------------------------

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 1. Circular Profile Avatar with Floating Edit Icon
              SizedBox(
                width: 70,
                height: 70,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Avatar Image with White Border and Soft Shadow
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(2.0),
                      // White ring border
                      child: ClipOval(
                        child: Image.asset(
                          "assets/icons/order_icon.svg", // Pass local asset path (e.g. 'assets/images/user.png')
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: Colors.grey[200],
                            child: const Icon(
                              Icons.person,
                              size: 35,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Edit Badge Button (Bottom Right Overlay)
                    Positioned(
                      bottom: 2,
                      right: 2,
                      child: GestureDetector(
                        //onTap: Onpress,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 14),

              // 2. User Name and Email Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Basit Ali",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "ali.s@luxe.design",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF7C828A),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

              SizedBox(height: 40,),



//  Account setting portion -------------------------------------------------------

              Text(
                'Account Settings',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black, // Matches your brand blue
                  letterSpacing: 1.2,
                ),
              ),


              AccountSettingCards(
                title: "Edit Profile",
                iconPath: 'assets/icons/person_icon.svg',
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const OrderScreen(), // Replace OrderScreen with your screen's class name
                  //   ),
                  // );
                },
              ),


              AccountSettingCards(
                title: "Change Password",
                iconPath: 'assets/icons/password_icon.svg',
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const OrderScreen(), // Replace OrderScreen with your screen's class name
                  //   ),
                  // );
                },
              ),


              AccountSettingCards(
                title: "Language",
                iconPath: 'assets/icons/language_icon.svg',
                description: "English",
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const OrderScreen(), // Replace OrderScreen with your screen's class name
                  //   ),
                  // );
                },
              ),





              AccountSettingCards(
                title: "Currency",
                iconPath: 'assets/icons/cash_icon.svg',
                description: "Pkr",
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const OrderScreen(), // Replace OrderScreen with your screen's class name
                  //   ),
                  // );
                },
              ),


              SizedBox(height: 20,),

              Text(
                'PREFERENCES',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black, // Matches your brand blue
                  letterSpacing: 1.2,
                ),
              ),


              // AccountSettingCards(
              //   title: "Theme",
              //   iconPath: 'assets/icons/theme_icon.svg',
              //   onTap: () {
              //     // Navigator.push(
              //     //   context,
              //     //   MaterialPageRoute(
              //     //     builder: (context) => const OrderScreen(), // Replace OrderScreen with your screen's class name
              //     //   ),
              //     // );
              //   },
              // ),

              AccountSettingThemeCard(
                title: "Theme",
                description: isDarkMode ? "Dark Mode" : "Light Mode",
                iconPath: "assets/icons/theme_icon.svg",
                value: isDarkMode,
                onChanged: (bool newValue) {
                  setState(() {
                    isDarkMode = newValue;
                  });
                },
              ),




              SizedBox(height: 20,),

              Text(
                'SUPPORT',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black, // Matches your brand blue
                  letterSpacing: 1.2,
                ),
              ),


              AccountSettingCards(
                title: "About Us",
                iconPath: 'assets/icons/infoo_icon.svg',
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const OrderScreen(), // Replace OrderScreen with your screen's class name
                  //   ),
                  // );
                },
              ),

              AccountSettingCards(
                title: "Help Center",
                iconPath: 'assets/icons/questionmark_icon.svg',
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const OrderScreen(), // Replace OrderScreen with your screen's class name
                  //   ),
                  // );
                },
              ),


              SizedBox(height: 40,),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    // 1. Logout Button Widget
                    LogoutButton(
                      onTap: () {
                        // Add your Logout logic / Dialog trigger here
                      },
                    ),

                    const SizedBox(height: 16),

                    // 2. App Version Info Text
                    const Text(
                      'E-Commerce App Version 1.0.0',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey, // Soft grey text
                        letterSpacing: -0.2,
                      ),
                    ),
                  ],
                ),
              )


            ],
          ),

        ),
      ),
    );
  }
}
