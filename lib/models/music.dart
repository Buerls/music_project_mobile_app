// Music class with this fields : thumbnail, title, artist, url

import 'dart:convert';

class Music {
  final String thumbnail;
  final String title;
  final String artist;
  final String url;

  Music({
    required this.thumbnail,
    required this.title,
    required this.artist,
    required this.url,
  });

  // add a new constructor with blank values
  Music.blank()
      : thumbnail = "",
        title = "",
        artist = "",
        url = "";

  Music copyWith({
    String? thumbnail,
    String? title,
    String? artist,
    String? url,
  }) {
    return Music(
      thumbnail: thumbnail ?? this.thumbnail,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'thumbnail': thumbnail,
      'title': title,
      'artist': artist,
      'url': url,
    };
  }

  factory Music.fromMap(Map<String, dynamic> map) {
    return Music(
      thumbnail: map['thumbnail'],
      title: map['title'],
      artist: map['artist'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Music.fromJson(String source) => Music.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Music(thumbnail: $thumbnail, title: $title, artist: $artist, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Music &&
        other.thumbnail == thumbnail &&
        other.title == title &&
        other.artist == artist &&
        other.url == url;
  }

  @override
  int get hashCode {
    return thumbnail.hashCode ^ title.hashCode ^ artist.hashCode ^ url.hashCode;
  }
}
