import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesui/components/defaultElemants.dart';
import 'package:shoesui/components/item_card.dart';
import 'package:shoesui/models/category_model/category_list.dart';
import 'package:shoesui/models/shoe_model/shoe_list.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomNavBar(),
          backgroundColor: DefaultElements.kdefaultbgcolor,
          body: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildAppBar(),
                  buildProductSection(),
                  const SizedBox(
                    height: 15,
                  ),
                  buildCateogrySection(context),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.70,
                        ),
                        itemCount: shoeListModel.length,
                        itemBuilder: (context, index) {
                          return ItemCard(
                            index: index,
                            press: () {},
                            shoeList: shoeListModel[index],
                          );
                        }),
                  ))
                ],
              ),
            ],
          )),
    );
  }

  Widget buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              "assets/icons/menu.svg",
              height: 25,
            ),
            RichText(
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
            SvgPicture.asset(
              "assets/icons/search_icon.svg",
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductSection() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        top: 10,
        right: 25,
      ),
      child: Row(
        children: [
          const Text(
            "Our Products",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          const Text(
            "Sort by",
            style: TextStyle(
              color: DefaultElements.knavbariconcolor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_down,
            size: 15,
            color: DefaultElements.knavbariconcolor,
          )
        ],
      ),
    );
  }

  // function
  Widget buildCateogrySection(BuildContext context) {
    return SizedBox(
      height: 35,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: categoriesModel.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex == index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 120,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      selectedIndex == index
                          ? const BoxShadow(
                              color: DefaultElements.knavbariconcolor,
                              blurRadius: 10,
                              offset: Offset(0, -1),
                            )
                          : const BoxShadow(),
                    ],
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        categoriesModel[index].image.toString(),
                      ),
                      Text(
                        categoriesModel[index].title,
                        style: TextStyle(
                            color: selectedIndex != index
                                ? Colors.black
                                : DefaultElements.kprimarycolor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: DefaultElements.knavbariconcolor,
            blurRadius: 10,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset("assets/icons/home.svg",
              height: 30, color: DefaultElements.kprimarycolor),
          SvgPicture.asset("assets/icons/heart.svg",
              height: 30, color: DefaultElements.knavbariconcolor),
          Stack(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: DefaultElements.kprimarycolor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: DefaultElements.knavbariconcolor,
                      offset: Offset(0, -1),
                      blurRadius: 8.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SvgPicture.asset("assets/icons/cart.svg",
                      height: 30, color: DefaultElements.ksecondrycolor),
                ),
              ),
            ],
          ),
          SvgPicture.asset("assets/icons/list.svg",
              height: 30, color: DefaultElements.knavbariconcolor),
          SvgPicture.asset("assets/icons/person.svg",
              height: 30, color: DefaultElements.knavbariconcolor),
        ],
      ),
    );
  }
}
