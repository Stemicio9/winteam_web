import 'package:flutter/material.dart';
import 'package:winteam_web/constants/colors.dart';
import 'package:winteam_web/constants/language.dart';
import 'package:winteam_web/pages/utils/utils.dart';
import 'package:winteam_web/widgets/action_buttons_v2.dart';

class PostsAvailableCard extends StatelessWidget {
  final String posts;
  final onTap;

  PostsAvailableCard({required this.posts, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        elevation: 10,
        child: Column(
          children: [
            Container(
              width: 300,
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: background),
              child: Center(
                child: Text(
                  getCurrentLanguageValue(AVAILABLE_POSTS)!,
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont('Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: white),
                ),
              ),
            ),
            Container(
                width: 300,
                padding: const EdgeInsets.all(44),
                child: Column(
                  children: [

                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: SafeGoogleFont(
                          'Montserrat',
                          fontSize: 48,
                          fontWeight: FontWeight.w600,
                          color:background,
                        ),
                        children: [
                          TextSpan(
                            text: posts,
                          ),
                          TextSpan(
                            text: '/5',
                            style: SafeGoogleFont(
                              'Montserrat',
                              fontSize: 48,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffcecece),
                            ),
                          ),
                        ],
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.only(top: 49),
                      child: ActionButtonV2(action: onTap, text:getCurrentLanguageValue(ADD)!,),
                    )

                  ],
                )
            ),


          ],
        ),
      ),
    );
  }
}
