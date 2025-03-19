
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_shop/featurers/product/cubit/product_cubit.dart';
import 'package:my_shop/featurers/product/model/review_model/review_model.dart';

class RatingWidget1 extends StatelessWidget {
  const RatingWidget1({super.key, required this.size, this.reviewModel});

  // عدد التقييمات لكل فئة

  final Size size;
  final ReviewModel? reviewModel;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductCubit>();
    final Map<int, int> ratings = {
      5: cubit.rate5,
      4: cubit.rate4,
      3: cubit.rate3,
      2: cubit.rate2,
      1: cubit.rate1,
    };
    // int totalRatings = ratings.values.reduce((a, b) => a + b);

    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cubit.totaRating.toString(),
                style: TextStyle(
                  fontSize: size.width * 0.08,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              IgnorePointer(
                ignoring: true,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: RatingBar.builder(
                    itemSize: size.width * 0.05, // Adjust the star size
                    initialRating: cubit.totaRating.toDouble(),
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    glowColor: Colors.transparent,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      size: size.width * 0.1, // Adjust the size of stars
                      color: Colors.blue[200],
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ),
              ),
              SizedBox(height: size.width * 0.02),
              Text(
                cubit.toatlRateCount.toString(),
                style: TextStyle(
                    fontSize: size.width * 0.03, color: Colors.white70),
              ),
            ],
          ),
          SizedBox(width: size.width * 0.04),
          Column(
            children: ratings.keys.map((key) {
              double percentage = 0;
              // ignore: unnecessary_null_comparison
              if (cubit.totaRating != 0 && cubit.totaRating != null) {
                percentage = ratings[key]! / cubit.totaRating;
              }

              return Row(
                children: [
                  Text(
                    "$key",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                  SizedBox(width: size.width * 0.03),
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: size.width *
                        0.55, // Adjust the width of the progress bar
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.width * 0.01),
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(15),
                        minHeight: size.width * 0.05,
                        value: percentage,
                        backgroundColor: Colors.grey[800],
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.blue[200]!),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
