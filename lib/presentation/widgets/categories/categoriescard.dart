import 'dart:convert';

import 'package:akary/data/models/categorymodel.dart';
import 'package:akary/presentation/widgets/adaptive/textutils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class CatItem extends StatefulWidget {
  CatItem(this.index);
  int index;
  @override
  State<CatItem> createState() => _CatItemState(index);
}

class _CatItemState extends State<CatItem> {
  _CatItemState(this.index);
  int index;
  List<dynamic> categoriesList = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/categories.json');
    final data = await json.decode(response);

    setState(() {
      categoriesList = data['categories'];
      //.map((data) => PlayersModel.fromJson(data)).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
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
                      image: NetworkImage(categoriesList[index]['image']),
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
                      categoriesList[index]['title'],
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
                          text: categoriesList[index]['cate_rate'].toString(),
                          color: Colors.white,
                          underLine: TextDecoration.none,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        RatingBar(
                          initialRating: categoriesList[index]['cate_rate'],
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                            full: const Icon(Icons.star,
                                size: 20, color: Colors.orangeAccent),
                            half: const Icon(Icons.star,
                                size: 20, color: Colors.orangeAccent),
                            empty: const Icon(Icons.star,
                                size: 20, color: Colors.grey),
                          ),
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1),
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
          // CatItem(HomeCubit.get(context).categoryModel!.data);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemCount: categoriesList
            .length, // HomeCubit.get(context).categoryModel!.data.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
