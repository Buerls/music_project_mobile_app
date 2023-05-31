import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MusicAPIService extends GetxService {
  String host = "http://192.168.1.80:8000";

  Future<void> getCurrentSong() async {
    final response = await http.get(Uri.http(host, '/track/current'));
    print(response.body);
  }

  Future<void> getNextSongs() async {
    final response = await http.get(Uri.http(host, '/vote/song'));
    print(response.body);
  }
}
