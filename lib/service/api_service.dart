import 'dart:convert';

import 'package:flutter_asynchronous_api/api/api.dart';
import 'package:flutter_asynchronous_api/model/song.dart';
import 'package:http/http.dart';

class ApiService {
  Future<List<Song>?> getSongRecommendations() async {
    try {
      final response = await get(
        Uri.parse(
            'https://shazam.p.rapidapi.com/songs/list-recommendationss?key=${ApiHelper.songKey}'),
        headers: ApiHelper.headers,
      );
      var jsonData = jsonDecode(response.body)['tracks'] as List;
      // for (var item in jsonData) {
      //   Song song = Song(
      //     item['title'],
      //     item['subtitle'],
      //     item['images']['background'] ?? '',
      //   );
      //   print(song);
      // }
      List<Song>? songs = jsonData
          .map<Song>((data) => Song(
                data['title'],
                data['subtitle'],
                data['images']['background'] ?? '',
              ))
          .toList();

      return songs;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
