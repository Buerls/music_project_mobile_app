import 'package:get/get.dart';

import '../services/music_api_service.dart';

class MusicController extends GetxController {
  final MusicAPIService musicAPIService = Get.find();

  Future<void> reload() async {
    await musicAPIService.getCurrentSong();
    await musicAPIService.getNextSongs();
  }
}
