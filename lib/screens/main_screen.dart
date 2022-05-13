import 'package:flutter/material.dart';
import 'package:flutter_asynchronous_api/screens/search-song/search_song.dart';
import 'package:flutter_asynchronous_api/screens/song-reco/song_suggestion.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Asynchronous API"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: ListTile(
              title: const Text('1'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SongSuggestion()),
                );
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: ListTile(
              title: const Text('2'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchSong()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
