import 'package:flutter/material.dart';
import 'package:wallpaper/style/fonts.dart';
import 'package:wallpaper/utils/utils.dart';
import '../model/random_model.dart';
import '../screen/full_screen.dart';
import '../style/size.dart';


class PhotoCard extends StatelessWidget {
  const PhotoCard({super.key, required this.photo});
  final RandomModel photo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10,left: 10,bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5,bottom: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(photo.user.profileImage.medium),),
                SizedBox(width:10),
                Text(photo.user.name,style:appFont.large.copyWith(fontSize: SC.hz!*3.5),),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (_)=>
                  FullScreen(
                    imageUrl:photo.urls.raw,
                    color:appUtils.colorFromHex(photo.color.toString()),
                  )));
            },
            child: Container(
              height: 350,
              width: SC.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: appUtils.colorFromHex(photo.color),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(photo.urls.regular,))
              ),

            ),
          ),
        ],
      ),
    );
  }
}