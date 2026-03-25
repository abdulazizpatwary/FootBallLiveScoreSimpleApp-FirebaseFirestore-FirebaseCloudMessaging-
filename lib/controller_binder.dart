import 'package:football_live_score_exercise/presentation/ui/controller/home_live_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(HomeLiveController());
  }

}