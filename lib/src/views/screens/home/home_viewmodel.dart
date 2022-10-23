import 'package:ekopy/src/models/internship_model.dart';
import 'package:ekopy/src/services/internship_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  InternShipService internShipService = InternShipService();

  List<Internship> _internships = [];

  List<Internship> get internships => _internships;

  void init() {
    internShipService.getAll().then((value) {
      _internships = value;
    });
  }
}
