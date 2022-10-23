import 'package:ekopy/src/helpers/navigation_helper.dart';
import 'package:ekopy/src/helpers/view_helper.dart';
import 'package:ekopy/src/views/screens/apply/apply_view.dart';
import 'package:ekopy/src/views/screens/singleOffer/single_offer_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ekopy/src/themes/buttons.dart';

class SingleOfferView extends StatelessWidget {
  const SingleOfferView({Key? key, required this.offerTitle}) : super(key: key);

  final String offerTitle;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SingleOfferViewModel>.reactive(
      viewModelBuilder: () => SingleOfferViewModel(),
      builder: (
        BuildContext context,
        SingleOfferViewModel model,
        Widget? child,
      ) {
        return Scaffold(
            appBar: AppBar(title: Text(offerTitle)),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/detail.png"),
                          fit: BoxFit.cover),
                    ),
                    child: SizedBox(),
                  ),
                  Text(
                    "Description",
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                      "Duis convallis elit vel neque facilisis, eu ultrices massa consequat. Pellentesque sed neque lorem. Integer venenatis ultrices urna eu placerat. Nam euismod a massa ac sodales. Praesent sodales eu risus sed finibus. Sed fermentum faucibus leo quis mattis. "),
                  spacing(vertical: 32),
                  Text(
                    "Exigences",
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  spacing(vertical: 8),
                  Text(
                      "- Duis convallis elit vel neque facilisis, eu ultrices massa consequat"),
                  spacing(vertical: 8),
                  Text(
                      "- Duis convallis elit vel neque facilisis, eu ultrices massa consequat"),
                  spacing(vertical: 8),
                  Text(
                      "- Duis convallis elit vel neque facilisis, eu ultrices massa consequat"),
                  spacing(vertical: 8),
                  Text(
                      "- Duis convallis elit vel neque facilisis, eu ultrices massa consequat"),
                  spacing(vertical: 8),
                  Expanded(
                    child: SizedBox(),
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 64,
                      child: Button.primary("POSTULER", () {
                        goto(context, ApplyView(offerTitle: offerTitle));
                      })),
                ],
              ),
            ));
      },
    );
  }
}
