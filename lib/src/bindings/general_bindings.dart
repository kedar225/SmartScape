import 'package:get/get.dart';
import 'package:smartscape/src/features/authentication/screens/signup/signup_controller/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NetworkManager());
  }
}
