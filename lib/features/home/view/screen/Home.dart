import 'package:flutter/material.dart';
import 'package:movies_app/core/components/movies_card.dart';
import 'package:movies_app/features/home/data/home-repo.dart';
import 'package:movies_app/features/home/data/movies_model.dart';
import 'package:movies_app/features/home/view/widget/build_gridview.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<MovieSverse> moviesRseponseFuture;

  @override
  void initState() {
    super.initState();
    moviesRseponseFuture = HomeRepo().fetchData();
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
          if(snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          else if(snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: BuildGridView(movies: snapshot.data!.movies!),
            );
          }
          else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }  
}
