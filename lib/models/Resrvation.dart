import 'package:bookingbus/api/api_provider.dart';
import 'package:bookingbus/screens/bus.dart';
import 'package:bookingbus/api_url.dart';
import 'buses.dart';

import 'buses.dart';

class Resrvation {
  String id;
  bus Trip;

  Resrvation({
    required this.id,
    required this.Trip,
  });

  static List<Resrvation> todoList() {
    return [];
  }
}
