import 'package:flutter/material.dart';
import 'package:my_shop/constant/constant.dart';
import 'package:my_shop/core/compnds/custtom_text_form_feild.dart';
import 'package:my_shop/core/function/naviation_to.dart';
import 'package:my_shop/core/text/custton_subtitle_text.dart';
import 'package:my_shop/featurers/product/view/product_detiels.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool? filter = true;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CusttonSubtitleText(
          text: "البحت",
          fontSize: width * 0.065,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SizedBox(
                  width: width * 0.95,
                  height: width * 0.15,
                  child: CusttomTextFormFeild(
                    hintStyle: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                      fontSize: width * 0.052,
                    ),
                    prefixIcon: Icon(Icons.search),
                    controller: controller,
                    hint: "البحت",
                  ),
                ),
              ),
            ),
            if (filter == true) ...[
              CleraAllFilter(width: width),
              SizedBox(
                height: width * 0.02,
              ),
              ListFilterCategory(
                width: width,
              ),
              SizedBox(
                height: width * 0.05,
              ),
              ListFilterPrand(
                width: width,
              ),
                SizedBox(
                height: width * 0.05,
              ),
            ],
            CustomScrollView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5), // مسافة بين العناصر
                          child: SearchWidget(
                            width: width,
                          ));
                    },
                    childCount: 10, // عدد العناصر
                  ),
                ),
              ],
            ),
            SizedBox(
              height: kBottomNavigationBarHeight + width * 0.08,
            )
          ],
        ),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 95,
      height: width * 0.37,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: GestureDetector(
                    onTap: () {
                      navigationTo(context: context, page: ProductDetiels());
                    },
                    child: Image.network(
                      width: width * 0.3,
                      height: width * 0.37,
                      fit: BoxFit.cover,
                      "https://storage.store.arriadagroup.com/images/products/4660/variants/8389/1822937191671cc8a91ab218.05490775___8b290af9010608bb458a1babb5018259.webp",
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.05,
              ),
              Flexible(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CusttonSubtitleText(
                        text: "Apple",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: width * 0.02,
                      ),
                      CusttonSubtitleText(
                        text: "iPhone 16 Pro Max",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        fontSize: width * 0.05,
                      ),
                      SizedBox(
                        height: width * 0.025,
                      ),
                      CusttonSubtitleText(
                        text: " 7000 دل",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        color: Theme.of(context).iconTheme.color,
                        fontSize: width * 0.06,
                      ),
                    ],
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

class CleraAllFilter extends StatelessWidget {
  const CleraAllFilter({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: width * 0.38),
      child: TextButton(
        onPressed: () {},
        child: CusttonSubtitleText(
          text: "محو الفلاتر",
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}

class ListFilterCategory extends StatelessWidget {
  const ListFilterCategory({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 1,
      height: width * 0.085,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (contex, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: width * 0.25,
              height: width * 0.075,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: FittedBox(
                  child: CusttonSubtitleText(
                    text: CategoryMosel.caeoryText[index],
                    color: Theme.of(context).iconTheme.color,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ),
        itemCount: CategoryMosel.caeoryText.length,
      ),
    );
  }
}

class ListFilterPrand extends StatelessWidget {
  const ListFilterPrand({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 1,
      height: width * 0.085,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (contex, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              
              width: width * 0.25,
              height: width * 0.075,
              decoration: BoxDecoration(
                
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: FittedBox(
                  child: CusttonSubtitleText(
                    text: CategoryMosel.prand[index],
                    color: Theme.of(context).iconTheme.color,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ),
        itemCount: CategoryMosel.prand.length,
      ),
    );
  }
}
