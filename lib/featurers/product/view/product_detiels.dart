import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/core/compnds/custtom_text_form_feild.dart';
import 'package:my_shop/core/function/my_expandable_text.dart';
import 'package:my_shop/core/function/naviation_to.dart';
import 'package:my_shop/core/text/custton_title_text.dart';
import 'package:my_shop/featurers/product/cubit/product_cubit.dart';
import 'package:my_shop/featurers/product/model/product_model.dart';
import 'package:my_shop/featurers/product/model/review_model/review_model.dart';
import 'package:my_shop/featurers/product/view/haert_botton.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductDetiels extends StatefulWidget {
  const ProductDetiels({super.key, this.productModel});
  final ProductModel? productModel;

  @override
  State<ProductDetiels> createState() => _ProductDetielsState();
}

class _ProductDetielsState extends State<ProductDetiels> {
  List<String> imags = [
    "https://storage.store.arriadagroup.com/images/products/4660/variants/8389/1297659722671cc8aa1e7554.86197183___88c16d3f1f4ecaa611cccf4a8f9242bd.webp",
    "https://storage.store.arriadagroup.com/images/products/4660/variants/8389/406131928671cc8a9bdfed3.62403773___df0d79728fe42bd67395707ed34c5860.webp",
    "https://storage.store.arriadagroup.com/images/products/4660/variants/8389/1044037892671cc8aa62cff5.58895543___c0d1502c00dd051098ebd16552a31ac4.webp",
    "https://storage.store.arriadagroup.com/images/products/4660/variants/8389/1822937191671cc8a91ab218.05490775___8b290af9010608bb458a1babb5018259.webp",
  ];
  int selctedImage = 0;
  Future<void> fatchDetiels() async {
    Future.wait({
      context
          .read<ProductCubit>()
          .getReview(productId: widget.productModel!.productId!),
    });
  }

  @override
  void initState() {
    fatchDetiels();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductCubit>().reviews;
    final cubitMe = context.read<ProductCubit>();
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          bottomSheet: Skeletonizer(
            enabled: context.read<ProductCubit>().isLoadingriv,
            child: BottonSeat(
              productModel: widget.productModel,
              size: size,
              onPressed: () {},
            ),
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.keyboard_arrow_right),
              ),
            ],
            title: FittedBox(
              child: CusttonTitleText(
                text: "تفاصيل المنتج",
                fontSize: size.width * 0.05,
              ),
            ),
            centerTitle: true,
          ),
          body: Skeletonizer(
            enabled: context.read<ProductCubit>().isLoadingriv,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: HaertBotton(
                            size: size,
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Flexible(
                          flex: 3,
                          child: FittedBox(
                            child: CusttonTitleText(
                              text: widget.productModel?.productTitle ??
                                  "iPhone 16 Pro Max",
                              fontSize: size.width * 0.05,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    imageSelct(context, size),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    Directionality(
                        textDirection: TextDirection.rtl,
                        child: selectListImage(size)),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CusttonTitleText(
                                text: "وصف المنتج",
                                fontSize: size.width * 0.05,
                              ),
                              SizedBox(
                                height: size.width * 0.02,
                              ),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: CusttonTitleText(
                                  text: widget.productModel?.descripsion ?? "",
                                  maxLines: 35,
                                  fontSize: 14,
                                  color: Theme.of(context).iconTheme.color,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: size.width * 0.05,
                              ),
                              FittedBox(
                                child: CusttonTitleText(
                                  text: "قيم المنتج",
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: size.width * 0.05,
                              ),
                            ],
                          ),
                          RatingWidget(
                            size: size,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    Center(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: RatingBar.builder(
                          initialRating: (cubitMe.rateuser)?.toDouble() ?? 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          glowColor: Colors.transparent,
                          itemPadding: EdgeInsets.symmetric(horizontal: 18.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.blue[200],
                          ),
                          onRatingUpdate: (rating) {
                            navigationTo(
                              context: context,
                              page: RatingAndRivew(
                                size: size,
                                initialRating: rating,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CusttonTitleText(
                            text: "مراجعتي",
                            fontSize: 22,
                          ),
                          SizedBox(
                            height: size.width * 0.03,
                          ),
                          if (cubitMe.rateuser != null) ...[
                            ReviewCardMe(
                              cubitMe: cubitMe,
                              size: size,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: CusttonTitleText(
                                text: "تعديل المراجعة",
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: size.width * 0.03,
                            ),
                          ],
                          CusttonTitleText(
                            text: "باقي المراجعات",
                            fontSize: size.width * 0.05,
                          ),
                          SizedBox(
                            height: size.width * 0.03,
                          ),
                          ListView.builder(
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 5),
                              child: ReviewCard(
                                reviewModel: cubit[index],
                                size: size,
                                // reviewModel: widget.reviewModel!,
                              ),
                            ),
                            itemCount: cubit.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kBottomNavigationBarHeight + 70,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding imageSelct(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: () {
          navigationTo(
            context: context,
            page: ViewerImage(
              image: widget.productModel?.listUrlImage![selctedImage] ??
                  imags[selctedImage],
            ),
          );
        },
        child: Hero(
          tag: widget.productModel?.listUrlImage![selctedImage] ??
              imags[selctedImage],
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              height: size.width * 1,
              fit: BoxFit.cover,
              widget.productModel?.listUrlImage![selctedImage] ??
                  imags[selctedImage],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox selectListImage(Size size) {
    return SizedBox(
      height: size.width * 0.2,
      width: size.width * 1,
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selctedImage = index;
              });
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: selctedImage == index
                          ? Colors.blue
                          : Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      height: selctedImage == index
                          ? size.width * 0.24
                          : size.width * 0.2,
                      width: selctedImage == index
                          ? size.width * 0.24
                          : size.width * 0.2,
                      fit: BoxFit.cover,
                      widget.productModel?.listUrlImage![index] ?? imags[index],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        itemCount: widget.productModel?.listUrlImage!.length ?? imags.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}

class RatingWidget extends StatelessWidget {
  RatingWidget({super.key, required this.size, this.reviewModel});

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
                cubit.totaRating.toString() ?? "4.5",
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

class ReviewCardMe extends StatelessWidget {
  const ReviewCardMe({
    super.key,
    required this.size, required this.cubitMe,
  });

  final ProductCubit cubitMe;
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
                  text: cubitMe.nameUser?? "الاسم",
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
                      text: cubitMe.date??  "20225/11/23",
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
                        initialRating: cubitMe.rateuser?.toDouble() ?? 3,
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
                  text: cubitMe.commentUser??  "تعليق المستخدم هنا...",
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

class RatingAndRivew extends StatefulWidget {
  const RatingAndRivew(
      {super.key, required this.size, required this.initialRating});
  final Size size;
  final double initialRating;
  @override
  State<RatingAndRivew> createState() => _RatingAndRivewState();
}

class _RatingAndRivewState extends State<RatingAndRivew> {
  late TextEditingController controller;
  double? rate;
  @override
  void initState() {
    controller = TextEditingController(text: "");
    rate = widget.initialRating;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {},
            child: FittedBox(
              child: CusttonTitleText(
                text: "نشر",
                fontSize: widget.size.width * 0.06,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: widget.size.width * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FittedBox(
                    child: CusttonTitleText(
                      text: "قيم المنتج",
                      fontSize: widget.size.width * 0.065,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: widget.size.width * 0.05,
            ),
            Center(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: RatingBar.builder(
                  initialRating: rate!,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  glowColor: Colors.transparent,
                  itemPadding: EdgeInsets.symmetric(horizontal: 18.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.blue[200],
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ),
            ),
            SizedBox(
              height: widget.size.width * 0.08,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: SizedBox(
                width: widget.size.width * 0.95,
                height: widget.size.width * 0.2,
                child: CusttomTextFormFeild(
                  hintStyle: TextStyle(
                    color: Theme.of(context).iconTheme.color,
                    fontSize: widget.size.width * 0.04,
                  ),
                  controller: controller,
                  hint: "اختياري",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottonSeat extends StatelessWidget {
  const BottonSeat({
    super.key,
    required this.size,
    this.onPressed,
    this.productModel,
  });
  final ProductModel? productModel;
  final Size size;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(0),
      ),
      child: Container(
        color: Theme.of(context).cardTheme.color,
        width: double.infinity,
        height: size.width * 0.24,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: onPressed,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: size.width * 0.13,
                  ),
                  child: FittedBox(
                    child: CusttonTitleText(
                      text: "إضافة الى السلة",
                      color: Theme.of(context).iconTheme.color,
                      fontSize: size.width * 0.05,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            FittedBox(
              child: CusttonTitleText(
                text: " دل",
                fontSize: size.width * 0.05,
              ),
            ),
            Flexible(
              child: FittedBox(
                child: CusttonTitleText(
                  text: productModel!.price ?? "0000",
                  fontSize: size.width * 0.05,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewerImage extends StatelessWidget {
  const ViewerImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      maxScale: 3.0,
      minScale: 0.5,
      panEnabled: true,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
            child: Hero(
              tag: image,
              child: Image.network(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
