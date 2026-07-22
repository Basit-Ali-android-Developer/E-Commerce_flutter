import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:ecommerce/core/constants/category_item.dart';
import 'package:ecommerce/core/constants/product.dart';
import 'package:ecommerce/core/widgets/category_card.dart';
import 'package:ecommerce/core/widgets/custom_search_bar.dart';
import 'package:ecommerce/core/widgets/product_card.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final String? initialCategory; // Optional initial category string

  const CategoryScreen({
    super.key,
    this.initialCategory,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String? _selectedCategory;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Set initial category passed from HomeScreen (if any)
    _selectedCategory = widget.initialCategory;
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = mockProducts.where((product) {
      final matchesCategory = _selectedCategory == null ||
          _selectedCategory == 'all' ||
          product.category.toLowerCase() == _selectedCategory!.toLowerCase();

      final matchesSearch = _searchQuery.isEmpty ||
          product.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          product.brand.toLowerCase().contains(_searchQuery.toLowerCase());

      return matchesCategory && matchesSearch;
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'E-Commerce',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- SEARCH BAR ---
            CustomSearchBar(
              hintText: 'Search products...',
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
            ),

            const SizedBox(height: 20),

            // --- CATEGORIES LIST ---
            SizedBox(
              height: 98,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: mockCategories.length,
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final category = mockCategories[index];
                  final isSelected = _selectedCategory?.toLowerCase() ==
                      category.title.toLowerCase();

                  return CategoryCard(
                    title: category.title,
                    iconPath: category.iconPath,
                    backgroundColor: category.backgroundColor,
                    iconColor: category.iconColor,
                    isSelected: isSelected,
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selectedCategory = null; // Unselect to show all
                        } else {
                          _selectedCategory = category.title;
                        }
                      });
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // --- PRODUCT COUNT HEADER ---
            Text(
              "${filteredProducts.length} Products Found",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 16),

            // --- PRODUCT GRID ---
            filteredProducts.isEmpty
                ? const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Text(
                  "No products found",
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.grey,
                  ),
                ),
              ),
            )
                : GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.65,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return ProductCard(
                  product: product,
                  width: null,
                  onTap: () {},
                );
              },
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}