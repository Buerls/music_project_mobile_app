import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_project/constants.dart';

import '../controllers/music_controller.dart';

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
            body: ListView(children: [
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
                          child: Image.network(
                            "https://i.ytimg.com/vi/kbf7Outji1E/hq720.jpg?sqp=-oaymwEcCOgCEMoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBi4YzCUJNLOqecGhmXy6Fj12X-Eg",
                            height: 75,
                            width: 75,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "aLIEz (TV size)",
                                  style: TextStyle(
                                    color: WHITE,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "SawanoHiroyuki[nZk]:mizuki",
                                  style: TextStyle(
                                    color: WHITE,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w200,
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
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MusicVoteCard(),
                          MusicVoteCard(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MusicVoteCard(),
                          MusicVoteCard(),
                        ],
                      ),
                    ])),
              ),
            ])),
      ),
    );
  }
}

class MusicVoteCard extends StatelessWidget {
  const MusicVoteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(
            color: WHITE.withOpacity(0.2),
            width: 2,
          ),
        ),
        child: Stack(
          children: [
            Container(
              child: Column(children: [
                Expanded(
                    flex: 10,
                    child: Container(
                        child: SizedBox(
                      height: 20,
                    ))),
                Expanded(
                    flex: 4,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        color: Color(0xFF09080F).withOpacity(0.75),
                      ),
                      width: double.infinity,
                      child: Text(
                        "aLIEz (TV size)-SawanoHiroyuki[nZk]:mizuki",
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: WHITE),
                      ),
                    ))
              ]),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://i.ytimg.com/vi/kbf7Outji1E/hq720.jpg?sqp=-oaymwEcCOgCEMoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBi4YzCUJNLOqecGhmXy6Fj12X-Eg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ));
  }
}
