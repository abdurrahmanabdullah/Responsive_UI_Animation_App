import 'package:flutter/cupertino.dart';
import 'package:ml_flutter_project/app/model/tap_item.dart';
import 'package:rive/rive.dart';

class MenuItemModel{
  MenuItemModel({
  this.id,this.title="",required this.riveIcon
  });
  UniqueKey?id =UniqueKey();

  String title;
  TapItemModel riveIcon;

  late SMIBool?status;
  static List<MenuItemModel>menuItemList=[
    MenuItemModel( title :"Home", riveIcon: TapItemModel(stateMachine: "Home_interactivity", artboard: "HOME")),
    MenuItemModel(title :"Search", riveIcon: TapItemModel(stateMachine: "SEARCH_Interactivity", artboard: "SEARCH")),
    MenuItemModel(title :"Favorites", riveIcon: TapItemModel(stateMachine: "STAR_Interactivity", artboard: "LIKE/STAR")),
    MenuItemModel( title :"Help",riveIcon: TapItemModel(stateMachine: "CHAT_Interactivity", artboard: "CHAT")),


  ];
  static List<MenuItemModel>menuItems2=[ MenuItemModel( title :"History",riveIcon: TapItemModel(stateMachine: "TIMER_Interactivity", artboard: "TIMER")),
    MenuItemModel( title :"Notification",riveIcon: TapItemModel(stateMachine: "BELL_Interactivity", artboard: "BELL")),
  ];
}