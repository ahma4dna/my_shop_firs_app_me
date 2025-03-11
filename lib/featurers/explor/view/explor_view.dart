import 'package:flutter/material.dart';
import 'package:my_shop/constant/constant.dart';
import 'package:my_shop/core/text/custton_subtitle_text.dart';
import 'package:my_shop/core/text/custton_title_text.dart';

class ExplorView extends StatelessWidget {
  const ExplorView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CusttonSubtitleText(
          text: "الاستكشاف",
          fontSize: width * 0.065,
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: width * 0.1,
          ),
          Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CusttonTitleText(
                text: "العلامات التجارية",
                color: Theme.of(context).iconTheme.color,
                fontSize: width * 0.05,
              ),
              ),
          SizedBox(
            height: width * 0.05,
          ),
          GridView.builder(
             physics: NeverScrollableScrollPhysics(),
             shrinkWrap: true,
            itemCount: PrandModel.prand.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: width*0.03,
                mainAxisSpacing: width*0.05,
                childAspectRatio: 1),
            itemBuilder: (context, index) => SizedBox(
              height: width * 0.35,
              width: width * 0.4,
              child: GestureDetector(
                onTap:PrandModel.prandMoel[index].onPressed ,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        height: width * 0.25,
                        width: width * 0.3,
                        image: AssetImage(PrandModel.prandImageLocal[index]),
                      ),
                      SizedBox(
                        height: width * 0.05,
                      ),
                      CusttonTitleText(
                        text: PrandModel.prand[index],
                        color: Theme.of(context).iconTheme.color,
                        fontSize: width * 0.05,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        
        ],
      ),
    );
  }
}
