import 'package:depi_film_app/controllers/bookmark_controller.dart';
import 'package:depi_film_app/view/screens/wrapper_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BookmarkController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WrapperScreen(),
      ),
    );
  }
}
