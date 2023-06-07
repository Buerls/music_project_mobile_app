import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';

import '../models/music.dart';
import '../services/music_api_service.dart';

class MusicController extends GetxController {
  final MusicAPIService musicAPIService = Get.find();
  final current_song = Rx<Music>(Music.blank());
  final next_songs = RxList<Music>();
  final isVoted_0 = RxBool(false);
  final isVoted_1 = RxBool(false);
  final isVoted_2 = RxBool(false);
  final isVoted_3 = RxBool(false);
  late Timer timer;
  String old_Vote = "";

  @override
  onInit() async {
    current_song.value = await musicAPIService.getCurrentSong();
    next_songs.value = await musicAPIService.getNextSongs();
    update();
    timer = Timer.periodic(const Duration(seconds: 10), (timer) async {
      Music temp = await musicAPIService.getCurrentSong();
      print(temp.url);
      print(current_song.value.url);
      
      if (temp.url != current_song.value.url) {
        current_song.value = await musicAPIService.getCurrentSong();
        next_songs.value = await musicAPIService.getNextSongs();
        isVoted_1.value = false;
        isVoted_2.value = false;
        isVoted_3.value = false;
        isVoted_0.value = false;
      }
    });
    super.onInit();
  }

  @override
  onReady() {
    super.onReady();
  }

  @override
  onClose() {
    timer.cancel();
    super.onClose();
  }

  Future<void> reload() async {
    Music temp = await musicAPIService.getCurrentSong();
    print(temp.url);
    print(current_song.value.url);
    if (current_song.value.url != temp.url) {
      current_song.value = await musicAPIService.getCurrentSong();
      next_songs.value = await musicAPIService.getNextSongs();
      isVoted_1.value = false;
      isVoted_2.value = false;
      isVoted_3.value = false;
      isVoted_0.value = false;
      update();
    }
    update();
  }

  onTap_0() {
    if (old_Vote != next_songs[0].url) {
      musicAPIService.voteSongPost(next_songs[0].url);
      musicAPIService.voteSongDelete(old_Vote);
      old_Vote = next_songs[0].url;
      isVoted_1.value = false;
      isVoted_2.value = false;
      isVoted_3.value = false;
      isVoted_0.value = true;
    }
  }

  onTap_1() {
    if (old_Vote != next_songs[1].url) {
      musicAPIService.voteSongDelete(old_Vote);
      isVoted_1.value = true;
      isVoted_2.value = false;
      isVoted_3.value = false;
      isVoted_0.value = false;
      musicAPIService.voteSongPost(next_songs[1].url);
      old_Vote = next_songs[1].url;
    }
  }

  onTap_2() {
    if (old_Vote != next_songs[2].url) {
      musicAPIService.voteSongDelete(old_Vote);
      isVoted_1.value = false;
      isVoted_2.value = true;
      isVoted_3.value = false;
      isVoted_0.value = false;
      musicAPIService.voteSongPost(next_songs[2].url);
      old_Vote = next_songs[2].url;
    }
  }

  onTap_3() {
    if (old_Vote != next_songs[3].url) {
      musicAPIService.voteSongDelete(old_Vote);
      isVoted_1.value = false;
      isVoted_2.value = false;
      isVoted_3.value = true;
      isVoted_0.value = false;
      musicAPIService.voteSongPost(next_songs[3].url);
      old_Vote = next_songs[3].url;
    }
  }
}
