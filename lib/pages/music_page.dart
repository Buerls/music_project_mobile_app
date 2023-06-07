import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_project/constants.dart';

import '../controllers/music_controller.dart';
import '../models/music.dart';

class MusicPage extends StatelessWidget {
  final _musicController = Get.put(MusicController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: _musicController.reload,
        child: Scaffold(
          backgroundColor: BACKGROUND_COLOR,
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: BACKGROUND_COLOR_LIGHT,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/2/2e/Burger_King_logo_2020.png",
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          "Bağlıca Burger King",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: WHITE,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: BACKGROUND_COLOR_LIGHT,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Şu anda oynatılıyor",
                        style: TextStyle(
                          color: WHITE,
                          fontSize: 20,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Obx(
                            () => Image.network(
                              _musicController.current_song.value.thumbnail,
                              height: 100,
                              width: 100,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Obx(
                                  () => Text(
                                    _musicController.current_song.value.title,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: WHITE,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Obx(
                                  () => Text(
                                    _musicController.current_song.value.artist,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: WHITE,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: BACKGROUND_COLOR_LIGHT,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Obx(
                    () => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MusicVoteCard(
                              music: _musicController.next_songs[0],
                              isVoted: _musicController.isVoted_0.value,
                              onTap: _musicController.onTap_0,
                            ),
                            MusicVoteCard(
                              music: _musicController.next_songs[1],
                              isVoted: _musicController.isVoted_1.value,
                              onTap: _musicController.onTap_1,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MusicVoteCard(
                              music: _musicController.next_songs[2],
                              isVoted: _musicController.isVoted_2.value,
                              onTap: _musicController.onTap_2,
                            ),
                            Obx(
                              () => MusicVoteCard(
                                music: _musicController.next_songs[3],
                                isVoted: _musicController.isVoted_3.value,
                                onTap: _musicController.onTap_3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MusicVoteCard extends StatelessWidget {
  Music music;
  bool isVoted;
  void Function() onTap;

  MusicVoteCard({
    required this.music,
    required this.isVoted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
          margin: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
              color: isVoted ? LIGHT_GREEN : WHITE.withOpacity(0.2),
              width: 2,
            ),
          ),
          child: Stack(
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(music.thumbnail),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(children: [
                  Expanded(
                      flex: 10,
                      child: Container(
                          child: const SizedBox(
                        height: 20,
                      ))),
                  Expanded(
                      flex: 4,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isVoted ? LIGHT_GREEN : Colors.transparent,
                            width: isVoted ? 2 : 0,
                          ),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          color: Color(0xFF09080F).withOpacity(0.75),
                        ),
                        width: double.infinity,
                        child: Text(
                          music.title,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(color: isVoted ? LIGHT_GREEN : WHITE),
                        ),
                      ))
                ]),
              ),
            ],
          )),
    );
  }
}
