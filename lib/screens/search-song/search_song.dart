import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_asynchronous_api/model/song.dart';
import 'package:flutter_asynchronous_api/screens/song_tile.dart';
import 'package:flutter_asynchronous_api/service/api_service.dart';
import 'package:flutter_asynchronous_api/shared/constants.dart';
import 'package:flutter_asynchronous_api/shared/loading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SearchSong extends HookWidget {
  SearchSong({Key? key}) : super(key: key);
  StreamController streamController = StreamController();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Stream
    Stream stream = streamController.stream;

    Timer? _debounce;

    searchText() async {
      if (controller.text.isEmpty) {
        streamController.add(null);
        return;
      }
      streamController.add("waiting");
      List<Song>? songs = await ApiService().searchSong(controller.text.trim());
      if (songs == null) {
        streamController.add('empty');
      } else {
        streamController.add(songs);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Song Search API'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 12, bottom: 11),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white),
                  child: TextFormField(
                    decoration: Constants.searchTextInputDecoration,
                    controller: controller,
                    onChanged: (String val) {
                      if (_debounce != null && _debounce!.isActive) {
                        _debounce?.cancel();
                      }
                      _debounce = Timer(const Duration(milliseconds: 1000), () {
                        searchText();
                      });
                    },
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    searchText();
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ),
      body: StreamBuilder(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Text('Enter from search field');
          } else if (snapshot.data == 'waiting') {
            return const Loading();
          } else if (snapshot.data == 'empty') {
            return const Text('Empty results');
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return SongTile(
                song: snapshot.data![index],
              );
            },
          );
        },
      ),
    );
  }
}
