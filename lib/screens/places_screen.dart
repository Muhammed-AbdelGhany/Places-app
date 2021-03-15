import 'package:flutter/material.dart';
import 'package:places_app/providers/places.dart';
import 'package:places_app/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

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
      body: FutureBuilder(
        future: Provider.of<Places>(context, listen: false).fetchPlaces(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(child: CircularProgressIndicator())
                : Consumer<Places>(
                    child: Center(
                      child: Text('No places to view !'),
                    ),
                    builder: (context, places, ch) => places.items.length == 0
                        ? ch
                        : ListView.builder(
                            itemBuilder: (ctx, i) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: FileImage(
                                    places.items[i].image,
                                  ),
                                ),
                                title: Text(places.items[i].title),
                              );
                            },
                            itemCount: places.items.length,
                          ),
                  ),
      ),
    );
  }
}
