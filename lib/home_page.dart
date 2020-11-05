import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_universe/constants.dart';
import 'package:flutter_universe/data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Text(
                    'Explore',
                    style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 44,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.left,
                  ),
                  DropdownButton(
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'Solar System',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xffffffff),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
                    onChanged: (value) {},
                    icon: Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Image.asset('assets/drop_down_icon.png'),
                    ),
                    underline: SizedBox(),
                  )
                ],
              ),
            ),
            Container(
              height: 500,
              padding: const EdgeInsets.only(left: 32),
              child: Swiper(
                itemCount: planets.length,
                itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                layout: SwiperLayout.STACK,
                pagination: SwiperPagination(
                    builder:
                        DotSwiperPaginationBuilder(activeSize: 20, space: 8)),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 100),
                          Card(
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 80,
                                  ),
                                  Text(
                                    planets[index].name,
                                    style: TextStyle(
                                        fontFamily: 'Avenir',
                                        fontSize: 40,
                                        color: primaryTextColor,
                                        fontWeight: FontWeight.w900),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    'Solar System',
                                    style: TextStyle(
                                        fontFamily: 'Avenir',
                                        fontSize: 23,
                                        color: secondaryTextColor,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Know more',
                                        style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 18,
                                            color: const Color(0xff47455f),
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.left,
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: secondaryTextColor,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(planets[index].iconImage)
                    ],
                  );
                },
              ),
            )
          ],
        )),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
            color: navigationColor),
        padding: EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                icon: Image.asset('assets/menu_icon.png'), onPressed: () {}),
            IconButton(
                icon: Image.asset('assets/search_icon.png'), onPressed: () {}),
            IconButton(
                icon: Image.asset('assets/profile_icon.png'), onPressed: () {})
          ],
        ),
      ),
    );
  }
}
