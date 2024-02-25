import 'dart:convert';

import 'package:http/http.dart'  as http;
import 'package:movies_app/features/home/data/movies_model.dart';


class HomeRepo{

  static Future<MovieSverse>fetchData()async{
    String URL="https://moviesverse1.p.rapidapi.com/most-popular-movies";
    final response = await http.get(
      Uri.parse(URL),
      headers: {
        "X-RapidAPI-Key":"bdf85a6504mshfb81e7684850c1ap1c504bjsn1fc394add027",
        "X-RapidAPI-Host":"moviesverse1.p.rapidapi.com",
      }
    );
    if(response.statusCode >=200 && response.statusCode <300){
      var data =  jsonDecode(response.body);
      MovieSverse movieSverse = MovieSverse.fromJson(data);
      return movieSverse;
    }
    else{
      throw Exception('Failed to load data >>> ${response.statusCode}');
    }
  }
}