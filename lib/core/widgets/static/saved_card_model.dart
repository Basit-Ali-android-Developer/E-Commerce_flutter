
import 'dart:ui';

class SavedCardModel {
  final String lastFourDigits;
  final String holderName;
  final String expiryDate;
  final Color backgroundColor;

  SavedCardModel({
    required this.lastFourDigits,
    required this.holderName,
    required this.expiryDate,
    required this.backgroundColor,
  });
}

// Hardcoded static list matching the image colors
final List<SavedCardModel> mockSavedCards = [
  SavedCardModel(
    lastFourDigits: "4242",
    holderName: "ALEXANDER LUXE",
    expiryDate: "12/26",
    backgroundColor: const Color(0xFF22252A), // Dark elegant dark grey/black
  ),
  SavedCardModel(
    lastFourDigits: "8841",
    holderName: "ALEXANDER LUXE",
    expiryDate: "08/29",
    backgroundColor: const Color(0xFF4C67A1), // Soft steel blue
  ),
];