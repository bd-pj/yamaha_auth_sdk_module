import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectivityStatus =
      ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectivityStatus.value = result[0];
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<bool> initConnectivity() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      // result = await _connectivity.checkConnectivity();
      final result = await _connectivity.checkConnectivity();
      if (result[0] == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
