import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class TapItemModel{
  TapItemModel({
  required this.stateMachine,required this.artboard,this.status
});
  UniqueKey?id =UniqueKey();
  String stateMachine;
  String artboard;
  late SMIBool?status;
  static List<TapItemModel>tapItemList=[
    TapItemModel(stateMachine: 'CHAT_Interactivity', artboard: 'CHAT'),
    TapItemModel(stateMachine: 'SEARCH_Interactivity', artboard: 'SEARCH'),
    TapItemModel(stateMachine: 'TIMER_Interactivity', artboard: 'TIMER'),
    TapItemModel(stateMachine: 'BELL_Interactivity', artboard: 'BELL'),
    TapItemModel(stateMachine: 'USER_Interactivity', artboard: 'USER')

  ];
}