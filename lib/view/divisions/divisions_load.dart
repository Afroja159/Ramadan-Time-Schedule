
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramadantime/res/routes/route_name.dart';
import 'package:ramadantime/view-models/controller/place_controller.dart';

class DivisionLoad extends StatelessWidget {
  const DivisionLoad({super.key});

  @override
  Widget build(BuildContext context) {
    final PlaceController _controller = Get.put(PlaceController());
      return Obx(
        () => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: _controller.divisionList.length,
          itemBuilder: (context, index) {
            final division = _controller.divisionList[index];
            return GridTile(
              child: InkWell(
                onTap: () async {
                  await _controller.savePlace(division.lat.toString(),
                      division.lng.toString(), division.bnName.toString());
                  Get.toNamed(RouteName.prayer_time,
                      arguments: division.bnName.toString());
                },
                child: Card(
                    elevation: 5,
                    child: Center(
                        child: Text(
                      division.bnName.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ))),
              ),
            );
          },
        ),
      );

  }
}
