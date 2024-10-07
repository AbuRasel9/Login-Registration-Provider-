import 'dart:convert';

import 'package:http/http.dart';
import 'package:untitled6/repo/sharePrefs/share_prefs.dart';

import '../../utils/service/di_service.dart';

class Api {
  final diSharePrefs=di.get<SharePrefs>();


  //post method

  Future<dynamic> postRequest(body, {required String url}) async {
    try{
      Response response = await post(Uri.parse(url),    headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "token":diSharePrefs.token ?? ""
      },
          body: jsonEncode(body,),

      );
      return dataStatusCheck(response);
    }catch(e){
      throw Exception("Api Call Error ${e}");


    }


  }


  //get method

  dynamic dataStatusCheck(Response response){

    if(response.statusCode==200){
      return response.body;
    }else{
      throw Exception("Api Call Error");
    }
  }

}