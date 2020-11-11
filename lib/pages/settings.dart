import 'package:flutter/material.dart';

import '../classes/config.dart';

final Config config = new Config();

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController defaultColorController;
  String _defaultColor = config.defaultColor;

  @override
  void initState() {
    print('Settings: initState()');
    super.initState();
    // Set the initial value for the edit field
    defaultColorController = TextEditingController(text: _defaultColor);
  }

  void updateDeviceAddress(String value) {
    print('Settings: _updateDeviceAddress($value)');
    _defaultColor = value;
    // Save the current value to the config
    config.defaultColor = _defaultColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Text("Enter the default color for the application:"),
            SizedBox(height: 10),
            TextField(
              controller: defaultColorController,
              onChanged: updateDeviceAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              style: TextStyle(fontFamily: 'Roboto Mono'),
            ),
          ],
        ),
      ),
    );
  }
}
