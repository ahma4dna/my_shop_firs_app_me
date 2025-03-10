import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_shop/core/compnds/custtom_text_form_feild.dart';
import 'package:my_shop/core/function/naviation_to.dart';
import 'package:my_shop/core/text/custton_title_text.dart';
import 'package:my_shop/featurers/product/view/haert_botton.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductDetiels extends StatefulWidget {
  const ProductDetiels({super.key});

  @override
  State<ProductDetiels> createState() => _ProductDetielsState();
}

class _ProductDetielsState extends State<ProductDetiels> {
  bool loading = true;
  List<String> imags = [
    "https://storage.store.arriadagroup.com/images/products/4660/variants/8389/1297659722671cc8aa1e7554.86197183___88c16d3f1f4ecaa611cccf4a8f9242bd.webp",
    "https://storage.store.arriadagroup.com/images/products/4660/variants/8389/406131928671cc8a9bdfed3.62403773___df0d79728fe42bd67395707ed34c5860.webp",
    "https://storage.store.arriadagroup.com/images/products/4660/variants/8389/1044037892671cc8aa62cff5.58895543___c0d1502c00dd051098ebd16552a31ac4.webp",
    "https://storage.store.arriadagroup.com/images/products/4660/variants/8389/1822937191671cc8a91ab218.05490775___8b290af9010608bb458a1babb5018259.webp",
  ];
  int selctedImage = 0;
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      setState(() {
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      bottomSheet: Skeletonizer(
        enabled: loading,
        child: BottonSeat(
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
        enabled: loading,
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
                          text: "iPhone 16 Pro Max",
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
                      FittedBox(
                        child: Column(
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
                                text:
                                    "● الشاشة: LTPO Super Retina XDR OLED || 2000 nits\n● مزايا الشاشة: HDR10 || Dolby Vision\n● الشريحة: A18 Pro Bionic (3 nm)\n● الكاميرا الرئيسية: 48 ميجابكسل\n● عدد الكاميرات الخلفية : 3\n● الكاميرا الأمامية: 12 ميجابكسل\n● سرعة الشحن: 50% خلال 30 دقيقة\n● مزايا إضافية:\n· التعرف على الوجه بمعرف الوجه\n· الشحن اللاسلكي المغناطيسي MagSafe\n·الذكاء الإصطناعي الخاص بشركة Apple",
                                maxLines: 22,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: size.width * 0.05,
                            ),
                            FittedBox(
                              child: CusttonTitleText(
                                text: "قيم المنتج",
                                fontSize: size.width * 0.05,
                              ),
                            ),
                          ],
                        ),
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
                      initialRating: 3,
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
                            ),);
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
                      RiewCard(size: size),
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
                          child: RiewCard(size: size),
                        ),
                        itemCount: 5,
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
  }

  Padding imageSelct(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: () {
          navigationTo(
            context: context,
            page: ViewerImage(
              image: imags[selctedImage],
            ),
          );
        },
        child: Hero(
          tag: imags[selctedImage],
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              height: size.width * 1,
              fit: BoxFit.cover,
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
                      imags[index],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        itemCount: imags.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}

class RatingWidget extends StatelessWidget {
  RatingWidget({required this.size});

  // عدد التقييمات لكل فئة
  final Map<int, int> ratings = {
    5: 4000000,
    4: 1000000,
    3: 500000,
    2: 300000,
    1: 200000,
  };

  final Size size;

  @override
  Widget build(BuildContext context) {
    int totalRatings = ratings.values.reduce((a, b) => a + b);

    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "4.5",
                style: TextStyle(
                  fontSize: size.width * 0.15,
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
                    initialRating: 3,
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
                "${totalRatings.toString()}",
                style: TextStyle(
                    fontSize: size.width * 0.03, color: Colors.white70),
              ),
            ],
          ),
          SizedBox(width: size.width * 0.04),
          Column(
            children: ratings.keys.map((key) {
              double percentage = ratings[key]! / totalRatings;
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
                  Container(
                    width: size.width *
                        0.55, // Adjust the width of the progress bar
                    child: LinearProgressIndicator(
                      value: percentage,
                      backgroundColor: Colors.grey[800],
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.blue[200]!),
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

class RiewCard extends StatelessWidget {
  const RiewCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * 0.55,
      width: size.width * 0.95,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: size.width * 0.02,
              ),
              FittedBox(
                child: CusttonTitleText(
                  text: "الاسم",
                  color: Colors.grey,
                  fontSize: size.width * 0.048,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: size.width * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FittedBox(
                    child: CusttonTitleText(
                      text: "20225/11/23",
                      fontWeight: FontWeight.w300,
                      fontSize: size.width * 0.038,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: RatingBar.builder(
                        itemSize: 18,
                        initialRating: 3,
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
              SizedBox(
                height: size.width * 0.03,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: CusttonTitleText(
                  text: "20225/11/23" * 20,
                  fontWeight: FontWeight.w500,
                  fontSize: size.width * 0.038,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  color: Colors.grey,
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
  });

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
                  text: " 7000",
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
