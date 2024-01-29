// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../domain/entities/Movie.dart';

class MovieModel {
  int id;
  String title;
  String overview;
  String posterPath;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
  });

  //convert JSON to MovieModal
  //JSON Deserialization
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        posterPath: json['poster_path']);
  }

  //convert MoviModel to JSON
  //JSON Serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
    };
  }

  //convert movie to entity
  Movie toEntity() {
    return Movie(
        id: id, title: title, overview: overview, posterPath: posterPath);
  }
}
