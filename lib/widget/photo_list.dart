import 'package:flutter/material.dart';
import 'package:wallpaper/utils/utils.dart';
import '../controller/photo_controller.dart';
import '../model/photo_model.dart';
import '../screen/full_screen.dart';
import '../style/size.dart';

class PhotoView extends StatelessWidget {
  const PhotoView({
    super.key, required this.controller,
  });
  final PhotoController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10,left: 10),
      child:ListView.builder(
        controller: controller.scrollController,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(top:5),
          itemCount:controller.photoList!.results.length+1,
          itemBuilder: (BuildContext context, int index) {
            if(index<controller.photoList!.results.length){
              Result result=controller.photoList!.results[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (_)=>
                            FullScreen(
                              imageUrl:result.urls!.raw,
                              color:appUtils.colorFromHex(result.color.toString()),
                            )));
                      },
                      child: Container(
                        height: 350,
                        width: SC.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: appUtils.colorFromHex(result.color!),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(result.urls!.regular,))
                        ),

                      ),
                    ),
                  ],
                ),
              );
            }else{
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}