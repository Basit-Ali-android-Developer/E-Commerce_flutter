import 'package:flutter/material.dart';

class OrderplacementTopStatus extends StatelessWidget {
  final int currentStep; // 0: Shipping, 1: Payment, 2: Review

  const OrderplacementTopStatus({
    super.key,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    // Brand Colors based on the design image
    const Color activeColor = Color(0xFF0046D5);
    const Color inactiveTextColor = Color(0xFF9E9E9E);
    const Color inactiveStepColor = Color(0xFFC4C8D3);
    const Color lineCompletedColor = Color(0xFFD0D7FF);
    const Color lineUncompletedColor = Color(0xFFE0E0E0);

    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100), // Stadium shape
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Step 1: Shipping
          Expanded(
            child: _buildStepItem(
              title: 'Shipping',
              stepNumber: 1,
              isActive: currentStep >= 0,
              isCompleted: currentStep > 0,
              isCurrentPage: currentStep == 0,
              activeColor: activeColor,
              inactiveTextColor: inactiveTextColor,
              inactiveStepColor: inactiveStepColor,
            ),
          ),

          // Connecting Line 1
          _buildDivider(
            isCompleted: currentStep > 0,
            completedColor: lineCompletedColor,
            uncompletedColor: lineUncompletedColor,
          ),

          // Step 2: Payment
          Expanded(
            child: _buildStepItem(
              title: 'Payment',
              stepNumber: 2,
              isActive: currentStep >= 1,
              isCompleted: currentStep > 1,
              isCurrentPage: currentStep == 1,
              activeColor: activeColor,
              inactiveTextColor: inactiveTextColor,
              inactiveStepColor: inactiveStepColor,
            ),
          ),

          // Connecting Line 2
          _buildDivider(
            isCompleted: currentStep > 1,
            completedColor: lineCompletedColor,
            uncompletedColor: lineUncompletedColor,
          ),

          // Step 3: Review
          Expanded(
            child: _buildStepItem(
              title: 'Review',
              stepNumber: 3,
              isActive: currentStep >= 2,
              isCompleted: currentStep > 2,
              isCurrentPage: currentStep == 2,
              activeColor: activeColor,
              inactiveTextColor: inactiveTextColor,
              inactiveStepColor: inactiveStepColor,
            ),
          ),
        ],
      ),
    );
  }

  // Individual step item design generator
  Widget _buildStepItem({
    required String title,
    required int stepNumber,
    required bool isActive,
    required bool isCompleted,
    required bool isCurrentPage,
    required Color activeColor,
    required Color inactiveTextColor,
    required Color inactiveStepColor,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Inner Circle Icon or Number
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted ? activeColor : Colors.transparent,
            border: Border.all(
              color: isCompleted
                  ? activeColor
                  : (isActive ? activeColor : inactiveStepColor),
              width: 2,
            ),
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, color: Colors.white, size: 14)
                : Text(
              '$stepNumber',
              style: TextStyle(
                color: isActive ? activeColor : inactiveTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        // Title text label
        Text(
          title,
          style: TextStyle(
            color: isActive ? activeColor : inactiveTextColor,
            fontSize: 12,
            fontWeight: isCurrentPage ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        const SizedBox(height: 4),
        // Selected Bottom Dot indicator matching screen image
        // AnimatedOpacity(
        //   duration: const Duration(milliseconds: 200),
        //   opacity: isCurrentPage ? 1.0 : 0.0,
        //   child: Container(
        //     width: 4,
        //     height: 4,
        //     decoration: BoxDecoration(
        //       color: activeColor,
        //       shape: BoxShape.circle,
        //     ),
        //   ),
        // ),
      ],
    );
  }

  // Progress line divider design
  Widget _buildDivider({
    required bool isCompleted,
    required Color completedColor,
    required Color uncompletedColor,
  }) {
    return Container(
      width: 45, // Tailored horizontal spacing matching image mockup
      height: 1.5,
      color: isCompleted ? completedColor : uncompletedColor,
      margin: const EdgeInsets.only(bottom: 22), // Centers alignment perfectly alongside circles
    );
  }
}