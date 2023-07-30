import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:wallpaper/repository/network/photo_network.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper/repository/response/exception.dart';


class PhotoService extends PhotoNetwork {

  @override
  Future RandomPhoto(String page,String order)async{
    var client = http.Client();
    var httpsUri = Uri(
        scheme: 'https',
        host: 'api.unsplash.com',
        path: '/photos',
        queryParameters: {
          'query': "wallpaper",
          'page':page,
          'per_page':'30',
          'order_by':order,
          'client_id':"tFqlItNga8HWViOMaNP3yR0mlGwDhjJaTkL-C1Tct4g"
        });
    try{
      final response=await client.get(httpsUri).timeout(Duration(seconds: 10));
      return returnResponse(response);
    }on SocketException{
      throw InternetException("");
    }on TimeoutException{
      throw RequestTimeOutException("");
    }on HttpException{
      throw BadRequestException("");
    }catch(e){
      throw InvalidDataException("");
    }
  }
  
  @override
  Future QueryPhoto(String query,String page) async{
    var client = http.Client();
    var httpsUri = Uri(
        scheme: 'https',
        host: 'api.unsplash.com',
        path: '/search/photos',
        queryParameters: {
          'query':query.toString(),
          'page':page,
          'per_page':'30',
          'client_id':"tFqlItNga8HWViOMaNP3yR0mlGwDhjJaTkL-C1Tct4g"
        });

    try{
      final response=await client.get(httpsUri).timeout(Duration(seconds: 10));
      return returnResponse(response);
    }on SocketException{
      throw InternetException("");
    }on TimeoutException{
      throw RequestTimeOutException("");
    }on HttpException{
      throw BadRequestException("");
    }catch(e){
      throw InvalidDataException("");
    }
  }


  @override
  Future FetchPhoto(String page) async {
    var client = http.Client();
    var httpsUri = Uri(
        scheme: 'https',
        host: 'api.unsplash.com',
        path: '/search/photos',
        queryParameters: {
          'query': "wallpaper",
          'page':page,
          'per_page':'30',
          'client_id':"tFqlItNga8HWViOMaNP3yR0mlGwDhjJaTkL-C1Tct4g"
        });

    try{
      final response=await client.get(httpsUri).timeout(Duration(seconds: 10));
      return returnResponse(response);
    }on SocketException{
      throw InternetException("");
    }on TimeoutException{
      throw RequestTimeOutException("");
    }on HttpException{
      throw BadRequestException("");
    }catch(e){
      throw InvalidDataException("");
    }
  }


  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body);
      case 403:
        throw InternalServerException(response.body);
      case 404:
        throw InvalidDataException(response.body);
      default:
        throw InvalidDataException(response.body);
    }
  }

}
