import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:ecommerce/core/widgets/static/mock_cart_data.dart';
import 'package:ecommerce/screens/order_placement/payment_method_screen.dart';
import 'package:ecommerce/screens/order_placement/widgets/delivery_method_card.dart';
import 'package:ecommerce/screens/order_placement/widgets/item_card.dart';
import 'package:ecommerce/screens/order_placement/widgets/orderplacement_top_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce/screens/cart/widgets/cart_item_card.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int selectedMethodIndex = 0;

  final cartList = MockCartData.items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
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
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [

          const OrderplacementTopStatus(currentStep: 0),



          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [



                  Card(
                    elevation: 0,
                    color: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(
                        color: AppColors.border,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(

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
                    "Delivery Method",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.grey),
                  ),




                  const SizedBox(height: 12),

                  DeliveryMethodCard(
                    title: "Express Delivery",
                    duration: "Delivered within 1-2 business days",
                    price: "\$25.00",
                    isFastest: true,
                    isSelected: selectedMethodIndex == 0,
                    onTap: () {
                      setState(() {
                        selectedMethodIndex = 0;
                      });
                    },
                  ),


                  DeliveryMethodCard(
                    title: "Standard Shipping",
                    duration: "Delivered within 5-7 business days",
                    price: "Free",
                    isFastest: false,
                    isSelected: selectedMethodIndex == 1,
                    onTap: () {
                      setState(() {
                        selectedMethodIndex = 1;
                      });
                    },
                  ),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Order Summary",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.grey),
                      ),


                      Text(
                        "3 Items",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.black),
                      ),
                    ],
                  ),


                  const SizedBox(height: 12),

                  Card(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24), // Outer card curves matching your UI
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cartList.length,
                        itemBuilder: (context, index) {
                          final item = cartList[index];

                          return Column(
                            children: [
                              ItemCard(
                                title: item.title,
                                imagePath: item.image,
                                price: item.price,
                                quantity: item.qty,
                                // Pass variants if your model supports them, e.g.:
                                // variantColor: "Midnight Blue",
                                // variantSize: "OS",
                              ),
                              // Show a separator line between items, but not after the last item
                              if (index < cartList.length - 1)
                                Divider(color: Colors.grey[100], height: 24, thickness: 1),
                            ],
                          );
                        },
                      ),
                    ),
                  ),


                  const SizedBox(height: 20),



// promo code ------------------------------------------------------------------

                  const Text(
                    "Promo Code",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.grey),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [

                      Expanded(
                        child: Card(
                          elevation: 4,
                          shadowColor: Colors.black.withOpacity(0.2),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter code...",
                                border: InputBorder.none, // Usually looks cleaner inside a card container
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 10,),

                      ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black, // Change to your brand color (e.g., AppColors.primary)
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: const StadiumBorder(), // Gives it the perfect capsule shape
                        ),
                        child: const Text(
                          "Apply",
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 24),

//  ORDER SUMMARY --------------------------------------------------



                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
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
                            ],
                          )
                        ],
                      ),


                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PaymentMethod()),
                          );
                        },
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
                            Text("Continue to Payment", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),

                            SizedBox(width: 8),

                            Icon(Icons.arrow_forward, size: 20, color: Colors.white),
                          ],
                        ),
                      ),
                    ],
                  ),


                  const SizedBox(height: 20),




                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}