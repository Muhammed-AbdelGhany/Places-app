import 'package:flutter/material.dart';
import 'package:places_app/screens/add_place_screen.dart';

class PlacesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Great Places'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlacesScreen.routeName);
              })
        ],
      ),
      body: Center(
        child: Text('loading'),
      ),
    );
  }
}
