import 'package:get/get.dart';

import '../../../controllers/controllers/global_controller.dart';
import '../controllers/event_list_controller.dart';
import '../provider/event_list_provider_impl.dart';

class EventListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GlobalController());
    Get.put<EventListProviderImpl>(EventListProviderImpl());
    Get.lazyPut<EventListController>(() => EventListController());
  }
}
