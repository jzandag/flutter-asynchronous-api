import 'dart:convert';

import 'package:flutter_asynchronous_api/api/api.dart';
import 'package:flutter_asynchronous_api/model/song.dart';
import 'package:http/http.dart';

class ApiService {
  Future<List<Song>?> getSongRecommendations() async {
    try {
      final response = await get(
        Uri.parse(
            'https://shazam.p.rapidapi.com/songs/list-recommendations?key=${ApiHelper.songKey}'),
        headers: ApiHelper.headers,
      );
      var jsonData = jsonDecode(response.body)['tracks'] as List;
      List<Song>? songs = jsonData
          .map<Song>((data) => Song(
                data['title'],
                data['subtitle'],
                data['images']['background'] ?? '',
              ))
          .toList();

      return songs;
    } catch (e) {
      return null;
    }
  }

  Future<List<Song>?> searchSong(String term) async {
    try {
      final response = await get(
        Uri.parse('https://shazam.p.rapidapi.com/search?term=$term'),
        headers: ApiHelper.headers,
      );
      var jsonData = jsonDecode(response.body)['tracks']['hits'] as List;
      List<Song>? songs = jsonData
          .map<Song>((data) => Song(
                data['track']['title'],
                data['track']['subtitle'],
                data['track']['images']['background'] ?? '',
              ))
          .toList();

      return songs;
    } catch (e) {
      return null;
    }
  }
}
