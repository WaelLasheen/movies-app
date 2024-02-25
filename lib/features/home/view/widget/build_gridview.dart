import 'package:flutter/material.dart';
import 'package:movies_app/core/components/movies_card.dart';
import 'package:movies_app/features/home/data/movies_model.dart';

class BuildGridView extends StatefulWidget {
  final List<Movies> movies;
  const BuildGridView({required this.movies});

  @override
  State<BuildGridView> createState() => _BuildGridViewState();
}

class _BuildGridViewState extends State<BuildGridView> {
  @override
  Widget build(BuildContext context) {
    List<Movies> movies = widget.movies;
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