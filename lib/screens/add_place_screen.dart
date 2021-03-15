import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places_app/providers/places.dart';
import 'package:places_app/widgets/image_input_widget.dart';
import 'package:places_app/widgets/location_input_widget.dart';
import 'package:provider/provider.dart';

class AddPlacesScreen extends StatefulWidget {
  static const routeName = 'add-places';
  @override
  _AddPlacesScreenState createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  final _titleController = TextEditingController();
  File _pickedImage;

  void getImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _save() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<Places>(context, listen: false)
        .addPlace(_pickedImage, _titleController.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    controller: _titleController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ImageInputWidget(
                    onSelectImage: getImage,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  LocationInputWidget(),
                ],
              ),
            ),
          ),
          RaisedButton.icon(
            onPressed: _save,
            icon: Icon(
              Icons.add,
              color: Theme.of(context).primaryColor,
            ),
            label: Text(
              'Add Place',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            color: Theme.of(context).accentColor,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          )
        ],
      ),
    );
  }
}
