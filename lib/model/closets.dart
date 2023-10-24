import 'package:cloths_app/model/product.dart';

import 'constants.dart';

class Closets extends Product {
  // String link;
  // String name;
  // int times;

  Closets(super.link, super.name, super.times);

  factory Closets.fromMap(Map<String, dynamic> map) {
    return Closets(map[Constants.closetsLinkKey], map[Constants.nameKey],
        map[Constants.timesKey]);
  }
}
