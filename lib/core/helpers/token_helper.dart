import 'package:tt9_betweener_challenge/core/helpers/shared_prefs.dart';

Future<String> getToken() async {
  return await SharedPrefsController().getData('token');
}
