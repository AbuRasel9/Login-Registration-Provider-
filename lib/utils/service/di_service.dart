
import 'package:get_it/get_it.dart';
import 'package:untitled6/repo/network_requester.dart';
import 'package:untitled6/repo/sharePrefs/share_prefs.dart';
import 'package:untitled6/repo/sharePrefs/share_prefs_impl.dart';

final GetIt di=GetIt.instance;

void diSetup(){
  di.registerLazySingleton<NetworkRequester>(() => NetworkRequester());
  di.registerLazySingleton<SharePrefs>(() => SharePrefsImpl());
}