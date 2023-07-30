import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/controller/photo_controller.dart';
import 'package:wallpaper/controller/random_controller.dart';
import 'package:wallpaper/screen/search_screen.dart';
import 'package:wallpaper/style/color.dart';
import 'package:wallpaper/style/fonts.dart';
import 'package:wallpaper/style/size.dart';
import '../widget/order_dialog.dart';
import 'random/random_photo_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    final controller=Provider.of<PhotoController>(context,listen: false);
    final random=Provider.of<RandomController>(context,listen: false);
    //controller.FetchPhotoController();
    random.FetchRandomController();
    random.nextPage();
    controller.nextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor.bg,
        elevation: 0,
        centerTitle: true,
        title: Text("hd-WallPaper".toUpperCase()),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (_)=>SearchScreen()));
          }, icon:Icon(Icons.search,size: 30,))
        ],
      ),

      drawer: Drawer(
        child: Column(
          children: [
            Container(
                height: 200,
                width: SC.width,
                decoration: BoxDecoration(color: appColor.bg),
                child: DrawerHeader(child: Center(child:
                Text("hd-wallpaper".toUpperCase(),style:appFont.large.copyWith(
                  fontSize: SC.hz!*5,color: Colors.white
                ),)))),
            Expanded(child:ListView(
              padding: EdgeInsets.zero,
              children: [
                
                ListTile(
                  visualDensity: VisualDensity(horizontal: -4),
                  leading: Icon(Icons.filter_list),
                  title: Text("Sort By",style: appFont.medium.copyWith(fontSize: SC.hz!*4),),
                  onTap: (){
                  Navigator.pop(context);
                  showDialog(context: context, builder:(_)=>OrderDialog());
                },
                )
              ],
            ))
          ],
        ),
      ),
      
      
      body: Column(
        children: [
          RandomPhotoView(),
        ],
      ),
    );
  }
}



class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}
class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    final controller=Provider.of<PhotoController>(context,listen: false);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style:appFont.medium.copyWith(color: appColor.bg),
              onChanged: (value){
                if(value.isEmpty){
                  controller.RefreshFetchPhoto();
                }else{
                  setState(() {
                    controller.query=value;
                    controller.FetchQueryController();

                  });
                }
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal:15),
                hintText: "Search wallpaper",
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: appColor.bg),borderRadius: BorderRadius.circular(50),),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: appColor.bg),borderRadius: BorderRadius.circular(50),),
                filled: true,
                prefixIcon: Icon(Icons.search,size: 25,color: appColor.bg),

              ),
            ),
          ),
          SizedBox(width: 10,),
          Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle
              ),
              child: IconButton(onPressed: (){
                showDialog(context: context, builder:(_)=>OrderDialog());
              }, icon: Icon(Icons.filter_list)))
        ],
      ),
    );
  }
}






