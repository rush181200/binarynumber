import 'dart:convert';

class Search {
  String title;
  String year;
  String imdbid;
  String type;
  String poster;
  Search({
    this.title,
    this.year,
    this.imdbid,
    this.type,
    this.poster,
  });

  Search copyWith({
    String title,
    String year,
    String imdbid,
    String type,
    String poster,
  }) {
    return Search(
      title: title ?? this.title,
      year: year ?? this.year,
      imdbid: imdbid ?? this.imdbid,
      type: type ?? this.type,
      poster: poster ?? this.poster,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'year': year,
      'imdbid': imdbid,
      'type': type,
      'poster': poster,
    };
  }

  factory Search.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Search(
      title: map['title'],
      year: map['year'],
      imdbid: map['imdbid'],
      type: map['type'],
      poster: map['poster'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Search.fromJson(String source) => Search.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Search(title: $title, year: $year, imdbid: $imdbid, type: $type, poster: $poster)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Search &&
        o.title == title &&
        o.year == year &&
        o.imdbid == imdbid &&
        o.type == type &&
        o.poster == poster;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        year.hashCode ^
        imdbid.hashCode ^
        type.hashCode ^
        poster.hashCode;
  }
}
