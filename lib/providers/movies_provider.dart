import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';
import 'package:peliculas/models/now_playing_response.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = "89f7f916c698f3f4e0c8325333b404c2";
  String _baseUrl = "api.themoviedb.org";
  String _language = "es-ES";

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  int _popularPage = 0;

  MoviesProvider() {
    print("Movies provider inicializado");

    this.getOnNowPlaying();
    this.getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint,
        {"api_key": _apiKey, "language": _language, "page": '$page'});
    final response = await http.get(url);
    return response.body;
  }

  getOnNowPlaying() async {
    final jsonData = await this._getJsonData("3/movie/now_playing");
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();

    //print(onDisplayMovies);

    //print(decodeData["results"][0]["backdrop_path"]);
  }

  getPopularMovies() async {
    _popularPage++;

    final jsonData = await this._getJsonData("3/movie/popular");
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }
}
