// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../core/constants/assets.dart';

class AnimatedShoeWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final String imageUrl;
  final Duration dishPlayTime;
  final String title;
  final String name;
  final String description;
  final String price;
  const AnimatedShoeWidget({
    super.key,
    required this.constraints,
    required this.imageUrl,
    required this.dishPlayTime,
    required this.title, required this.name, required this.description, required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: constraints.maxHeight * 0.31,
          width: constraints.maxWidth * 0.8,
          alignment: Alignment.center,
          child: Image.network(imageUrl, fit: BoxFit.contain,
                  errorBuilder: (context, error, StackTrace) {
            return Image.asset(
              Assets.shoe1,
              fit: BoxFit.contain,
            );
          })
              .animate()
              .scaleXY(
                  begin: 0.0,
                  end: 1.0,
                  duration: dishPlayTime,
                  curve: Curves.decelerate)
              .fadeIn()
              .blurXY(begin: 10, end: 0),
        ),
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Sneakers",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 22,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                        itemBuilder: (context, _) => const Icon(Icons.star,
                            size: 18, color: Colors.black),
                        onRatingUpdate: (rating) {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$$price',
                        style: const TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      const Row(
                        children: [
                          Text(
                            'Colors',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 5),
                          CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.black,
                          ),
                          SizedBox(width: 5),
                          CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.amber,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Select sizes',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'View size guide',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      description,
                      textAlign: TextAlign.justify,
                      maxLines: 4,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: const Center(
                                child: Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ) .animate()
              .scaleXY(
                  begin: 0.0,
                  end: 1.0,
                  duration: dishPlayTime,
                  curve: Curves.decelerate)
              .fadeIn()
              .blurXY(begin: 10, end: 0),
      ],
    );
  }
}
