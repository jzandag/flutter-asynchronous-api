import 'dart:convert';

import 'package:flutter_asynchronous_api/api/api.dart';
import 'package:http/http.dart';

class ApiService {
  void getSongRecommendations() async {
    try {
      final response = await get(
        Uri.parse(
            'https://shazam.p.rapidapi.com/songs/list-recommendations?key=484129036'),
        headers: ApiHelper.headers,
      );
      print(response.body);
      Map data = jsonDecode(response.body);
      var jsonData = jsonDecode(response.body)['tracks'] as List;
    } catch (e) {}
  }
}
