import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        //1st Image of Slider
        Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: const DecorationImage(
              image: NetworkImage(
                  "https://media-cdn.tripadvisor.com/media/photo-s/06/a8/16/36/mandarin-oriental-bodrum.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //2nd Image of Slider
        Container(
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
              image: NetworkImage(
                  "https://cdn-0.decorextra.com/wp-content/uploads/2015/07/Modern-Two-Level-Pool-House-in-Los-Angeles-Backyard-Pool.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //3rd Image of Slider
        Container(
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
              image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4cexhJgM8kKsxubbkBJK9PVO2HFd7KXLORTKGDz2GSz7i5h5-AvCFVTlRssjnSMuYES0&usqp=CAU"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //4th Image of Slider
        Container(
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
              image: NetworkImage(
                  "http://1.bp.blogspot.com/-5Sqxy3onf74/UiSV3tgYQjI/AAAAAAAAYK4/__tzzN-z-4Y/s1600/Modern_Backyard_by_Ritz_Exterior_Design_in_Australia_on_world_of_architecture_06.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //5th Image of Slider
        Container(
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
              image: NetworkImage(
                  "https://cdn.decoist.com/wp-content/uploads/2014/02/Cool-backyard-of-minimalist-home-in-white.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],

      //Slider Container properties
      options: CarouselOptions(
        height: 180.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        viewportFraction: 0.8,
      ),
    );
  }
}
