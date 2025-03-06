import 'package:flutter/material.dart';
import 'package:my_shop/core/function/naviation_to.dart';
import 'package:my_shop/core/text/custton_title_text.dart';
import 'package:my_shop/featurers/product/view/haert_botton.dart';

class ProductDetiels extends StatefulWidget {
  const ProductDetiels({super.key});

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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      bottomSheet: BottonSeat(
        size: size,
        onPressed: () {},
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
        title: CusttonTitleText(
          text: "تفاصيل المنتج",
          fontSize: 18,
        ),
        centerTitle: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: HaertBotton(
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
                    fontSize: 23,
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
          selectListImage(size),
          SizedBox(
            height: size.width * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CusttonTitleText(
                  text: "وصف المنتج",
                  fontSize: 22,
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
              ],
            ),
          ),
        ],
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
                      height:selctedImage == index?size.width * 0.24: size.width * 0.2,
                      width:selctedImage == index?size.width * 0.24: size.width * 0.2,
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
                  child: CusttonTitleText(
                    text: "إضافة الى السلة",
                    color: Theme.of(context).iconTheme.color,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            CusttonTitleText(
              text: " دل",
              fontSize: 18,
            ),
            Flexible(
              child: FittedBox(
                child: CusttonTitleText(
                  text: " 7000",
                  fontSize: 23,
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: image,
            child: InteractiveViewer(
              maxScale: 3.0,
              minScale: 0.5,
              panEnabled: true,
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
