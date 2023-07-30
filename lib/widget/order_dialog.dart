import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/style/fonts.dart';

import '../controller/random_controller.dart';
import '../style/size.dart';

List<String> OrderList=['Latest', 'Oldest', 'Popular'];
class OrderDialog extends StatefulWidget {
  const OrderDialog({super.key});

  @override
  State<OrderDialog> createState() => _OrderDialogState();
}
class _OrderDialogState extends State<OrderDialog> {

  int selectedOption=1;

  @override
  Widget build(BuildContext context) {
    final random=Provider.of<RandomController>(context,listen: false);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 210,
        padding: EdgeInsets.only(top:20,left:20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: EdgeInsets.only(left:15),
              child: Text("Sort By",style: appFont.large.copyWith(fontSize: SC.hz!*4),),
            ),
            SizedBox(height:8),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: List.generate(OrderList.length, (index){
                  return RadioListTile(
                    dense: false,
                    contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical:0),
                    visualDensity: VisualDensity(horizontal: -4,vertical: -2),
                    title: Text(OrderList[index]),
                    value:OrderList[index],
                    groupValue: random.order,
                    onChanged: (value) {
                      setState(() {
                        random.order=value!;
                        random.FetchRandomController();
                        Navigator.pop(context);
                      });
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}