import 'package:get_storage/get_storage.dart';
import 'package:untitled6/repo/sharePrefs/share_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePrefsImpl extends SharePrefs{
  SharePrefsImpl(){
    getStorage=GetStorage();
  }

  final _token="_token";
  late GetStorage getStorage;



  @override
  Future<void> setToken({required String value}) async {
    getStorage.write(_token, value);

  }

  @override
  String? get token => getStorage.read(_token);

  @override
  Future<void> clearAuthData() async {
    await getStorage.remove(_token);

  }

}