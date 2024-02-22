import 'dart:convert';

import 'package:get/get.dart';
import 'package:ramadantime/models/divisionModel.dart';
import 'package:flutter/services.dart' as root;

class HomeController extends GetxController {
  List<Divisions> divisionList = <Divisions>[].obs;
  Future<List<Divisions>> getDivisions() async {
    final jsonData = await root.rootBundle.loadString('/division.json');
    final list = json.decode(jsonData) as List<dynamic>;
    divisionList =
        await list.map((division) => Divisions.fromJson(division)).toList();
    return divisionList;
  }
}
