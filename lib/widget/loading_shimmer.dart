import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wallpaper/style/size.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10,left: 10),
      child: GridView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 10),
          itemCount:20,
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Shimmer.fromColors(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white
            );
          }),
    );
  }
}


class LoadingListShimmer extends StatelessWidget {
  const LoadingListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10,left: 10),
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: 10),
          itemCount:20,
          itemBuilder: (BuildContext context, int index) {
            return Shimmer.fromColors(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10,left: 10,top: 2,bottom: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20,bottom: 10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 18,
                            backgroundColor: Colors.grey.shade300,),
                            SizedBox(width:10),
                            Expanded(
                              child: Container(
                                height: 10,
                                width: SC.width,
                                margin: EdgeInsets.only(right: SC.width!/2),
                                decoration: BoxDecoration(color: Colors.grey.shade200,borderRadius: BorderRadius.circular(30)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 350,
                        width: SC.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                ),
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white
            );
          }),
    );
  }
}