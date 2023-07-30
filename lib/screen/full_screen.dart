import 'package:flutter/material.dart';
import 'package:wallpaper/style/fonts.dart';

import '../style/size.dart';


class FullScreen extends StatelessWidget {
  const FullScreen({super.key,
    required this.imageUrl,
    required this.color});
  final String imageUrl;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: SC.height,
            width: SC.width,
            child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress){
                  if(loadingProgress==null)return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
              },
            ),
          ),
          Container(
            height: 60,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(.4),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white)
                    ),
                    child: Text("Set Wallpaper",style: appFont.large.copyWith(color: Colors.white),)),
                Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 10),
                  child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Text("Cancel",style: appFont.large.copyWith(color: Colors.white),)),
                ),
                SizedBox(height: SC.vt!*8,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
