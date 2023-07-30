import 'status.dart';

class AppResponse<T>{
  StatusApp?status;
  T?data;
  String?message;
  AppResponse(this.status,this.data,this.message);

  AppResponse.loading():status=StatusApp.LOADING;
  AppResponse.complete(this.data):status=StatusApp.COMPLETE;
  AppResponse.error(this.message):status=StatusApp.ERROR;

  @override
  String toString() {
    return "Status : $status \n Msg:$message \n data:$data";
  }
}