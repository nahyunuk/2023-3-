import 'package:flutter/material.dart';

class Simbol extends StatefulWidget {
  final PageController pageController;

  const Simbol({super.key, required this.pageController});

  @override
  State<Simbol> createState() => _SimbolState();
}

class _SimbolState extends State<Simbol> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox.expand(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                color: Colors.blueAccent,
                child: Center(
                  child: Text(
                    "백년가게",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 110),
                child: Center(child: Image.asset('assets/images/LLSB_BI.jpg')),
              ),

              Spacer(),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        circleIcons(Icons.circle),
                        circleIcons(Icons.circle_outlined),
                        circleIcons(Icons.circle_outlined),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        color: Colors.lightBlue.shade50,
                        width: MediaQuery.of(context).size.width,
                        height: 90,
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              widget.pageController.jumpToPage(2);
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(300, 40),
                                backgroundColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(3)))),
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding circleIcons(IconData iconData) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Icon(
        iconData,
        color: Colors.blueAccent,
        size: 30,
      ),
    );
  }
}
