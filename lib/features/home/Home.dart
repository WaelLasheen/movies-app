import 'package:flutter/material.dart';
import 'package:movies_app/features/home/home-repo.dart';
import 'package:movies_app/features/home/movies_model.dart';

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
            buildMovieCard(movies[index]),
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

  Widget buildMovieCard(Movies movie) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(15)
      ),
      alignment: AlignmentDirectional.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              child: Image.network(
                movie.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 4,),
          Text(
            movie.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis
            ),
          ),
          const SizedBox(height: 2,),
          const Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text('Click' ,style: TextStyle(fontWeight: FontWeight.w500),),
              SizedBox(width: 6,),
              Icon(Icons.star ,color: Colors.amber,size: 18,),
            ],
          ),
        ],
      ),
    );
  }
}
