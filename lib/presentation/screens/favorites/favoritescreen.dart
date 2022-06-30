import 'package:akary/presentation/widgets/favorites/favoritescard.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 8,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of items in row
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.13),
              crossAxisSpacing: 5, // Space between columns
              mainAxisSpacing: 5, // Space between rows
            ),
            itemBuilder: (context, index) {
              return const FavoritesCard();
            }));
  }
}
