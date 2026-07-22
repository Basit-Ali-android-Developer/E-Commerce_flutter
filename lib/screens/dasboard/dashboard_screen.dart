import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/screens/home/home_Screen.dart';
import 'package:ecommerce/screens/profile/profile_screen.dart';
import 'package:ecommerce/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatefulWidget {
  final int initialIndex;

  const DashboardScreen({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  final List<Widget> pages = const [
    HomeScreen(),
   // CategoryScreen(),
    WishlistScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  Widget _buildNavItem({
    required String iconPath,
    required String label,
    required bool isActive,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        SvgPicture.asset(
          iconPath,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            isActive ? AppColors.primary : Colors.grey,
            BlendMode.srcIn,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            color: isActive ? AppColors.primary : Colors.grey,
          ),
        ),

        const SizedBox(height: 4),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: selectedIndex == 0, // Allow pop/exit only if on Home tab
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        // If not on Home tab, switch back to Home (index 0)
        if (selectedIndex != 0) {
          setState(() {
            selectedIndex = 0;
          });
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: IndexedStack(
          index: selectedIndex,
          children: pages,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 20,
                spreadRadius: 1,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: _buildNavItem(
                  iconPath: 'assets/icons/home_icon.svg',
                  label: "Home",
                  isActive: selectedIndex == 0,
                ),
                label: "Home",
              ),
              // BottomNavigationBarItem(
              //   icon: _buildNavItem(
              //     iconPath: 'assets/icons/catagory_icon.svg',
              //     label: "Categories",
              //     isActive: selectedIndex == 1,
              //   ),
              //   label: "Categories",
              // ),
              BottomNavigationBarItem(
                icon: _buildNavItem(
                  iconPath: 'assets/icons/heart_icon.svg',
                  label: "Wishlist",
                  isActive: selectedIndex == 1,
                ),
                label: "Wishlist",
              ),
              BottomNavigationBarItem(
                icon: _buildNavItem(
                  iconPath: 'assets/icons/cart_icon.svg',
                  label: "Cart",
                  isActive: selectedIndex == 2,
                ),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: _buildNavItem(
                  iconPath: 'assets/icons/person_icon.svg',
                  label: "Profile",
                  isActive: selectedIndex == 3,
                ),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}