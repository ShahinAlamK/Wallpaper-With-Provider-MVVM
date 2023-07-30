import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/random_controller.dart';
import '../../repository/response/status.dart';
import '../../widget/error_widget.dart';
import '../../widget/loading_shimmer.dart';
import 'random_list.dart';



class RandomPhotoView extends StatefulWidget {
  const RandomPhotoView({super.key});

  @override
  State<RandomPhotoView> createState() => _RandomPhotoViewState();
}
class _RandomPhotoViewState extends State<RandomPhotoView> {
  @override
  Widget build(BuildContext context) {
    final random=Provider.of<RandomController>(context,listen: false);
    return  Expanded(
      child: Consumer<RandomController>(builder: (_,controller,child){
        print(controller.randomStatus);
        switch(controller.randomStatus){
          case StatusApp.LOADING:
            return LoadingListShimmer();
          case StatusApp.ERROR:
            if(controller.error.trim()=="No Internet".trim()){
              return NoInternetError(onTap: () {
                random.FetchRandomController();
              },);
            }
            else{
              return GeneralError(onTap: (){
                random.FetchRandomController();
              });
            }
          case StatusApp.COMPLETE:
            return RandomListView(controller: controller);
        }
      }),
    );
  }
}