








import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:get/get.dart';

void showSnackbar(String message,
    {Function? onDissmissed, bool isError = true}) {
      if(!Get.isSnackbarOpen) {
        Get.showSnackbar(
    GetSnackBar(
      titleText: Text(
        isError ? "An error occurred".tr : "Successfully completed".tr,
        style: TextStyle(color: isError ? Colors.red : Colors.green),
      ),
      messageText: Text(message),
      dismissDirection: DismissDirection.up,
      isDismissible: true,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.WHITE,
      borderRadius: 8,
      boxShadows: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      duration: const Duration(milliseconds: 1000),
      icon: Icon(
        isError ? Icons.error : Icons.check_circle_rounded,
        color: isError ? Colors.red : Colors.green,
      ),
      snackbarStatus: (status) {
        Get.log("snackbar status is $status");
        if (status == SnackbarStatus.CLOSED) {
          if (onDissmissed != null) onDissmissed();
        }
      },
    ),
  );
      }
}

void showBottomSheetDialog(Widget child,
    {bool isdismissible = true, bool enableDrug = true,bool isScrollControlled = false,}) {
  Get.bottomSheet(
    Column(
      children: [
        const SizedBox(height: 16,),
        Container(
          width: 32,
          height: 2,
          decoration: BoxDecoration(
            color: AppColors.GRAY_X11,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 16,),
        Expanded(child: child),
      ],
    ),
    isDismissible: isdismissible,
    backgroundColor: AppColors.WHITE,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25),
      ),
    ),
    isScrollControlled: isScrollControlled,
    enableDrag: enableDrug,
  );
}


