import 'package:depi_film_app/controllers/bookmark_controller.dart';
import 'package:depi_film_app/helpers/themes/app_colors.dart';
import 'package:depi_film_app/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridMovieItem extends StatefulWidget {
  final MovieModel item;
  GridMovieItem({super.key, required this.item});

  @override
  State<GridMovieItem> createState() => _GridMovieItemState();
}

class _GridMovieItemState extends State<GridMovieItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                height: 270,
                width: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(widget.item.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.item.isBookmarked = !widget.item.isBookmarked;
                  });
                  final bookmarkController = Provider.of<BookmarkController>(
                    context,
                    listen: false,
                  );
                  if (widget.item.isBookmarked) {
                    bookmarkController.addBookmark(widget.item);
                  } else {
                    bookmarkController.removeBookmark(widget.item);
                  }
                },
                icon: Icon(
                  widget.item.isBookmarked
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  color: AppColors.yellowColor,
                ),
              ),
            ],
          ),
          Text(
            widget.item.title,
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
