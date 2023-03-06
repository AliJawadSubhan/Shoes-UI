import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesui/components/defaultElemants.dart';

class Details extends StatefulWidget {
  Details(
      {Key? key,
      required this.shoeimage,
      required this.persentage,
      required this.shoeName,
      required this.price,
      required this.rating,
      required this.showpersentage,
      required this.activeheart,
      required this.showcasebgcolor,
      required this.lightShowcasebgcolor})
      : super(key: key);
  int selectedIndex = 0;
  int selectedColorIndex = 0;
  List<String> shoeSize = [
    "US 6"
        "US 7"
        "US 8"
        "US 9"
        "US 10"
  ];
  final String shoeimage;
  final String persentage;
  final String shoeName;
  final String price;
  final String rating;
  final bool showpersentage;
  final bool activeheart;
  final Color showcasebgcolor;
  final Color lightShowcasebgcolor;
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DefaultElements.kdefaultbgcolor,
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              buildAppBar(),
              widget.showpersentage
                  ? Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Container(
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
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ),
                    )
                  : const Padding(
                      padding: EdgeInsets.only(right: 25.0),
                    ),
              const SizedBox(
                height: 20,
              ),
              buildShoeShowcase(context),
              Expanded(
                child: buildPriceSectionArea(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildPriceSectionArea(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.3,
      decoration: BoxDecoration(
          color: Color(0xffF7F7F7),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
                color: DefaultElements.knavbariconcolor,
                offset: Offset(0, -1),
                blurRadius: 2),
          ]),
      child: Padding(
        padding: EdgeInsets.only(top: 30, right: 30, left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.shoeName}",
                  style: TextStyle(
                    fontSize: 30,
                    color: DefaultElements.kprimarycolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 30,
                      color: Color(0xffFDD446),
                    ),
                    Text(
                      "${widget.rating}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Built for natural motion, the Nike Flex Shoes",
              style: TextStyle(
                fontSize: 18,
                color: DefaultElements.kprimarycolor,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "Size:",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.35,
                  child: Center(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: widget.shoeSize.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                widget.selectedIndex = index;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              primary: widget.selectedIndex == index
                                  ? DefaultElements.ksecondrycolor
                                  : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                widget.shoeSize[index],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Available Color:",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Center(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2, vertical: 12),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.selectedColorIndex = index;
                                });
                              },
                              child: Container(
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: widget.selectedColorIndex == index
                                      ? DefaultElements
                                          .kshoerepplecolorOptions[index]
                                      : Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: DefaultElements
                                          .kshoecolorOptions[index],
                                    ),
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildShoeShowcase(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.75,
            decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.showcasebgcolor,
                  width: 2,
                )),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.75,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: widget.showcasebgcolor,
                      width: 2,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.75,
                    decoration: BoxDecoration(
                      color: widget.showcasebgcolor,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2.75,
                        decoration: BoxDecoration(
                          color: widget.lightShowcasebgcolor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 80,
            left: 50,
            bottom: 0,
            child: Hero(
              tag: widget.shoeimage,
              child: Image.asset(
                widget.shoeimage,
                height: 100,
              ),
            ),
          )
        ],
      ),
    );
  }

  buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.arrow_back_ios_new,
              size: 25,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "X",
                    style: TextStyle(
                      color: DefaultElements.kprimarycolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                  TextSpan(
                    text: "E",
                    style: TextStyle(
                      color: DefaultElements.ksecondrycolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
              width: 50,
              decoration: const BoxDecoration(
                color: DefaultElements.kdefaultredcolor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/heart.svg",
                  height: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
