import 'package:akary/data/models/categorymodel.dart';
import 'package:akary/presentation/widgets/adaptive/textutils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

/*
Widget CatItem(Data model) => InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                    model.attributes.cateImg.data[1].attributes.url),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.shade600.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                model.attributes.cateName.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.shade600.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  TextUtils(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    text: model.attributes.cateRate.toString(),
                    color: Colors.white,
                    underLine: TextDecoration.none,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  RatingBar(
                    initialRating: model.attributes.cateRate.toDouble(),
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                      full: const Icon(Icons.star,
                          size: 20, color: Colors.orangeAccent),
                      half: const Icon(Icons.star,
                          size: 20, color: Colors.orangeAccent),
                      empty:
                          const Icon(Icons.star, size: 20, color: Colors.grey),
                    ),
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                    minRating: 1,
                    maxRating: 5,
                    itemSize: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
*/
Widget CatItem() => InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCVKcMlf2tspM4UetaFeumiu-GWH-Xkha0ww&usqp=CAU'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.shade600.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'شقه 4 وصالة',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.shade600.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  TextUtils(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    text: '5',
                    color: Colors.white,
                    underLine: TextDecoration.none,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  RatingBar(
                    initialRating: 4.3,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                      full: const Icon(Icons.star,
                          size: 20, color: Colors.orangeAccent),
                      half: const Icon(Icons.star,
                          size: 20, color: Colors.orangeAccent),
                      empty:
                          const Icon(Icons.star, size: 20, color: Colors.grey),
                    ),
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                    minRating: 1,
                    maxRating: 5,
                    itemSize: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
