import 'package:cloths_app/model/constants.dart';
import 'package:cloths_app/model/product.dart';

class Cloths extends Product {
  // String link;
  // String name;
  // int times;

  Cloths(super.link, super.name, super.times);

  factory Cloths.fromMap(Map<String, dynamic> map) {
    return Cloths(map[Constants.clothLinkKey], map[Constants.nameKey],
        map[Constants.timesKey]);
  }
}
