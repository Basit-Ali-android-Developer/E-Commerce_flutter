import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:ecommerce/core/widgets/custom_icon_button.dart';
import 'package:ecommerce/core/widgets/static/mock_cart_data.dart';
import 'package:ecommerce/core/widgets/static/saved_card_model.dart';
import 'package:ecommerce/screens/dasboard/dashboard_screen.dart';
import 'package:ecommerce/screens/order_placement/payment_method_screen.dart';
import 'package:ecommerce/screens/order_placement/widgets/credit_card_widget.dart';
import 'package:ecommerce/screens/order_placement/widgets/delivery_method_card.dart';
import 'package:ecommerce/screens/order_placement/widgets/item_card.dart';
import 'package:ecommerce/screens/order_placement/widgets/orderplacement_top_status.dart';
import 'package:ecommerce/screens/order_placement/widgets/payment_method_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce/screens/cart/widgets/cart_item_card.dart';

class OrderConfirmedScreen extends StatelessWidget {
   OrderConfirmedScreen({super.key});


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

          const OrderplacementTopStatus(currentStep: 2),



          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  SizedBox(height: 20,),
// MESSAGE -----------------------------------------------------------------------

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Text(
                      "Order Placed Successfully",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primary),
                    ),

                    Text(
                      "Thank you for choosing E-Commerce. Your premium selection is being prepared.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.grey),
                    ),


                  ],
                ),
              ),



                  SizedBox(height: 20,),

// ORDER DETAIL -------------------------------------------------------------------

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
                                "Order Number",
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: AppColors.grey),
                              ),


                              const Text(
                                "Payment Status",
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: AppColors.grey),
                              ),

                            ],
                          ),

                          const SizedBox(height: 5),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "#LX-889021-Z",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.black),
                              ),

                              SizedBox(width: 5,),

                              const Text(
                                "Paid",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.black),
                              ),
                            ],
                          ),



                        ],
                      ),
                    ),
                  ),


                  const SizedBox(height: 5),


// DELIVERY EXPECTATION -----------------------------------------------------------


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
                            children: [

                        SvgPicture.asset(
                        'assets/icons/van_icon.svg',
                        width: 15,
                        height: 15,
                        colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                         ),


                              SizedBox(width: 5,),

                              const Text(
                                "Delivery Expectation",
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: AppColors.primary),
                              ),

                            ],
                          ),

                          const SizedBox(height: 5),


                          Text(
                            "Thursday, Oct 24th",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.grey),
                          ),


                          Text(
                            "Estimated delivery window: 9 AM - 5 PM",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.grey),
                          ),


                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 5),


// item and total grid ------------------------------------------------------------

                  Row(
                    children: [
                      // --- First Card ---
                      Expanded(
                        child: Card(
                          elevation: 0,
                          color: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(
                              color: AppColors.border,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/box_icon.svg',
                                  width: 15,
                                  height: 15,
                                  colorFilter: const ColorFilter.mode(AppColors.brown1, BlendMode.srcIn),
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  "Items",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.grey),
                                ),

                                Text(
                                  "3 Premium",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 5),

                      // --- Second Card ---
                      Expanded(
                        child: Card(
                          elevation: 0,
                          color: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(
                              color: AppColors.border,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/slip_icon.svg',
                                  width: 15,
                                  height: 15,
                                  colorFilter: const ColorFilter.mode(AppColors.black1, BlendMode.srcIn),
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  "Total Amount",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.grey),
                                ),
                                Text(
                                  "1,248.00",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),


                  const SizedBox(height: 60),




                  CustomIconButton(
                    text: "Track Order",
                   // icon: Icons.lock_outline,
                    onPressed: () {

                    },
                  ),

                  const SizedBox(height: 10),

                  CustomIconButton(
                    text: "Continue Shopping",
                   // icon: Icons.lock_outline,
                      backgroundColor: AppColors.white,
                      textColor: AppColors.primary,
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) =>  DashboardScreen(initialIndex: 3), // Pass Cart tab index
                        ),
                            (route) => false, // Removes all routes behind it
                      );
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