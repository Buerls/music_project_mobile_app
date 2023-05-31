import 'package:bonsoir/bonsoir.dart';
import 'package:get/get.dart';

import '../services/music_api_service.dart';

class HomeController extends GetxController {
  final musicAPIService = Get.put(MusicAPIService());
  final isLoading = false.obs;

  void discoverAPI() async {
    isLoading.value = true;
    BonsoirDiscovery discovery = BonsoirDiscovery(type: '_http._tcp');
    await discovery.ready;
    bool found = false;
    discovery.eventStream?.listen((event) {
      if (event.type == BonsoirDiscoveryEventType.discoveryServiceResolved) {
        BonsoirService service = event.service!;
        if (service.name == 'MusicAPI') {
          found = true;
          print(
              'API found at: ${service.toJson()["service.ip"]}:${service.port}');
          musicAPIService.host =
              '${service.toJson()["service.ip"]}:${service.port}';
          discovery.stop();
          isLoading.value = false;
          Get.offAllNamed('/music');
        }
      }
    });

    await discovery.start();
    try {
      await Future.delayed(Duration(seconds: 60));
      if (!found) {
        discovery.stop();
        print('Discovery stopped after 60 seconds');
      }
    } catch (_) {
      discovery.stop();
      print('Discovery stopped due to an error');
    } finally {
      isLoading.value = false;
    }
  }

  void profileAvatarClicked() {
    Get.toNamed('/profile');
  }
}
