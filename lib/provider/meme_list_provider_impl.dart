part of'meme_list_provider.dart';

class MemeListProviderImpl extends MemeListProvider{
  NetworkRequester memesDi=di<NetworkRequester>();

  @override
  Future<void> getMemeData() async {
    MemesModel result=await memesDi.getAllMeme();
    // MemesModel result=await NetworkRequester().getAllMeme();
    _memeList=result.data?.memes ?? [];
    notifyListeners();

  }

  @override
  setLoading({required bool loading}) {
    _isLoading=loading;
    notifyListeners();

  }

}