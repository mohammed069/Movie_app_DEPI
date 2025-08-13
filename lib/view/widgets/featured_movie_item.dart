import 'package:depi_film_app/models/movie_model.dart';
import 'package:flutter/material.dart';

class FeaturedMovieItem extends StatelessWidget {
  final MovieModel item;
  const FeaturedMovieItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Container(
            height: 320,
            width: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(item.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            item.title,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
