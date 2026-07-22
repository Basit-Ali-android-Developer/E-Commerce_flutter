import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onTap;

  const LogoutButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: Material(
        color: const Color(0xFFFFE5E5), // Soft light red background
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          splashColor: const Color(0xFFFFCCCC),
          highlightColor: Colors.transparent,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.logout_rounded, // Matches the exit arrow icon
                color: Color(0xFFB30000), // Darker red accent
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                'Logout',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB30000), // Darker red accent
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}