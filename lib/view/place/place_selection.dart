import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramadantime/models/districtModel.dart';
import 'package:ramadantime/models/divisionModel.dart';
import 'package:ramadantime/res/colors/app_color.dart';
import 'package:ramadantime/res/widgets/customBottomBar.dart';
import 'package:ramadantime/view-models/controller/place_controller.dart';

class PlaceSelection extends StatefulWidget {
  const PlaceSelection({super.key});

  @override
  State<PlaceSelection> createState() => _PlaceSelectionState();
}

class _PlaceSelectionState extends State<PlaceSelection> {
  final PlaceController _controller = Get.put(PlaceController());

  String selectedDivisionString = 'বিভাগ';
  String selectedDistrictString = 'জেলা';
  Districts? _selectedDistrict;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Divisions? _selectedDivision;

    fetchdivitions() async {
      await _controller.getDivisions();
      await _controller.divisionList;
    }

    fetchdivitions();

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColor.fontColor),
          backgroundColor: AppColor.appColor,
          title: const Text(
            'স্থান নির্বাচন করুন',
            style: TextStyle(color: AppColor.fontColor),
          ),
        ),
        body: _controller.loading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColor.appColor,
                ),
              )
            : Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.appColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'আপনার স্থান নির্বাচন করুন',
                                  style: TextStyle(
                                      color: AppColor.fontColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'বিভাগ নির্বাচন করুন:',
                                        style: TextStyle(
                                            color: AppColor.fontColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Center(
                                        child: DropdownButton<Divisions>(
                                            value: _selectedDivision,
                                            items: _controller.divisionList
                                                .map((division) =>
                                                    DropdownMenuItem<Divisions>(
                                                        value: division,
                                                        child: Text(division
                                                            .bnName
                                                            .toString())))
                                                .toList(),
                                            hint: Text(
                                              '${selectedDivisionString}',
                                              style: TextStyle(
                                                  color: AppColor.fontColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            onChanged: (value) async {
                                              await _controller
                                                  .getDistricts(value!);
                                              setState(() {
                                                selectedDivisionString =
                                                    value!.bnName.toString();
                                              });
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'জেলা নির্বাচন করুন:',
                                        style: TextStyle(
                                            color: AppColor.fontColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      DropdownButton<Districts>(
                                          value: _selectedDistrict,
                                          items: _controller.districtList
                                              ?.map((district) =>
                                                  DropdownMenuItem<Districts>(
                                                      value: district,
                                                      child: Text(district
                                                          .bnName
                                                          .toString())))
                                              ?.toList(),
                                          hint: Text(
                                            '${selectedDistrictString}',
                                            style: TextStyle(
                                                color: AppColor.fontColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              selectedDistrictString =
                                                  value!.bnName.toString();
                                              _selectedDistrict = value;
                                            });
                                          }),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: InkWell(
                                        onTap: () async {
                                          if (_selectedDistrict != null) {
                                            await _controller.savePlace(
                                                _selectedDistrict!.lat
                                                    .toString(),
                                                _selectedDistrict!.lng
                                                    .toString(),
                                                _selectedDistrict!.bnName
                                                    .toString());
                                            Get.snackbar('সাফল্য',
                                                '${_selectedDistrict!.bnName.toString()} সংরক্ষণ সফলভাবে সম্পন্ন');
                                            // setState(() {
                                            // selectedDivisionString='বিভাগ';
                                            // selectedDistrictString='জেলা';
                                            //
                                            // });
                                            _selectedDistrict = null;
                                          }
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            padding: EdgeInsets.all(5),
                                            child: Text(
                                              ' সংরক্ষণ করুন ',
                                              style: TextStyle(
                                                  color: AppColor.fontColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ))))
                              ],
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
        bottomNavigationBar:customBottomBar(),
      ),
    );
  }
}
