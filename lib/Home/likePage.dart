import 'package:flutter/material.dart';
import 'package:pratice_2023_3/Home/integrationHome.dart';
import 'package:url_launcher/url_launcher.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  final Uri _urlHome = Uri.parse('https://www.sbiz.or.kr/hdst/');

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "좋아요",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IntegrationHome(),
                ));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                children: List.generate(16, (index) {
                  return GestureDetector(
                    onTap: () {
                      _launchUrl(_urlHome);
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 110,
                          width: 170,
                          child: Stack(
                            children: [
                              Container(
                                color: Colors.lightBlue.shade50,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.image_outlined,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite),
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 4),
                              child: Text(
                                "삼백집",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 2),
                                child: Text(
                                  "전라남도 순천시 연향동 삼백집",
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "주차장",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text("예약",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600)),
                              Text("포장",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600)),
                              Text("장예인편의",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
