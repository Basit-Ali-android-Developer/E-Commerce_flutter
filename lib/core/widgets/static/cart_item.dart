// lib/data/models/cart_item_model.dart
import 'package:flutter/material.dart';

class CartItem {
  final String title;
  final String image;
  final String stockStatus;
  final Color stockColor;
  final String delivery;
  final double price;
  final double originalPrice;
  final int discount;
  int qty;
  bool selected;

  CartItem({
    required this.title,
    required this.image,
    required this.stockStatus,
    required this.stockColor,
    required this.delivery,
    required this.price,
    required this.originalPrice,
    required this.discount,
    this.qty = 1,
    this.selected = true,
  });
}