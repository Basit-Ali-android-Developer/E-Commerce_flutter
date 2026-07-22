import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:ecommerce/core/constants/category_item.dart';
import 'package:ecommerce/core/widgets/category_card.dart';
import 'package:ecommerce/core/widgets/product_card.dart';
import 'package:ecommerce/screens/catagory/category_screen.dart';
import 'package:ecommerce/screens/home/flash_sale_screen.dart';
import 'package:ecommerce/screens/home/widgets/custom_header_appbar.dart';
import 'package:ecommerce/screens/home/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/constants/product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            CustomHeaderAppBar(
              onMenuPressed: () {
                // Handle drawer menu tap
              },
              onNotificationPressed: () {
                // Handle notification bell tap
              },
              onSearchChanged: (value) {
                print("Searching for: $value");
              },
              onVoiceSearchPressed: () {
                // Trigger speech to text
              },
              onCameraSearchPressed: () {
                // Trigger camera search features
              },
            ),


// category portion -------------------------------------------------------------

            SectionHeader(
              title: "Categories",
              icon: Icons.category_outlined,
              onViewAllPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CategoryScreen(), // Shows all items
                  ),
                );
              },
            ),


            SizedBox(
              height: 92,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                scrollDirection: Axis.horizontal,
                itemCount: mockCategories.length,
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final category = mockCategories[index];
                  return CategoryCard(
                    title: category.title,
                    iconPath: category.iconPath,
                    backgroundColor: category.backgroundColor,
                    iconColor: category.iconColor,
                    onTap: () {
                      // Open CategoryScreen with the tapped category pre-selected
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryScreen(
                            initialCategory: category.title,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),


            SizedBox(height: 12),

// FLASH SALE -------------------------------------------------------------------

            SectionHeader(
              title: "Flash Sale",
              icon: Icons.bolt,
              onViewAllPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FlashSaleScreen(
                      // projectId: project["id"] as int,
                      // projectName: project["title"] as String,
                    ),
                  ),
                );
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
                    child: ProductCard(
                      product: product,
                      onTap: () {
                        print("Tapped on ${product.title}");
                      },
                    ),
                  );
                },
              ),
            ),


// recommended item list ---------------------------------------------------------

            SizedBox(height: 12),


            Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Recommended for You",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
              ],
            ),
        ),

            const SizedBox(height: 20),


            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.65,
              ),
              itemCount: mockProducts.length,
              itemBuilder: (context, index) {
                final product = mockProducts[index];
                return ProductCard(
                  product: product,
                  onTap: () {},
                );
              },
            ),



            const SizedBox(height: 24),




          ],
        ),

        ),
      ),
    );
  }
}



