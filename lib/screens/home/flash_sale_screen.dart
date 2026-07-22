import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:ecommerce/core/constants/product.dart';
import 'package:ecommerce/core/widgets/product_card.dart';
import 'package:flutter/material.dart';

class FlashSaleScreen extends StatefulWidget {
  const FlashSaleScreen({super.key});

  @override
  State<FlashSaleScreen> createState() => _FlashSaleScreenState();
}

class _FlashSaleScreenState extends State<FlashSaleScreen> {
  // Mock data for our active filter tags
  final List<String> activeFilters = [
    "Price: Low to High",
    "Brand: Aura",
    "Free Shipping",
    "Top Rated"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

// top bar -----------------------------------------------------------------------

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [

                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.arrow_back, color: Colors.black, size: 26),
                    onPressed: () => Navigator.pop(context),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [

                          const Icon(Icons.search, color: Colors.grey, size: 22),


                          const SizedBox(width: 8),


                           Text(
                            "Aura Tech",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),



//  filter row -------------------------------------------------------------------


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "1.2k results",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      _buildActionButton(Icons.sort, "Sort"),
                      const SizedBox(width: 8),
                      _buildActionButton(Icons.tune, "Filter"),
                    ],
                  ),
                ],
              ),
            ),


            const SizedBox(height: 12),

//  Horizontal Active Filters Sub-List -------------------------------------------


            SizedBox(
              height: 38,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: activeFilters.length,
                itemBuilder: (context, index) {
                  final filterText = activeFilters[index];
                  // Design first two chips blue, others light grey to match layout image
                  final isPrimaryColor = index < 2;

                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: isPrimaryColor ? AppColors.primary : const Color(0xFFEFEFEF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Text(
                          filterText,
                          style: TextStyle(
                            color: isPrimaryColor ? Colors.white : Colors.black87,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Icon(
                          Icons.close,
                          size: 14,
                          color: isPrimaryColor ? Colors.white : Colors.grey,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),


            const SizedBox(height: 16),

//  list of products in grid ----------------------------------------------------


            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [

                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.72,
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


                    const SizedBox(height: 24),

                    //  "Show More Results" Action Banner
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                      label: const Text(
                        "Show More Results",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        elevation: 0,
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Mini-helper to build Sort & Filter control pill buttons
  Widget _buildActionButton(IconData icon, String label) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 16, color: Colors.black87),
      label: Text(
        label,
        style: const TextStyle(color: Colors.black87, fontSize: 13, fontWeight: FontWeight.w600),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        side: const BorderSide(color: Color(0xFFEFEFEF)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: const Color(0xFFFAFAFA),
      ),
    );
  }
}