import 'package:wallpaper/model/photo_model.dart';
import 'package:wallpaper/service/photo_service.dart';

class PhotoRepository{
  PhotoService _photoService=PhotoService();

  Future<dynamic>FetchPhotoRepo(String page)async{
    final response=await _photoService.FetchPhoto(page);
    return PhotoModel.fromJson(response);
  }

  Future<dynamic>FetchQueryPhotoRepo(String query,String page)async{
    final response=await _photoService.QueryPhoto(query,page);
    return PhotoModel.fromJson(response);
  }

}