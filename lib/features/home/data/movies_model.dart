class MovieSverse {
  List<Movies>? movies;

  MovieSverse({this.movies});

  MovieSverse.fromJson(Map<String, dynamic> Json) {
    if (Json['movies'] != null) {
      movies = <Movies>[];
      Json['movies'].forEach((v) {
        movies!.add(Movies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (movies != null) {
      data['movies'] = movies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}




class Movies {
  final String title;
  final String year;
  final String timeline;
  final String rating;
  final String image;
  bool isBooked = false;

  Movies({required this.title, required this.year, required this.timeline, required this.rating, required this.image});

  factory Movies.fromJson(Map<String,dynamic> Json){
    return Movies(
      title: Json['title'], 
      year: Json['year'], 
      timeline: Json['timeline'], 
      rating: Json['rating'], 
      image: Json['image']
    );
  }

  Map<String,dynamic>toJson(){
    return {
      'title':title ,
      'year':year ,
      'timeline':timeline ,
      'rating':rating ,
      'image':image ,
    };
  }

}