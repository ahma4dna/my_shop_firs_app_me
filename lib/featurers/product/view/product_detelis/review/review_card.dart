import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_shop/core/function/my_expandable_text.dart';
import 'package:my_shop/core/text/custton_title_text.dart';
import 'package:my_shop/featurers/product/model/review_model/review_model.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.size,
    this.reviewModel,
  });

  final ReviewModel? reviewModel;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min, // يجعل الكارد يتمدد حسب المحتوى
            children: [
              FittedBox(
                child: CusttonTitleText(
                  text: reviewModel?.users?.name ?? "الاسم",
                  color: Theme.of(context).iconTheme.color,
                  fontSize: size.width * 0.048,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.width * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FittedBox(
                    child: CusttonTitleText(
                      text: reviewModel?.createdAt ?? "20225/11/23",
                      fontWeight: FontWeight.w300,
                      fontSize: size.width * 0.038,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: size.width * 0.03),
                  IgnorePointer(
                    ignoring: true,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: RatingBar.builder(
                        itemSize: 18,
                        initialRating: reviewModel?.rate?.toDouble() ?? 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        glowColor: Colors.transparent,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          size: 8,
                          color: Colors.blue[200],
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.width * 0.03),
              Directionality(
                textDirection: TextDirection.rtl,
                child: ExpandableText(
                  text: reviewModel?.comment ?? "تعليق المستخدم هنا...",
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: size.width * 0.045,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
