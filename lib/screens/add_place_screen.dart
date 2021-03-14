import 'package:flutter/material.dart';
import 'package:places_app/widgets/image_input_widget.dart';

class AddPlacesScreen extends StatefulWidget {
  static const routeName = 'add-places';
  @override
  _AddPlacesScreenState createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  final _titleController = TextEditingController();
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
                  ImageInputWidget(),
                ],
              ),
            ),
          ),
          RaisedButton.icon(
            onPressed: () {},
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
