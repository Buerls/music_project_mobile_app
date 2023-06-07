import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/music.dart';

class MusicAPIService extends GetxService {
  String host = "http://192.168.1.80:8000";

  Future<Music> getCurrentSong() async {
    final response = await http.get(Uri.http(host, '/track/current'),
        headers: {"Content-Type": "application/json, charset=utf-8"});
    Music m = Music.fromMap(jsonDecode(utf8.decode(response.bodyBytes)));

    return m;
  }

  Future<List<Music>> getNextSongs() async {
    final response = await http.get(Uri.http(host, '/vote/song'),
        headers: {"Content-Type": "application/json, charset=utf-8"});
    List<Music> nextSongs = [];

    for (var song in jsonDecode(utf8.decode(response.bodyBytes))) {
      Music m = Music.fromMap(song);
      nextSongs.add(m);
    }

    return nextSongs;
  }

  Future<void> voteSongPost(String songId) async {
    final response = await http.post(
      Uri.http(
        host,
        "/vote/song",
        {"url": songId},
      ),
      headers: {
        "accept": "application/json",
      },
      encoding: Encoding.getByName("utf-0"),
    );
    print(utf8.decode(response.bodyBytes));
  }

  Future<void> voteSongDelete(String songId) async {
    final response = await http.delete(
      Uri.http(
        host,
        "/vote/song",
        {"url": songId},
      ),
      headers: {
        "accept": "application/json",
      },
      encoding: Encoding.getByName("utf-8"),
    );
    print(utf8.decode(response.bodyBytes));
  }
}
