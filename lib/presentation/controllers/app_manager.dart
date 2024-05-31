import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class AppManager extends GetxController{


  @override
  void onInit(){
    // TODO: implement onInit
    super.onInit();
    requestPermission(Permission.location);

  }



  Future<bool> requestPermission(Permission permission) async {
    bool isPermanentlyDenied = await permission.isPermanentlyDenied;

    if (isPermanentlyDenied) {
      // Open app settings if permission is permanently denied
      await openAppSettings();
      return false;
    } else {
      // Request permission
      var permissionStatus = await permission.request();
      return permissionStatus.isGranted;
    }
  }

  Future<void> requestPermissions() async {
    // Request location permission
    bool locationStatus = await requestPermission(Permission.location);

    // Request camera permission
    // bool cameraStatus = await requestPermission(Permission.camera);
    //
    // // Request media access permission
    // bool mediaStatus = await requestPermission(Permission.mediaLibrary);

    // Handle permissions as needed locationStatus &&
    if ( locationStatus ) {
      // All permissions granted, proceed with your logic
      if (kDebugMode) {
        print('$locationStatus ');
      }
    } else {
      // Handle cases where permissions are not granted
    }
  }
}