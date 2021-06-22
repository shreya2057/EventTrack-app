import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../global_widgets/message.dart';

class GoogleLocation extends GetxController {
  Position? currentLocation;

  @override
  void onInit() {
    setCurrentLocation().then((value) {
      if (currentLocation == null) {
        FlashMessage.errorFlash('Could not get Location Data.');
      }
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  requestLocationPermission() async {
    bool serviceEnabled = false;

    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    while (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        FlashMessage.errorFlash(
            'Location permissions are permanently denied, we cannot request permissions.');
        Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        FlashMessage.errorFlash('Location permissions are denied');
        Future.error('Location permissions are denied');
      }
    }
  }

  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  setCurrentLocation() async {
    try {
      await requestLocationPermission();
      currentLocation = await getCurrentLocation();
      update();
    } catch (error) {
      FlashMessage.errorFlash(error.toString());
      Future.error(error);
    }
  }
}