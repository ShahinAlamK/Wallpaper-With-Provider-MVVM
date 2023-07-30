import 'package:wallpaper/model/random_model.dart';
import '../../service/photo_service.dart';


class RandomRepository{
  PhotoService _photoService=PhotoService();


  Future<dynamic> RandomRepo(String page,String order)async{
    final response=await _photoService.RandomPhoto(page,order);
    return response;
  }


}