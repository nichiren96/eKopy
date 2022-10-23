import 'package:ekopy/src/helpers/view_helper.dart';
import 'package:ekopy/src/models/internship_model.dart';
import 'package:ekopy/src/views/screens/home/home_viewmodel.dart';
import 'package:ekopy/src/views/screens/singleOffer/single_offer_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.init(),
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(title: const Text("E-stage")),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SingleOfferView(
                                offerTitle: Internship.samples[index].title);
                          },
                        ),
                      );
                    },
                    child: buildInternshipCard(Internship.samples[index]));
              },
              itemCount: Internship.samples.length,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.folder),
                label: 'Candidatures',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildInternshipCard(Internship internship) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: NetworkImage(internship.imageUrl),
                  width: 75,
                  height: 75,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      internship.title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Text(
                      "Technova - Mahajanga 401",
                      style: TextStyle(
                        fontSize: 10.0,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(),
          ],
        ),
      ),
    );
  }
}
