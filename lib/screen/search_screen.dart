import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/controller/photo_controller.dart';
import 'package:wallpaper/style/color.dart';
import 'package:wallpaper/style/fonts.dart';
import 'package:wallpaper/widget/photo_list.dart';

import '../repository/response/status.dart';
import '../widget/error_widget.dart';
import '../widget/loading_shimmer.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  @override
  Widget build(BuildContext context) {
    final controller=Provider.of<PhotoController>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor.bg,
        elevation: 0,
        centerTitle: true,
        title: TextField(
          autofocus: true,
          onChanged: (value){
            setState(() {
              controller.query=value;
              controller.FetchQueryController();
            });
          },
          style:appFont.medium.copyWith(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle:appFont.medium.copyWith(color: Colors.white),
            border: InputBorder.none
          ),
        ),
        actions: [],
      ),
      body:controller.query.isEmpty? Center(child: Text("No Search Result"),): Consumer<PhotoController>(builder: (_,controller,child){
        switch(controller.statusApp){
          case StatusApp.LOADING:
            return LoadingListShimmer();
          case StatusApp.ERROR:
            if(controller.error.trim()=="No Internet".trim()){
              return NoInternetError(onTap: () {
                controller.FetchPhotoController();
              },);
            }
            else{
              return GeneralError(onTap: (){
                controller.FetchPhotoController();
              });
            }
          case StatusApp.COMPLETE:
            return PhotoView(controller: controller);
        }
      }),
    );
  }
}
