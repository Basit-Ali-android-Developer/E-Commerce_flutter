// lib/data/repositories/mock_cart_data.dart
import 'package:ecommerce/core/widgets/static/cart_item.dart';
import 'package:flutter/material.dart';

class MockCartData {
  static final List<CartItem> items = [
    CartItem(
        title: "Aura Pro Series 7",
        image: "https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=500",
        stockStatus: "IN STOCK",
        stockColor: Colors.green,
        delivery: "Delivery Tomorrow",
        price: 1299.00,
        originalPrice: 1499.00,
        discount: 13
    ),
    CartItem(
        title: "Cloud Walker V2",
        image: "https://images.unsplash.com/photo-1549298916-b41d501d3772?q=80&w=500",
        stockStatus: "ONLY 2 LEFT",
        stockColor: Colors.orange,
        delivery: "Delivery in 2 Days",
        price: 450.00,
        originalPrice: 600.00,
        discount: 25
    ),
    CartItem(
        title: "Classic Matte Black Sunglasses",
        image: "https://images.unsplash.com/photo-1511499767150-a48a237f0083?q=80&w=500",
        stockStatus: "IN STOCK",
        stockColor: Colors.green,
        delivery: "Delivery Tomorrow",
        price: 320.00,
        originalPrice: 380.00,
        discount: 15
    ),
  ];
}