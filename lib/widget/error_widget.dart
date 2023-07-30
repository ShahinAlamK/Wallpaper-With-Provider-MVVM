import 'package:flutter/material.dart';
import 'package:wallpaper/style/size.dart';
import '../style/fonts.dart';

class GeneralError extends StatelessWidget {
  const GeneralError({
    super.key, required this.onTap,
  });

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Oops",textAlign: TextAlign.center,style:appFont.large.copyWith(
            fontSize: SC.hz!*5
        ),),
        SizedBox(height:10),
        Text("Something went wrong.Please try ageing latter",textAlign: TextAlign.center,style:appFont.medium.copyWith(
            fontSize: SC.hz!*4.5
        ),),
        SizedBox(height:20),
        SizedBox(
            height: 50,
            width: SC.width!/2,
            child: ElevatedButton(
                style:ElevatedButton.styleFrom(
                    elevation: 0,
                    textStyle:appFont.medium.copyWith(
                        fontSize: SC.hz!*5
                    )
                ),
                onPressed:onTap,
                child: Text("Try Again")))
      ],
    ));
  }
}
class NoInternetError extends StatelessWidget {
  const NoInternetError({
    super.key, required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.wifi_off,size: SC.vt!*8,),
        SizedBox(height:10),
        Text("No internet connection",textAlign: TextAlign.center,style:appFont.large.copyWith(
            fontSize: SC.hz!*4.5
        ),),
        SizedBox(height:20),
        SizedBox(
            height: 50,
            width: SC.width!/2,
            child: ElevatedButton(
                style:ElevatedButton.styleFrom(
                    elevation: 0,
                    textStyle: appFont.medium.copyWith(
                        fontSize: SC.hz!*5
                    )
                ),
                onPressed:onTap,
                child: Text("Try Again")))
      ],
    ));
  }
}