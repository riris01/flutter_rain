import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:uuid/uuid.dart';

class RainController extends GetxController {
  final rainDropId = List.generate(30, (index) => const Uuid().v1());

  void resetDrop(String id) {
    rainDropId.remove(id);
    rainDropId.add(const Uuid().v1());
    update();
  }
}
