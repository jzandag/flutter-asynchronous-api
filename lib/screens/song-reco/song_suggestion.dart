import 'package:flutter/material.dart';
import 'package:flutter_asynchronous_api/screens/song_tile.dart';
import 'package:flutter_asynchronous_api/service/api_service.dart';
import 'package:flutter_asynchronous_api/shared/constants.dart';
import 'package:flutter_asynchronous_api/shared/error.dart';
import 'package:flutter_asynchronous_api/shared/loading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../model/song.dart';

class SongSuggestion extends HookWidget {
  const SongSuggestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendations'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Song list',
                style: Constants.headerStyle,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: ApiService().getSongRecommendations(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Song>?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData && snapshot.data != null) {
                  return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return SongTile(
                            song: snapshot.data![index],
                          );
                        }),
                  );
                } else {
                  return const Error();
                }
              } else {
                return const Loading();
              }
            },
          )
        ],
      ),
    );
  }

  Widget sampleData() {
    return SongTile(
        song: Song(
      'Hello',
      'subtitle',
      'https://cdn.pixabay.com/photo/2020/11/10/15/46/man-5730206_960_720.png',
    ));
  }
}
