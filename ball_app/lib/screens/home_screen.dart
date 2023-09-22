import 'package:ball_app/controllers/ball_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensors/sensors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          'Ball App',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: const AccelerometerWidget(),
    );
  }
}

class AccelerometerWidget extends StatefulWidget {
  const AccelerometerWidget({super.key});

  @override
  _AccelerometerWidgetState createState() => _AccelerometerWidgetState();
}

class _AccelerometerWidgetState extends State<AccelerometerWidget> {
  final BallController ballController = Get.put(BallController());

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      ballController.updatePosition(event.x, event.y);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenCenter = Offset(
      MediaQuery.of(context).size.width / 2,
      MediaQuery.of(context).size.height / 2,
    );

    return Stack(
      children: [
        Obx(
          () => Positioned(
            left: ballController.x.value == 0 && ballController.y.value == 0
                ? screenCenter.dx // Center x-axis
                : ballController.x.value.clamp(
                    0,
                    MediaQuery.of(context).size.width - 50,
                  ),
            top: ballController.x.value == 0 && ballController.y.value == 0
                ? screenCenter.dy // Center y-axis
                : ballController.y.value.clamp(
                    0,
                    MediaQuery.of(context).size.height - 50,
                  ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(90),
              ),
              width: 50,
              height: 50,
            ),
          ),
        ),
      ],
    );
  }
}
