import 'package:flutter/material.dart';
import 'package:movies_app/core/components/movies_card.dart';
import 'package:movies_app/features/home/data/home-repo.dart';
import 'package:movies_app/features/home/data/movies_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<MovieSverse> moviesRseponseFuture;

  @override
  void initState() {
    super.initState();
    moviesRseponseFuture = HomeRepo.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MovitOo' ,
          style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold ,fontSize: 30),
        ),
      ),
      body: FutureBuilder<MovieSverse>(
        future:moviesRseponseFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } 
           
          else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: buildGridView(snapshot.data!.movies!),
            );
          }
        },
      ),
    );
  }

  Widget buildGridView(List<Movies> movies) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 12,
        childAspectRatio: 0.6,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            MoviesCard(movie: movies[index]),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                onPressed: (){
                  setState(() {
                    movies[index].isBooked = !movies[index].isBooked;
                  });
                }, 
                icon: Icon(movies[index].isBooked? Icons.bookmark_outlined : Icons.bookmark_border , color: movies[index].isBooked? Colors.amber : Colors.white,))
          )
          ],
        );
      },
    );
  }

  
}
