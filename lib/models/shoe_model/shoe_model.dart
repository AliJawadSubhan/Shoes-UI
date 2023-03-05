import 'package:flutter/material.dart';

class ShoeListModel {
  String shoeimage;
  String persentage;
  String shoeName;
  String price;
  String rating;
  bool showpersentage;
  bool activeheart;
  Color showcasebgcolor;
  Color lightShowcasebgcolor;

  ShoeListModel({
   required  this.shoeimage,
    required this.persentage,
    required this.shoeName,
    required this.price,
    required this.rating,
    this.showpersentage = false,
    this.activeheart = false,
    required this.showcasebgcolor,
    required this.lightShowcasebgcolor,
  });
}