import 'package:eventrack_app/app/controllers/controllers/global_controller.dart';
import 'package:eventrack_app/app/models/response.dart';
import 'package:eventrack_app/app/modules/event_detail/provider/event_detail_provider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../models/event/event.dart';
import '../../../temp_data.dart';

class EventDetailController extends GetxController {
  final RxBool showMore = false.obs;
  late GoogleMapController? mapController;
  late GlobalController globalController;
  late EventDetailProvider _eventDetailProvider;

  Event get event => TempData.event;

  get users => TempData.users;
  late TextEditingController searchText;

  @override
  void onInit() {
    searchText = TextEditingController();
    globalController = Get.find<GlobalController>();
    _eventDetailProvider = Get.find<EventDetailProvider>();
    super.onInit();
  }

  registerforevent() async {
    ResponseModel? register = await _eventDetailProvider
        .registerToEvent(globalController.currentUser.id!);
    //this result is already parsed and is converted to List<Events>
    if (register!.state) {
    } else {
      print("Data Not Found");
    }
  }

  void search() {
    print('Search for ${searchText.text}');
  }

  void toggleDescriptionDisplay() => showMore.value = !showMore.value;

  void createMap(GoogleMapController newMapController) {
    mapController = newMapController;
    update();
  }
}
