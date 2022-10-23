import 'package:ekopy/src/helpers/navigation_helper.dart';
import 'package:ekopy/src/helpers/view_helper.dart';
import 'package:ekopy/src/themes/buttons.dart';
import 'package:ekopy/src/views/screens/apply/apply_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ApplyView extends StatelessWidget {
  ApplyView({Key? key, required this.offerTitle}) : super(key: key);

  final String offerTitle;
  final TextEditingController textarea = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ApplyViewModel>.reactive(
      viewModelBuilder: () => ApplyViewModel(),
      builder: (
        BuildContext context,
        ApplyViewModel model,
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
                          image: AssetImage("assets/images/resume.png"),
                          fit: BoxFit.cover),
                    ),
                    child: SizedBox(),
                  ),
                  Text(
                    "Uploader votre CV",
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  spacing(vertical: 8),
                  SizedBox(
                      width: double.infinity,
                      height: 64,
                      child: Button.primary("Choisir un fichier", () {
                        goto(context, ApplyView(offerTitle: offerTitle));
                      })),
                  spacing(vertical: 32),
                  Text(
                    "Informations additionnelles",
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  spacing(vertical: 8),
                  TextField(
                    controller: textarea,
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Colors.deepPurpleAccent))),
                  ),
                  spacing(vertical: 16),
                  Expanded(
                    child: SizedBox(),
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 64,
                      child: Button.primary("VALIDER", () {
                        goto(context, ApplyView(offerTitle: offerTitle));
                      })),
                ],
              ),
            ));
      },
    );
  }
}
