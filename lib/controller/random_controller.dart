import 'package:flutter/cupertino.dart';
import 'package:wallpaper/repository/response/status.dart';
import '../repository/repository/random_repository.dart';

class RandomController extends ChangeNotifier{

  RandomRepository _randomRepository=RandomRepository();
  ScrollController scrollController=ScrollController();

  nextPage(){
    scrollController.addListener(() {
      if(scrollController.position.maxScrollExtent==scrollController.position.pixels){
        page++;
        FetchRandomController();
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  int page=1;
  String query='wallpaper';
  String order='Latest';

  List<dynamic>randomList=[];
  String error='';

  setRandomList(List<dynamic> list){
    randomList=list;
    notifyListeners();
  }
  setError(String errors){
    error=errors;
    notifyListeners();
  }

  var randomStatus=StatusApp.LOADING;
  setStatus(StatusApp response){
    randomStatus=response;
  }

  Future FetchRandomController()async{
    setStatus(StatusApp.LOADING);
    _randomRepository.RandomRepo(page.toString(),order.toString().toLowerCase()).then((value) {
      setStatus(StatusApp.COMPLETE);
      setRandomList(value);
      notifyListeners();
    }).onError((error, stackTrace) {
      setStatus(StatusApp.ERROR);
      setError(error.toString());
      notifyListeners();
    });
  }

}