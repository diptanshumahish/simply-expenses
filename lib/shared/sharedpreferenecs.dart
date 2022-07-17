import 'package:shared_preferences/shared_preferences.dart';

// ignore: prefer_typing_uninitialized_variables
var username;
var currency;
saveData(String name) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString("name", name);
}

fetchData(String firstName) async {
  return firstName;
}

saveDataCurrency(String currency) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString("currency", currency);
}

fetchDataCurrency(String currency) async {
  return currency;
}
