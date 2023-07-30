import 'package:flutter/cupertino.dart';

class SC{
  MediaQueryData? _queryData;
  static double? height;
  static double? width;
  static double? hz;
  static double? vt;
  config(BuildContext context){
    _queryData=MediaQuery.of(context);
    height=_queryData!.size.height;
    width=_queryData!.size.width;
    hz=width!/100;
    vt=height!/100;
  }
}