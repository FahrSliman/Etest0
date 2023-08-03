import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../app/myapp_controller.dart';
import '../../ui/shared/colors.dart';
import '../../ui/shared/custom_widget/custom_toast.dart';
import '../../ui/shared/utils.dart';
import '../data/repositories/shared_preferences_repositories.dart';
import '../enum/connectivity_status.dart';
import '../enum/message_type.dart';
import '../services/connectivity_service.dart';
import '../services/location_service.dart';
import '../services/notification_service.dart';

void customLoader() => BotToast.showCustomLoading(toastBuilder: (builder) {
      return Container(
        width: screenWidth(5),
        height: screenWidth(5),
        decoration: BoxDecoration(
            color: AppColors.mainWhiteColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15)),
        child: SpinKitCircle(color: AppColors.mainOrangeColor),
      );
    });

void checkConnection(Function function) {
  if (isOnline)
    function();
  else
    CustomToast.showMessage(
        meassage: 'Please check internet connection',
        messageType: MessageType.WARNING);
}

SharedPreferencesRepositories get storage =>
    Get.find<SharedPreferencesRepositories>();

// CartService get cartService => Get.find<CartService>();
LocationService get locationService => Get.find<LocationService>();
ConnectivityService get connectivityService => Get.find<ConnectivityService>();
NotificationService get notificationService => Get.find<NotificationService>();

bool get isOnline =>
    Get.find<MyAppController>().connectionStatus == ConnectivityStatus.ONLINE;
