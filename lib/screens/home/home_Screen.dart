import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:ecommerce/core/widgets/product_card.dart';
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



            SectionHeader(
              title: "Flash Sale",
              onViewAllPressed: () {
                // Navigate to the full flash sale screen
              },
            ),


            SizedBox(
              height: 360, //
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




            SizedBox(height: 12),

            // 4. Recommended for You Section Header
            // SectionHeader(
            //   title: "Recommended for You",
            //   onViewAllPressed: () {},
            // ),

            // Left Side: Icon & Title
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
                  childAspectRatio: 0.48,
                ),
                itemCount: mockProducts.length,
                itemBuilder: (context, index) {
                  final product = mockProducts[index];
                  return ProductCard(
                    product: product,
                    width: null,
                    onTap: () {},
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



