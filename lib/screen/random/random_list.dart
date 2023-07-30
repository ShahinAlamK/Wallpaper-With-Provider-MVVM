import 'package:flutter/material.dart';

import '../../controller/random_controller.dart';
import '../../model/random_model.dart';
import '../../widget/photo_card.dart';

class RandomListView extends StatelessWidget {
  const RandomListView({super.key, required this.controller});
  final RandomController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: controller.scrollController,
        physics: BouncingScrollPhysics(),
        itemCount:controller.randomList.length+1,
        itemBuilder: (BuildContext context, int index) {
          if(index<controller.randomList.length){
            RandomModel randomModel=RandomModel.fromJson(controller.randomList[index]);
            return PhotoCard(photo: randomModel);
          }else{
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}