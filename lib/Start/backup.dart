import 'package:flutter/material.dart';
import 'package:pratice_2023_3/Home/mainHome.dart';
class Backup extends StatefulWidget {
  const Backup({super.key});

  @override
  State<Backup> createState() => _BackupState();
}

class _BackupState extends State<Backup> {
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
                "지원 내용을 정리하여 입력",
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
                        circleIcons(Icons.circle_outlined),
                        circleIcons(Icons.circle),
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
                            onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Mainhome())); },
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(300, 40), // 최소 크기 설정
                                backgroundColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(3)))),
                            child: Text(
                              '시작하기',
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
