






import 'package:get_it/get_it.dart';
import 'package:untitled6/repo/sharePrefs/share_prefs.dart';
import 'package:untitled6/repo/sharePrefs/share_prefs_impl.dart';

import '../../repo/network_requester.dart';

final GetIt di=GetIt.instance;

//create instance in get it

void setUpDi(){
  di.registerLazySingleton<NetworkRequester>(() => NetworkRequester());
  //create di for share prefs
  di.registerLazySingleton<SharePrefs>(() => SharePrefsImpl());

}