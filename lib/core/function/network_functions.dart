//Check Network Connection Function
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';

import '../../generated/locale_keys.g.dart';
import '../argument/check_connection_arg.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../resource/constant_manager.dart';

Future<CheckConnectionArgs> isThereConnection() async {
  ConnectivityResult connectivityResult =
      await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    final result =
        await InternetAddress.lookup(AppConstantManager.appConnectionTest);
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return CheckConnectionArgs(isConnected: true, message: 'Connected');
    } else {
      return CheckConnectionArgs(
          isConnected: false,
          message:
              '${LocaleKeys.pleaseCheckYourInternetConnection.tr()} ${LocaleKeys.mobileData.tr()}');
    }
  } else if (connectivityResult == ConnectivityResult.wifi) {
    final result =
        await InternetAddress.lookup(AppConstantManager.appConnectionTest);
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return CheckConnectionArgs(isConnected: true, message: 'Connected');
    } else {
      return CheckConnectionArgs(
          isConnected: false,
          message:
              '${LocaleKeys.pleaseCheckYourInternetConnection.tr()} ${LocaleKeys.wifi.tr()}');
    }
  } else {
    return CheckConnectionArgs(
        //!Make isConnected Filed False Value When Make Relase Version
        //Because While Debugging In S/Emulator The Internet Connection Blocked
        isConnected: true,
        message: LocaleKeys.pleaseTurnOnWifiOrMobileData.tr());
  }
}
