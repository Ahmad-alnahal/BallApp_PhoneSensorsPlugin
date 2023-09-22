import 'package:flutter/material.dart';
import 'dart:async';
import 'package:phone_sensors/phone_sensors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> _sensorNames = [''];
  int _numberOfSensors = 0;
  final _phoneSensorsPlugin = PhoneSensors();

  @override
  void initState() {
    super.initState();
    getSensorNames();
  }

  Future<void> getSensorNames() async {
    List<String> sensorNames;
    sensorNames = await _phoneSensorsPlugin.getSensorNames();

    if (!mounted) return;

    setState(() {
      _sensorNames = sensorNames;
    });
  }

  Future<void> getNumberOfSensors() async {
    int numberOfSensors;
    numberOfSensors = await _phoneSensorsPlugin.getNumberOfSensors();

    if (!mounted) return;

    setState(() {
      _numberOfSensors = numberOfSensors;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Running on: $_sensorNames\n'),
              Text('----------------------------------------------\n'),
              Text('Running on: $_numberOfSensors\n'),
            ],
          ),
        ),
      ),
    );
  }
}
