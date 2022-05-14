import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SongTile extends StatelessWidget {
  final song;
  const SongTile({Key? key, this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            width: 50,
            height: 50,
            placeholder: (context, url) => const CircularProgressIndicator(),
            imageUrl: song.background,
          ),
        ),
        title: Text(song.title),
        subtitle: Text(song.subtitle),
      ),
    );
  }
}
