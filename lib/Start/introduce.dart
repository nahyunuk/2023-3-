import 'package:flutter/material.dart';
import 'package:pratice_2023_3/Start/PageView.dart';
import 'package:pratice_2023_3/Start/backup.dart';

class Introduce extends StatefulWidget {
  final PageController pageController;

  const Introduce({super.key, required this.pageController});
  @override
  State<Introduce> createState() => _IntroduceState();
}

class _IntroduceState extends State<Introduce> {
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
              Image.asset("assets/images/LLSB_BI.jpg"),
              Text(
                "소개글을 정리하여 입력",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        circleIcons(Icons.circle_outlined),
                        circleIcons(Icons.circle),
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
                            onPressed: () { widget.pageController.jumpToPage(3);},
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(300, 40), // 최소 크기 설정
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
  Route _createRoute(){
    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => Backup(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin,end: end).chain(CurveTween(curve: curve),);
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(position: offsetAnimation,child: child);
    },
    );
  }
}
