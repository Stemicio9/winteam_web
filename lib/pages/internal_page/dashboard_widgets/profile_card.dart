

import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:winteam_web/constants/colors.dart';


class ProfileCard extends StatelessWidget {

  final String profileImage;
  final double rating;

  ProfileCard({ required this.profileImage, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.all(15),
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 12),
                  width: 105,
                  height: 105,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(50)
                    ),
                    color: white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        profileImage
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: RatingBar.builder(
                    ignoreGestures: true,
                    initialRating: rating,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 21,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }



  Widget image(String imageUrl){



/*    html.platformViewRegistry.registerViewFactory(
      imageUrl,
          (int _) => html.ImageElement()..src = imageUrl,
    ); */
    return HtmlElementView(
      viewType: imageUrl,
    );
  }
}
