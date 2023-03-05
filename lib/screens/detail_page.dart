import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesui/components/defaultElemants.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DefaultElements.kdefaultbgcolor,
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              buildAppBar(),
              showpersentage
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
                      padding: const EdgeInsets.only(right: 25.0),
                    ),
              SizedBox(
                height: 20,
              ),
              buildShoeShowcase(context),
            ],
          ),
        ),
      ),
    );
  }

  buildShoeShowcase(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.75,
          decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: showcasebgcolor,
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
                    color: showcasebgcolor,
                    width: 2,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.75,
                  decoration: BoxDecoration(
                    color: showcasebgcolor,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.75,
                      decoration: BoxDecoration(
                        color: lightShowcasebgcolor,
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
            tag: shoeimage,
            child: Image.asset(
              "$shoeimage",
              height: 100,
            ),
          ),
        )
      ],
    );
  }
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
