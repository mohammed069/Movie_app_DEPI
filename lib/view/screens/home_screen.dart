import 'package:depi_film_app/helpers/themes/app_colors.dart';
import 'package:depi_film_app/models/movie_model.dart';
import 'package:depi_film_app/view/screens/movie_details_screen.dart';
import 'package:depi_film_app/view/widgets/featured_movie_item.dart';
import 'package:depi_film_app/view/widgets/grid_movie_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static final List<MovieModel> moviesList = MovieModel.getFakeMovies();
  final featuredMovies = moviesList.where((movie) => movie.isFeatured).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'Movie Catalog',
          style: TextStyle(color: AppColors.primaryTextColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchBar(),
            _featuredList(),
            Text(
              "    All Movies",
              style: TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            _allMoviesList(),
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }

  Widget _featuredList() {
    return Container(
      height: 360,
      padding: const EdgeInsetsDirectional.only(start: 16),
      child: ListView.separated(
        itemCount: featuredMovies.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          MovieDetailsScreen(movie: featuredMovies[index]),
                ),
              );
            },
            child: FeaturedMovieItem(item: featuredMovies[index]),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 10);
        },
      ),
    );
  }

  Widget _allMoviesList() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.56,
          crossAxisSpacing: 12,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: moviesList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => MovieDetailsScreen(movie: moviesList[index]),
                ),
              );
            },
            child: GridMovieItem(item: moviesList[index]),
          );
        },
      ),
    );
  }
}
