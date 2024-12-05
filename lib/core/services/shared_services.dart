import 'package:shared_preferences/shared_preferences.dart';

enum SetType {
  string,
  bool,
  int,
  double,
}

class SharedService {
  Future setData(SetType type, String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    type == SetType.string
        ? prefs.setString(key, value)
        : type == SetType.int
            ? prefs.setInt(key, value)
            : type == SetType.bool
                ? prefs.setBool(key, value)
                : type == SetType.double
                    ? prefs.setDouble(key, value)
                    : null;
    print('You have stored data as key name $key');
  }

  Future getData(SetType type, String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic data = type == SetType.string
        ? prefs.getString(key)
        : type == SetType.int
            ? prefs.getInt(key)
            : type == SetType.bool
                ? prefs.getBool(key)
                : type == SetType.double
                    ? prefs.getDouble(key)
                    : null;
    print('key: $key, Data: $data');

    return data;
  }
}
