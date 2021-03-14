import 'package:flutter/foundation.dart';
import 'package:places_app/models/place.dart';

class Places with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }
}
