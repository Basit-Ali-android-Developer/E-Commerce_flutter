import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:ecommerce/screens/cart/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
                      fontSize: 26,
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
                      size: 28,
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


              Card(
                elevation: 2,
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    // 1. ADD THIS LINE TO ALIGN EVERYTHING TO THE LEFT
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/location_icon.svg',
                                width: 20,
                                height: 20,
                                colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                              ),
                              const SizedBox(width: 15),
                              const Text(
                                "Deliver to",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.black),
                              ),
                            ],
                          ),


                          const Text(
                            "Change",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: AppColors.primary),
                          ),
                        ],
                      ),


                      const SizedBox(height: 10),


                      const Text(
                        "Alexander Luxe",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: AppColors.black),
                      ),

                      const SizedBox(height: 5),


                      const Text(
                        "728 Luxury Avenue, Penthouse B, Manhattan, NY 10001",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: AppColors.grey),
                      ),


                    ],
                  ),
                ),
              ),


              const SizedBox(height: 20),


              const Text(
                "Your Items",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.black),
              ),


              const SizedBox(height: 20),


              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];

                  // WRAP YOUR CARD HERE WITH PADDING
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0), // Adjust spacing here
                    child: CartItemCard(
                      title: item.title,
                      imagePath: item.image,
                      stockStatus: item.stockStatus,
                      stockColor: item.stockColor,
                      deliveryInfo: item.delivery,
                      price: item.price,
                      originalPrice: item.originalPrice,
                      discount: item.discount,
                      quantity: item.qty,
                      isChecked: item.selected,
                      onCheckedCallback: (val) {
                        // setState(() => item.selected = val ?? false);
                      },
                      // onDeleteCallback: () {
                      //   setState(() => _items.removeAt(index));
                      // },
                      // onIncrement: () {
                      //   setState(() => item.qty++);
                      // },
                      // onDecrement: () {
                      //   if (item.qty > 1) {
                      //     setState(() => item.qty--);
                      //   }
                      // },
                    ),
                  );
                },
              ),



              Card(
                elevation: 4,
                shadowColor: Colors.black.withOpacity(0.2),
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Row(
                    children: [
                      const Text(
                        "Promo Code:",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter code...",
                            border: UnderlineInputBorder(),
                            isDense: true,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Apply", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // C. ORDER SUMMARY CONTAINER
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Order Summary",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),


                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Items Count",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.grey),
                        ),
                        Text(
                          "3",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.black),
                        ),
                      ],
                    ),


                    const SizedBox(height: 16),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Subtotal",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.grey),
                        ),
                        Text(
                          "2,069.00",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.black),
                        ),
                      ],
                    ),


                    const SizedBox(height: 16),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Discount",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.success),
                        ),
                        Text(
                          "- 120.00",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.success),
                        ),
                      ],
                    ),


                    const SizedBox(height: 16),



                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Shipping",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.grey),
                        ),
                        Text(
                          "Free",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.black),
                        ),
                      ],
                    ),




                    Divider(color: Colors.grey[200], thickness: 1),

                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          "1,949.00",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.blue[800]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "TOTAL PRICE",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "1,949.00",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[800]),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "(3 Items)",
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  )
                ],
              ),


              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 2,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Proceed to Checkout", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),

                    SizedBox(width: 8),

                    Icon(Icons.arrow_forward, size: 20, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),






            ],
          ),

        ),
      ),
    );
  }
}


class CartItem {
  String title;
  String image;
  String stockStatus;
  Color stockColor;
  String delivery;
  double price;
  double originalPrice;
  int discount;
  int qty;
  bool selected;

  CartItem({
    required this.title, required this.image, required this.stockStatus,
    required this.stockColor, required this.delivery, required this.price,
    required this.originalPrice, required this.discount, this.qty = 1, this.selected = true,
  });
}



final List<CartItem> _items = [
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
