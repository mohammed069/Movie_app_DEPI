import 'package:depi_film_app/helpers/themes/app_colors.dart';
import 'package:depi_film_app/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:depi_film_app/controllers/bookmark_controller.dart';

class ListMovieItem extends StatelessWidget {
  const ListMovieItem({super.key, required this.item});
  final MovieModel item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        item.image,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(
        item.title,
        style: TextStyle(color: AppColors.primaryTextColor),
      ),
      subtitle: Text(
        '${item.releaseDate.toLocal().toString().split(' ')[0]} . ${item.rating}',
        style: const TextStyle(color: AppColors.secondaryTextColor),
      ),
      trailing: IconButton(
        onPressed: () {
          item.isBookmarked = !item.isBookmarked;
          final bookmarkController = Provider.of<BookmarkController>(
            context,
            listen: false,
          );
          if (item.isBookmarked) {
            bookmarkController.addBookmark(item);
          } else {
            bookmarkController.removeBookmark(item);
          }
        },
        icon: Icon(
          item.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
          color: AppColors.yellowColor,
        ),
      ),
    );
  }
}
