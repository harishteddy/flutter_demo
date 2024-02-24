import 'dart:convert';
import 'package:harish_demo/MovieModel.dart';
import 'package:http/http.dart' as http;
import 'package:harish_demo/constants.dart';


class MoviesApi {
  Future<List<MovieModel>> getMoviesData() async {
   List<MovieModel> moviesList = [];
    try {
      http.Response response = await http.get(Uri.parse(Constants.moviesApi));
      if (response.statusCode == 200) {
        List moviesData = jsonDecode(response.body);
        moviesList = moviesData.map((e) => MovieModel.fromJSON(e)).toList();
      } else {
        // throw Exception("Data fetched");
        return Future.error("Data not fetcheasd",
            StackTrace.fromString("StackTrace Error message"));
        // return Stream.error("error");
      }
    } catch (e) {
      return Future.error(
          e.toString(), StackTrace.fromString("StackTrace Error message"));
    }
    return moviesList;
  }
}