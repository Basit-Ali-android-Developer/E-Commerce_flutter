import 'package:flutter/material.dart';

class CoolThemeSwitch extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onChanged;

  const CoolThemeSwitch({
    super.key,
    required this.isDarkMode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isDarkMode),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 60,
        height: 32,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // Dark track in light mode, clean white track with dark border in dark mode
          color: isDarkMode ? Colors.black : const Color(0xFFF0F1F5),
          border: Border.all(
            color: isDarkMode ? Colors.white24 : const Color(0xFFE0E0E0),
            width: 1.5,
          ),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          alignment: isDarkMode ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // White thumb for Dark Mode, Deep Black thumb for Light Mode
              color: isDarkMode ? Colors.white : Colors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: RotationTransition(
                      turns: animation,
                      child: child,
                    ),
                  );
                },
                child: isDarkMode
                    ? const Icon(
                  Icons.nightlight_round,
                  key: ValueKey('moon'),
                  size: 14,
                  color: Colors.black, // Dark icon inside white thumb
                )
                    : const Icon(
                  Icons.wb_sunny_rounded,
                  key: ValueKey('sun'),
                  size: 14,
                  color: Colors.white, // White icon inside dark thumb
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}