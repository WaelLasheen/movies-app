import 'package:flutter/material.dart';
import 'package:movies_app/features/home/data/movies_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MoviesCard extends StatelessWidget {
  final Movies movie;
  const MoviesCard({required this.movie});

  @override
  Widget build(BuildContext context) {
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
              child: CachedNetworkImage(
                imageUrl: movie.image,
                fit: BoxFit.contain,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
                errorWidget: (context, url, error) => const Icon(Icons.error ,color: Colors.red,),
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
           movie.rating==''? const Text('No Rating')
           :Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(movie.rating.substring(0,4) ,style: const TextStyle(fontWeight: FontWeight.w500),),
              const SizedBox(width: 6,),
              const Icon(Icons.star ,color: Colors.amber,size: 18,),
            ],
          ),
        ],
      ),
    );
  }
}