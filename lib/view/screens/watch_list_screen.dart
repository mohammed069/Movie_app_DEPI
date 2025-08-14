import 'package:depi_film_app/helpers/themes/app_colors.dart';
import 'package:depi_film_app/models/movie_model.dart';
import 'package:depi_film_app/view/screens/movie_details_screen.dart';
import 'package:depi_film_app/view/widgets/list_movie_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:depi_film_app/controllers/bookmark_controller.dart';

class WatchListScreen extends StatelessWidget {
  WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Watchlist',
          style: TextStyle(color: AppColors.primaryTextColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.primaryTextColor),
            onPressed: () {},
          ),
        ],
        backgroundColor: AppColors.backgroundColor,
      ),
      body: Consumer<BookmarkController>(
        builder: (context, bookmarkController, child) {
          final warchListMovies = bookmarkController.bookmarkedMovies;
          return ListView.builder(
            itemCount: warchListMovies.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              MovieDetailsScreen(movie: warchListMovies[index]),
                    ),
                  );
                },
                child: ListMovieItem(item: warchListMovies[index]),
              );
            },
          );
        },
      ),
    );
  }
}
