import 'package:flutter/material.dart';

import './settings.dart';
import '../classes/config.dart';

final Config config = new Config();

class AppHome extends StatefulWidget {
  AppHome({Key key, this.appName}) : super(key: key);

  final String appName;

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  // Text Editing Controllers
  TextEditingController deviceAddressController;

  String _defaultColor = config.defaultColor;

  @override
  void initState() {
    print('Home: initState()');
    super.initState();
  }

  Future<bool> loadConfigAsync() async {
    print('Home: loadConfigAsync()');
    // Initialize the config object
    await config.loadData();
    // Initialize the device address variable from preferences
    _defaultColor = config.defaultColor;
    // Set the initial value for the edit field
    deviceAddressController = TextEditingController(text: _defaultColor);
    // Tell FutureBuilder we're ready to go...
    return true;
  }

  void updateDefaultColor(String value) {
    print('Home: _updateDeviceAddress($value)');
    _defaultColor = value;
  }

  void _openPage() async {
    print('Home: _openPage()');
    // Opens a page with a back button
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => SettingsPage(),
            settings: RouteSettings(name: '/settings')));
    setState(() {
      _defaultColor = config.defaultColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    // https://medium.com/swlh/flutter-futurebuilder-383b6ed63f18
    return FutureBuilder(
        future: loadConfigAsync(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // Future hasn't finished yet, return a placeholder
            return Scaffold(
                appBar: AppBar(title: Text(widget.appName)),
                body: SafeArea(
                    child: Center(
                        child: Container(
                            child: Text('Loading preferences from storage')))));
          } else {
            return Scaffold(
              appBar: AppBar(title: Text(widget.appName), actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    print('Home: Settings button tapped');
                    _openPage();
                  },
                ),
              ]),
              body: SafeArea(
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: <Widget>[
                    SizedBox(height: 10),
                    Text("The application's default color is $_defaultColor."),
                  ],
                ),
              ),
            );
          } // if (!snapshot.hasData)
        });
  }
}
