class AppException implements Exception{
  final _message;
  final _prefix;
  AppException([this._message,this._prefix]);

  @override
  String toString() {
    return "$_message $_prefix";
  }
}

class InternetException extends AppException{
  InternetException([String?message]):super(message,"No Internet");
}

class RequestTimeOutException extends AppException{
  RequestTimeOutException([String?message]):super(message,"Request TimeOut");
}

class BadRequestException extends AppException{
  BadRequestException([String?message]):super(message,"Bad Request");
}

class InternalServerException extends AppException{
  InternalServerException([String?message]):super(message,"Not Found");
}

class InvalidDataException extends AppException{
  InvalidDataException([String?message]):super(message,"Something went wrong on our end");
}