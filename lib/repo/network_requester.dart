


import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:untitled6/model/auth/login_request.dart';
import 'package:untitled6/model/auth/registration_request.dart';
import 'package:untitled6/model/auth/registration_response.dart';
import 'package:untitled6/model/meme_model.dart';
import 'package:http/http.dart';

import '../model/auth/login_response.dart';

@LazySingleton()
class NetworkRequester {
  Future<MemesModel> getAllMeme() async {
    Response response = await get(
      Uri.parse("https://api.imgflip.com/get_memes"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    Logger().d(response.body);
    if (response.statusCode == 200) {
      MemesModel data = memesModelFromJson(response.body);
      return data;
    } else {
      throw Exception("Api call not successfull");
    }
  }

  Future<RegistrationResponse> registrationApi(RegistrationRequest registrationRequest) async {
    try{

      Response response = await post(
        Uri.parse("https://reqres.in/api/login"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        body: jsonEncode(registrationRequest.toJson()),

      );
      Logger().i(response.body);
      if(response.statusCode==200){
        return registrationResponseFromJson(response.body);
      }else{
        throw Exception("Error Api Call");
      }

    }catch(e){
      throw Exception(e);

    }
  }
  Future<LoginResponse>loginApi (LoginRequest loginRequest) async {
    try{

      Response response = await post(
        Uri.parse("https://reqres.in/api/register"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        body: jsonEncode(loginRequest.toJson()),

      );
      Logger().i(response.body);
      if(response.statusCode==200){
        return loginResponseFromJson(response.body);
      }else{
        throw Exception("Error Api Call");
      }

    }catch(e){
      throw Exception(e);

    }
  }



  //dio api call

}
