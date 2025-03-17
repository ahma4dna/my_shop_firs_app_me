import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_shop/core/compnds/custtom_text_form_feild.dart';
import 'package:my_shop/core/function/naviation_to.dart';
import 'package:my_shop/core/function/naviation_to_replace.dart';
import 'package:my_shop/core/text/custton_title_text.dart';
import 'package:my_shop/featurers/product/cubit/product_cubit.dart';
import 'package:my_shop/featurers/product/model/product_model.dart';
import 'package:my_shop/featurers/product/view/product_detelis/product_detiels.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RatingAndRivew extends StatefulWidget {
  const RatingAndRivew(
      {super.key,
      required this.size,
      required this.initialRating,
      this.cubitMe,
      this.productModel});
  final Size size;
  final double initialRating;
  final ProductCubit? cubitMe;
  final ProductModel? productModel;
  @override
  State<RatingAndRivew> createState() => _RatingAndRivewState();
}

class _RatingAndRivewState extends State<RatingAndRivew> {
  late TextEditingController controller;

  double? rate;
  int? riv;
  @override
  void initState() {
    controller = TextEditingController(text: widget.cubitMe?.commentUser ?? "");
    rate = widget.initialRating;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          if (state is PostReviewSucecc || state is PutReviewSucecc) {}
        },
        builder: (context, state) {
          return state is PostReviewLoading || state is PutReviewLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.blue,
                ))
              : Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    actions: [
                      TextButton(
                        onPressed: () async {
                          if (widget.cubitMe?.rateuser != null ||
                              widget.cubitMe?.commentUser != null) {
                            await widget.cubitMe?.updateReview(
                              context: context,
                              idRev: widget.cubitMe!.id!,
                              productId: widget.productModel!.productId!,
                              data: {
                                "rate": riv,
                                "comment": controller.text,
                                "id_reviwe": widget.cubitMe!.id,
                                "created_at": widget.cubitMe!.date
                              },
                            );
                          } else {
                            await widget.cubitMe?.postReview(
                                context: context,
                                productId: widget.productModel!.productId!,
                                data: {
                                  "created_at":
                                      DateTime.now().toIso8601String(),
                                  "rate": riv,
                                  "comment": controller.text,
                                  "for_product": widget.productModel!.productId,
                                  "for_user": Supabase
                                      .instance.client.auth.currentUser!.id
                                });
                          }
                        },
                        child: FittedBox(
                          child: CusttonTitleText(
                            text: widget.cubitMe?.rateuser == null
                                ? "نشر"
                                : "تحديث",
                            fontSize: widget.size.width * 0.06,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                      )
                    ],
                    leading: IconButton(
                      onPressed: () async {
                        await navigationToReplace(
                            context: context,
                            page: ProductDetiels(
                              productModel: widget.productModel,
                            ));
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
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 18.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.blue[200],
                              ),
                              onRatingUpdate: (rating) async {
                                setState(() {
                                  riv = rating.toInt();
                                });
                              },
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
        },
      ),
    );
  }
}
