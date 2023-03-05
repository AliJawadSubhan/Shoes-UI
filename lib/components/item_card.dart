import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoesui/components/defaultElemants.dart';
import 'package:shoesui/models/shoe_model/shoe_list.dart';
import 'package:shoesui/models/shoe_model/shoe_model.dart';
import 'package:shoesui/screens/detail_page.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.shoeList,
    required this.press,
    required this.index,
  }) : super(key: key);

  final ShoeListModel shoeList;
  final Function press;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      activeheart: shoeList.activeheart,
                      shoeimage: shoeList.shoeimage,
                      shoeName: shoeList.shoeName,
                      showcasebgcolor: shoeList.showcasebgcolor,
                      showpersentage: shoeList.showpersentage,
                      rating: shoeList.rating,
                      price: shoeList.price,
                      persentage: shoeList.persentage,
                      lightShowcasebgcolor: shoeList.lightShowcasebgcolor,
                    ),
                  ));
              print('Navigate to detail page');
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: DefaultElements.knavbariconcolor,
                    offset: Offset(0, -1),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        shoeList.showpersentage
                            ? Container(
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: DefaultElements.ksecondrycolor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text(
                                    "30%",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              )
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            height: 30,
                            width: 50,
                            decoration: BoxDecoration(
                              color: shoeList.activeheart
                                  ? DefaultElements.kdefaultredcolor
                                  : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/icons/heart.svg",
                                height: 20,
                                color: shoeList.activeheart
                                    ? Colors.white
                                    : DefaultElements.knavbariconcolor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: shoeList.showcasebgcolor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: shoeList.showcasebgcolor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              )),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 5,
                        left: 0,
                        child: Hero(
                          tag: shoeList.shoeimage,
                          child: Image.asset(
                            shoeList.shoeimage,
                            height: 60,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    shoeList.shoeName,
                    style: const TextStyle(
                      color: DefaultElements.kprimarycolor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    shoeList.price,
                    style: const TextStyle(
                      color: DefaultElements.kprimarycolor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
