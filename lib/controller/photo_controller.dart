import 'package:flutter/cupertino.dart';
import 'package:wallpaper/model/photo_model.dart';
import 'package:wallpaper/repository/repository/photo_repository.dart';
import 'package:wallpaper/repository/response/response.dart';
import 'package:wallpaper/repository/response/status.dart';


class PhotoController extends ChangeNotifier{

  PhotoRepository _repository=PhotoRepository();
  ScrollController scrollController=ScrollController();

  nextPage(){
    scrollController.addListener(() {
      if(scrollController.position.maxScrollExtent==scrollController.position.pixels){
        page++;
        FetchQueryController();
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
  String query='';

  AppResponse<PhotoModel> photoResponse=AppResponse.loading();
  void setStatus(AppResponse<PhotoModel>response){
    photoResponse=response;
  }

  PhotoModel? photoList;
  String error='';
  StatusApp statusApp=StatusApp.LOADING;

  setPhotoList(PhotoModel _value)=>photoList=_value;
  setPhotoStatus(StatusApp _value)=>statusApp=_value;
  setError(String _value)=>error=_value;

  void FetchPhotoController(){
     setPhotoStatus(StatusApp.LOADING);
     _repository.FetchPhotoRepo(page.toString()).then((value) {
       setPhotoStatus(StatusApp.COMPLETE);
       setPhotoList(value);
       notifyListeners();
     }).onError((error, stackTrace) {
       setPhotoStatus(StatusApp.ERROR);
       setError(error.toString());
       notifyListeners();
     });
   }

  void RefreshFetchPhoto(){
    setStatus(AppResponse.loading());
    _repository.FetchPhotoRepo(page.toString()).then((value) {
      setStatus(AppResponse.complete(value));
      notifyListeners();
    }).onError((error, stackTrace) {
      setStatus(AppResponse.error(error.toString()));
      notifyListeners();
    });
  }

  void FetchQueryController(){
    setPhotoStatus(StatusApp.LOADING);
    _repository.FetchQueryPhotoRepo(query,page.toString()).then((value) {
      setPhotoStatus(StatusApp.COMPLETE);
      setPhotoList(value);
      notifyListeners();
    }).onError((error, stackTrace) {
      setPhotoStatus(StatusApp.ERROR);
      setError(error.toString());
      notifyListeners();
    });
  }

}