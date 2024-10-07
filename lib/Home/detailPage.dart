import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late final PageController _pageController;
  int _currentPage = 1; // 현재 페이지 인덱스를 저장하는 변수
  bool heart = false;
  final Uri _urlHome = Uri.parse('https://www.sbiz.or.kr/hdst/');
  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  void toggle() {
    setState(() {
      heart = !heart;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: Colors.blueAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "백년가게-삼백집",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(width: 48),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 350,
                    color: Colors.lightBlue.shade50,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 300,
                          child: PageView(
                            controller: _pageController,
                            onPageChanged: (int index) {
                              setState(() {
                                _currentPage = index; // 현재 페이지 인덱스를 갱신
                                if (index == 4) {
                                  _pageController.jumpToPage(1);
                                } else if (index == 0) {
                                  _pageController.jumpToPage(3);
                                }
                              });
                            },
                            children: [
                              StoreBox(
                                  Image.asset('assets/images/3.png'), "제천 식육점"),
                              StoreBox(
                                  Image.asset('assets/images/1.png'), "제일 스포츠"),
                              StoreBox(
                                  Image.asset('assets/images/2.jpg'), "협신 전자"),
                              StoreBox(
                                  Image.asset('assets/images/3.png'), "제천 식육점"),
                              StoreBox(
                                  Image.asset('assets/images/1.png'), "제천 식육점"),
                            ],
                          ),
                        ),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: '<------------------',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'SWIPE',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                                TextSpan(
                                  text: '------------------>',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.grey,
                          height: 27,
                          width: 57,
                          child: Center(
                            child: Text("$_currentPage / 3"),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(25)),
                          child: Icon(
                            Icons.image_outlined,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "삼백집",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "전라북도 전주시 완산구 전주객사2길 22 (고사",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        Center(
                            child: Icon(
                          Icons.share_outlined,
                          color: Colors.blueAccent,
                          size: 40,
                        ))
                      ],
                    ),
                  ),
                  line(),
                  subtext(
                      "백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 백년가게 소개 "),
                  line(),
                  maintext("업종"),
                  subtext("음식점업"),
                  line(),
                  maintext("선정년도"),
                  subtext("2022"),
                  line(),
                  maintext("창업일"),
                  subtext("1989-06-12"),
                  line(),
                  maintext("영업시간"),
                  subtext("06:00~22:00"),
                  line(),
                  maintext("연락처"),
                  subtext("063)284-2227"),
                  line(),
                  maintext("주소"),
                  subtext("전라북도 전주시 완산구 전주객사2길 22(고사동) 1층"),
                  line(),
                  maintext("홈페이지"),
                  subtext("http://www.300zip.com/"),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    color: Colors.lightBlue.shade50,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {
                              toggle();
                            },
                            icon: Icon(
                              heart
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              size: 50,
                              color: Colors.blueAccent,
                            )),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 45,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Center(
                                child: Text(
                              "지도",
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launchUrl(_urlHome);
                          },
                          child: Container(
                            height: 45,
                            width: 90,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Center(
                                child: Text(
                                  "홈페이지",
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 45,
                            width: 90,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Center(
                                child: Text(
                                  "연락하기",
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding maintext(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.7)),
      ),
    );
  }

  Padding subtext(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black.withOpacity(0.6)),
      ),
    );
  }

  Padding line() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 8),
      child: Container(
        height: 1,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey.withOpacity(0.2),
      ),
    );
  }

  Container StoreBox(Image storeImage, String storeTitle) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: SizedBox(
                height: 200,
                child: Center(
                  child: storeImage,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
