import 'package:shoesui/components/defaultElemants.dart';
import 'package:shoesui/models/shoe_model/shoe_model.dart';

List<ShoeListModel> shoeListModel = [
  ShoeListModel(
    showcasebgcolor: DefaultElements.kshoebgcolorpink,
    lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorpink,
    shoeimage: "assets/images/shoe1.png",
    persentage: "30%",
    shoeName: "Nike Air Max 20",
    price: "\$" + "240.00",
    rating: "(4.5)",
    showpersentage: true,
    activeheart: false,
  ),
  ShoeListModel(
    showcasebgcolor: DefaultElements.kshoebgcolorblue,
    lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorblue,
    shoeimage: "assets/images/shoe2.png",
    persentage: "30%",
    shoeName: "Excee Sneakers",
    price: "\$" + "260.00",
    rating: "(3.0)",
    showpersentage: false,
    activeheart: true,
  ),
  ShoeListModel(
    showcasebgcolor: DefaultElements.kshoebgcolorgreen,
    lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorgreen,
    shoeimage: "assets/images/shoe3.png",
    persentage: "30%",
    shoeName: "Air Max Motions 2",
    price: "\$" + "290.00",
    rating: "(3.0)",
    showpersentage: false,
    activeheart: false,
  ),
  ShoeListModel(
    showcasebgcolor: DefaultElements.kshoebgcoloryellow,
    lightShowcasebgcolor: DefaultElements.lightShowcasebgcoloryellow,
    shoeimage: "assets/images/shoe4.png",
    persentage: "40%",
    shoeName: "Leather Sneakers",
    price: "\$" + "270.00",
    rating: "(4.5)",
    showpersentage: true,
    activeheart: false,
  ),
];
