class Song {
  final title;
  final subtitle;
  final background;

  Song(this.title, this.subtitle, this.background);

  @override
  String toString() {
    return '$title $subtitle $background';
  }
}
