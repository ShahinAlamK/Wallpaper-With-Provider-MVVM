
abstract class PhotoNetwork{

  Future<dynamic>RandomPhoto(String page,String order);
  Future<dynamic>FetchPhoto(String page);
  Future<dynamic>QueryPhoto(String query,String page);
}