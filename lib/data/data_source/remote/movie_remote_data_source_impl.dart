// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/core/error/server_exception.dart';
import 'package:movieapp/data/data_source/movie_remote_data_source.dart';
import 'package:movieapp/data/models/movie_model.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl({
    required this.client,
  });

  static const BASE_URL = "https://api.themoviedb.org/3";
  static const API_KEY = "26e2a7846caf53650a6f9bc938e4dc0d";

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response =
        await client.get(Uri.parse("$BASE_URL/movie/popular?api_key=$API_KEY"));
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    }
    else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final response =
        await client.get(Uri.parse("$BASE_URL/trending/movie/day?language=en-US&api_key=$API_KEY"));
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    }
    else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response =
        await client.get(Uri.parse("$BASE_URL/search/movie?query=$query&api_key=$API_KEY"));
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    }
    else {
      throw ServerException();
    }
  }
}
