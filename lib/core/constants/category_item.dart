import 'package:flutter/material.dart';

class CategoryItem {
  final String title;
  final String iconPath;
  final Color backgroundColor;
  final Color iconColor;

  CategoryItem({
    required this.title,
    required this.iconPath,
    required this.backgroundColor,
    required this.iconColor,
  });
}

// Sample categories matching your design
final List<CategoryItem> mockCategories = [
  CategoryItem(
    title: 'Electronics',
    iconPath: 'assets/icons/electronic_catagory_icon.svg',
    backgroundColor: const Color(0xFFE4EBFA), // Soft blue
    iconColor: const Color(0xFF1E52E8),
  ),
  CategoryItem(
    title: 'Fashion',
    iconPath: 'assets/icons/fashion_catagory_icon.svg',
    backgroundColor: const Color(0xFFF7EFE5), // Soft beige
    iconColor: const Color(0xFFB86A1D),
  ),
  CategoryItem(
    title: 'Beauty',
    iconPath: 'assets/icons/beauty_catagory_icon.svg',
    backgroundColor: const Color(0xFFE4EBFA), // Soft blue
    iconColor: const Color(0xFF1E52E8),
  ),
  CategoryItem(
    title: 'Shoes',
    iconPath: 'assets/icons/shows_catagory_icon.svg',
    backgroundColor: const Color(0xFFF7EFE5), // Soft beige
    iconColor: const Color(0xFFB86A1D),
  ),
  CategoryItem(
    title: 'Music',
    iconPath: 'assets/icons/music_catagory_icon.svg',
    backgroundColor: const Color(0xFFE4EBFA), // Soft blue
    iconColor: const Color(0xFF1E52E8),
  ),
];