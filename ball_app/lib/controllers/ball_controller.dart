import 'package:get/get.dart';

class BallController extends GetxController {
  var x = 0.0.obs;
  var y = 0.0.obs;

  void updatePosition(double newX, double newY) {
    x.value = newX * 100;
    y.value = newY * 100;
  }
}
