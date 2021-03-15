import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:places_app/helpers/db_helper.dart';
import 'package:places_app/models/place.dart';

class Places with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(File pickedImage, String title) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        location: null,
        image: pickedImage);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('places', {
      'title': newPlace.title,
      'id': newPlace.id,
      'image': newPlace.image.path
    });
  }

  Future<void> fetchPlaces() async {
    final tableData = await DBHelper.fetchDB('places');
    _items = tableData
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            location: null,
            image: File(
              item['image'],
            ),
          ),
        )
        .toList();
    notifyListeners();
  }
}
