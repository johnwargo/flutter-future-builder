import 'package:shared_preferences/shared_preferences.dart';

class Config {
  static final Config _config = Config._internal();

  factory Config() => _config;

  // ESP32 IP Address
  final defaultColorKey = 'defaultColor';

  String _defaultColor;

  SharedPreferences prefs;

  Config._internal() {
    print('Config constructor');
  }

  Future loadData() async {
    // Get the configuration data from persistent storage
    print('Config: loadData()');
    // wait a couple of seconds
    await Future.delayed(const Duration(seconds: 2), () {});
    // initialize the preferences object
    prefs = await SharedPreferences.getInstance();
    // grab the device address from preferences
    _defaultColor = prefs.getString(defaultColorKey) ?? 'Orange';
  }

  void printConfig() {
    print('Config: printConfig()');
    print('Device Address: $_defaultColor');
  }

  String get defaultColor {
    print('Config: Getting Device Address');
    return _defaultColor;
  }

  set defaultColor(String defaultColor) {
    print('Config: deviceAddress($defaultColor)');
    _defaultColor = defaultColor;
    _saveString(defaultColorKey, defaultColor);
  }

  _saveString(key, value) async {
    print('Config: _saveString($key, $value)');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
}
