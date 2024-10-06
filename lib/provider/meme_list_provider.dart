
import 'package:flutter/material.dart';
import 'package:untitled6/utils/service/di_service.dart';

import '../model/meme_model.dart';
import '../repo/network_requester.dart';

part 'meme_list_provider_impl.dart';



abstract class MemeListProvider extends ChangeNotifier{
  bool _isLoading=false;
  bool get isLoading=>_isLoading;
  List<Meme>?_memeList;
  List<Meme>? get memeList=>_memeList;


  setLoading({required bool loading});
  Future<void>getMemeData();

}