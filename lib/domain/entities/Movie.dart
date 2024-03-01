// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
  });

  //Overrides the props getter method from the Equatable class
  //This method is used to define the list of properties that should be considered when 
  //determining the equality of two instances of the Todo class
  @override
  // TODO: implement props
  List<Object?> get props => [id, title, overview, posterPath];
}
