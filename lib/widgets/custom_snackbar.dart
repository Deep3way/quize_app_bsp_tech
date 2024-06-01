import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  void errorSnackBar(String? error) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        "Error Occurred!", // Snackbar title
        error ?? 'Unexpected error occurred', // Snackbar message
        backgroundColor: Colors.red,
        // Background color
        colorText: Colors.white,
        // Text color
        icon: const Icon(Icons.error),
        // Icon
        shouldIconPulse: true,
        // Icon pulse animation
        duration: const Duration(seconds: 3),
        // Duration
        borderRadius: 10,
        // Snackbar border radius
        snackPosition: SnackPosition.BOTTOM,
        // Snackbar position
        margin: const EdgeInsets.all(10),
        // Margin
        isDismissible: true,
        // Dismissible on tap
        dismissDirection: DismissDirection.down,
        // Dismiss direction
        forwardAnimationCurve: Curves.easeOut,
        // Forward animation curve
        reverseAnimationCurve: Curves.easeIn, // Reverse animation curve
      );
    }
  }

  void successSnackBar(String? message) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        "Success", // Snackbar title
        message ?? 'Done', // Snackbar message
        backgroundColor: Colors.green,
        // Background color
        colorText: Colors.white,
        // Text color
        icon: const Icon(
          Icons.check_circle_outline,
          color: Colors.white,
        ),
        // Icon
        shouldIconPulse: true,
        // Icon pulse animation
        duration: const Duration(seconds: 3),
        // Duration
        borderRadius: 10,
        // Snackbar border radius
        snackPosition: SnackPosition.BOTTOM,
        // Snackbar position
        margin: const EdgeInsets.all(10),
        // Margin
        isDismissible: true,
        // Dismissible on tap
        dismissDirection: DismissDirection.down,
        // Dismiss direction
        forwardAnimationCurve: Curves.easeOut,
        // Forward animation curve
        reverseAnimationCurve: Curves.easeIn, // Reverse animation curve
      );
    }
  }
}
