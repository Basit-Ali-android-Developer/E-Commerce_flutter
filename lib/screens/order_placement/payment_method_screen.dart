import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:ecommerce/core/widgets/custom_icon_button.dart';
import 'package:ecommerce/core/widgets/static/mock_cart_data.dart';
import 'package:ecommerce/core/widgets/static/saved_card_model.dart';
import 'package:ecommerce/screens/order_placement/payment_method_screen.dart';
import 'package:ecommerce/screens/order_placement/widgets/credit_card_widget.dart';
import 'package:ecommerce/screens/order_placement/widgets/delivery_method_card.dart';
import 'package:ecommerce/screens/order_placement/widgets/item_card.dart';
import 'package:ecommerce/screens/order_placement/widgets/orderplacement_top_status.dart';
import 'package:ecommerce/screens/order_placement/widgets/payment_method_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce/screens/cart/widgets/cart_item_card.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethod();
}

class _PaymentMethod extends State<PaymentMethod> {
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

          const OrderplacementTopStatus(currentStep: 1),



          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

// ORDER TOTAL -------------------------------------------------------------------

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

                              const Text(
                                "Order Total",
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: AppColors.grey),
                              ),


                              const Text(
                                "2,450.00",
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.black),
                              ),
                            ],
                          ),

                          const SizedBox(height: 5),

                          Row(
                            children: [
                              Icon(
                                  Icons.lock,
                                size: 15,
                                color: AppColors.grey,
                              ),

                              SizedBox(width: 5,),

                              const Text(
                                "Encrypted checkout",
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: AppColors.grey),
                              ),
                            ],
                          ),



                        ],
                      ),
                    ),
                  ),


                  const SizedBox(height: 20),

//  SAVED CARDS -------------------------------------------------------------------

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Saved Cards",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.grey),
                      ),

                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Manage",
                          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),


                  const SizedBox(height: 12),

              // SCROLL OF CARDDS -----------------------------------------------

                  SizedBox(
                    height: 180, // Explicit height container constraint required for horizontal listviews
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: mockSavedCards.length,
                      itemBuilder: (context, index) {
                        final card = mockSavedCards[index];
                        return CreditCardWidget(card: card);
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

              // ADD NEW CARD ---------------------------------------------------

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5), // Light background tint
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 1,
                          style: BorderStyle.solid, // Note: For a pure dashed look, use custom_painter or dotted_border package
                        ),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 18,
                            child: const Icon(Icons.add, color:AppColors.primary, size: 20),
                          ),
                          const SizedBox(width: 16),
                          const Expanded(
                            child: Text(
                              "Add New Card",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[600]),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),

                  const Text(
                    "Other Methods",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.grey),
                  ),

                  SizedBox(height: 20,),


                  PaymentMethodCard(
                    title: "Apple Pay",
                    subtitle: "Fast and Secure",
                    svgPath: "assets/icons/apple_icon.svg", // Path to your local SVG asset
                    isSelected: true, // Toggle selection state dynamics here
                    onTap: () {
                      // Handle tap state management logic
                    },
                  ),


                  PaymentMethodCard(
                    title: "Google Pay",
                    subtitle: "One-tap payment",
                    svgPath: "assets/icons/google_icon.svg", // Path to your local SVG asset
                    isSelected: false, // Toggle selection state dynamics here
                    onTap: () {
                      // Handle tap state management logic
                    },
                  ),

                  PaymentMethodCard(
                    title: "Bank Transfer",
                    subtitle: "Direct wire transfer",
                    svgPath: "assets/icons/bank_icon.svg", // Path to your local SVG asset
                    isSelected: false, // Toggle selection state dynamics here
                    onTap: () {
                      // Handle tap state management logic
                    },
                  ),

                  PaymentMethodCard(
                    title: "Cash on Delivery",
                    subtitle: "Pay when received",
                    svgPath: "assets/icons/cash_icon.svg", // Path to your local SVG asset
                    isSelected: false, // Toggle selection state dynamics here
                    onTap: () {
                      // Handle tap state management logic
                    },
                  ),


                  const SizedBox(height: 60),


                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              const Text(
                                "Total Payment",
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: AppColors.grey),
                              ),

                              Column(
                                children: [
                                  const Text(
                                    "2,450.00",
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.primary),
                                  ),

                                  const Text(
                                    "Including taxes & fees",
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: AppColors.grey),
                                  ),
                                ],
                              ),


                            ],
                          ),
                        ],
                      ),
                    ),





                  CustomIconButton(
                    text: "Pay Now",
                    icon: Icons.lock_outline,
                    onPressed: () {

                    },
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