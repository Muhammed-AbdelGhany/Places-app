import 'package:flutter/material.dart';
import 'package:location/location.dart';
// cant use maps we need a token

class LocationInputWidget extends StatefulWidget {
  @override
  _LocationInputWidgetState createState() => _LocationInputWidgetState();
}

class _LocationInputWidgetState extends State<LocationInputWidget> {
  String _locationImageUrl;

  Future<void> _getCurrentLocation() async {
    final locationData = await Location().getLocation();
    print(locationData.longitude);
    print(locationData.latitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _locationImageUrl == null
              ? Text('No Location image')
              : Image.network(
                  _locationImageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          FlatButton.icon(
            onPressed: _getCurrentLocation,
            textColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.location_on),
            label: Text(
              'Current Location',
            ),
          ),
          FlatButton.icon(
            onPressed: () {},
            textColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.map),
            label: Text(
              'Choose Location',
            ),
          ),
        ]),
      ],
    );
  }
}
