import 'package:estate_app/presentation/controllers/app_manager.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AppManager(), permanent: true);
  }

}