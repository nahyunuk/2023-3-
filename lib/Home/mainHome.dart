import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pratice_2023_3/Home/bakyungage.dart';

class Mainhome extends StatefulWidget {
  const Mainhome({super.key});

  @override
  State<Mainhome> createState() => _MainhomeState();
}

final Uri _urlHome = Uri.parse('https://www.sbiz.or.kr/hdst/');
final Uri _urlVideo =
    Uri.parse('https://www.sbiz.or.kr/hdst/board/boardList.do?boardCd=VIDEO');
final Uri _urlBest = Uri.parse(
    'https://www.sbiz.or.kr/hdst/board/boardList.do?boardCd=GOODEXAMPLE');
final Uri _urlFAQ =
    Uri.parse('https://www.sbiz.or.kr/hdst/board/boardList.do?boardCd=FAQ');

Future<void> _launchUrl(Uri _url) async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

class _MainhomeState extends State<Mainhome> {
  late final PageController _pageController;
  ScrollController _scrollController = ScrollController(initialScrollOffset: 2);
  var height = 200.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {}); // 스크롤 위치가 변할 때마다 UI를 업데이트
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: _scrollController.hasClients &&
                          _scrollController.offset > 1
                      ? 100
                      : 200,
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: TextButton(
                          onPressed: () {
                            _launchUrl(_urlHome);
                          },
                          child: Text(
                            '2023년 백년가게 신청',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: Colors.blueAccent),
                          ))),
                ),
                Container(
                  color: Colors.grey.shade100,
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Text(
                          "· 전국의 백년가게",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 313,
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: (int index) {
                            setState(() {
                              if (index == 4) {
                                _pageController.jumpToPage(1);
                              }
                              if (index == 0) {
                                _pageController.jumpToPage(3);
                              }
                            });
                          },
                          children: [
                            StoreBox(
                                Image.asset(
                                  'assets/images/3.png',
                                ),
                                "제천 식육점"),
                            StoreBox(
                                Image.asset(
                                  'assets/images/1.png',
                                ),
                                "제일 스포츠"),
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    "· 업종별 백년가게",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Industry("건설업"),
                          Industry("농업"),
                          Industry("도소매업"),
                          Industry("서비스업"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Industry("숙박업"),
                          Industry("음식점업"),
                          Industry("제조업"),
                          Industry("축산업"),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.lightBlue.shade50.withOpacity(0.5),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Text(
                          "· 바로가기",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Barogagi("홍보영상", _urlVideo),
                          Barogagi("우수사례", _urlBest),
                          Barogagi("FAQ", _urlFAQ)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height:
                  _scrollController.hasClients && _scrollController.offset > 1
                      ? 100
                      : 200,
              width: MediaQuery.of(context).size.width,
              color: Colors.blueAccent,
              child: Image.asset(
                'assets/images/LLSB_BI2.png',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container StoreBox(Image StoreImage, String StoreTitle) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: Center(
              child: StoreImage,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              StoreTitle,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.blueAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column Storetype(String StoreType) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.lightBlue.shade50.withOpacity(0.5),
          ),
          child: Center(
            child: Icon(
              Icons.image_outlined,
              color: Colors.blueAccent,
            ),
          ),
        ),
        Text(
          StoreType,
          style: TextStyle(fontSize: 16, color: Colors.blue.shade600),
        )
      ],
    );
  }

  GestureDetector Barogagi(String detail, Uri _url) {
    return GestureDetector(
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          border: Border.all(
            color: Colors.blueAccent, // 윤곽선 색상
            width: 0.5,
          ),
        ),
        child: Center(
          child: Text(detail),
        ),
      ),
      onTap: () async {
        await _launchUrl(_url);
      },
    );
  }
  Expanded Industry (String Industry){
    return  Expanded(
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Bakyungage()));
            },
            child: Storetype(Industry)));
  }

}
