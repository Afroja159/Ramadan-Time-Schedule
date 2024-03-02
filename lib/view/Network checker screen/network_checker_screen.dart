import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramadantime/res/routes/route_name.dart';
import 'package:ramadantime/res/widgets/customBottomBar.dart';
import 'package:ramadantime/view/home/home_page.dart';
import 'package:ramadantime/view/home/home_view.dart';

Future<bool> checkNetwork() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}

class NetworkCheckScreen extends StatelessWidget {
  const NetworkCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkNetwork(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Scaffold(body: Text('Error,checking network connection'));
        } else if (snapshot.data == true) {
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, RouteName.homeScreen);
          });
          return Container();
        } else {
          return const NetworkErrorDialog();
        }
      },
    );
  }
}

class NetworkErrorDialog extends StatelessWidget {
  const NetworkErrorDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               // Image.asset('assets/icon/icon.png'),
                Text('Something went wrong'),
                Text('Check your connection and try again'),
                TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    bool hasNetwork = await checkNetwork();
                    if (hasNetwork) {
                      Get.toNamed(RouteName.homeScreen);
                    } else {
                      Get.to(() => NetworkErrorDialog());
                    }
                  },
                  child: Text('TRY AGAIN'),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ));
  }
}
