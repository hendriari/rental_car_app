import 'package:flutter/material.dart';
import 'package:rent_app/model/add_item.dart';
import 'package:rent_app/model/item_bus.dart';

class SingletonModel {
  static final SingletonModel _singleton = SingletonModel._internal();

  factory SingletonModel(){
    return _singleton;
  }

  SingletonModel._internal();

  static SingletonModel withContext(BuildContext context){
    _singleton.context = context;
    return _singleton;
  }

  static SingletonModel get shared => _singleton;

  late BuildContext? context;
  List<AddItem>? addItem;
  List<AddItemBus>? addItemBus;
}