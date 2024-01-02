import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:traccar/Controller/auth_controller.dart';
import 'package:traccar/View/Splash/splash_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: FlutterMap(
          options: const MapOptions(
            center: LatLng(51.5, -0.09),
            zoom: 14.0,
          ),
          children: [
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: const ['a', 'b', 'c'],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        AuthController().logOut().then((value) => Get.offAll(const SplashScreen()));
      }, label: Text("LOG OUT")),
    );
  }
}
