import 'package:flutter/material.dart';
import 'package:pratice_2023_3/Home/integrationHome.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}


class _SettingPageState extends State<SettingPage> {

  final Uri _homePageUrl = Uri.parse('https://www.sbiz.or.kr/hdst/');
  final Uri _smallStoreUrl =
  Uri.parse('https://semas.or.kr/');
  final Uri _24Url = Uri.parse(
      'https://www.k-startup.go.kr/');
  final Uri _kStartUrl =
  Uri.parse('https://sminfo.mss.go.kr/');

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
          "설정",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "설정 및 기타",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueAccent),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0,left: 8.0),
            child: line(),
          ),
          settings("사용자 정보", (){}),
          settings("앱 초가화", (){}),
          settings("개인정보 수집 및 이용", (){}),
          settings("이용약관 동의", (){}),
          settings("오픈소스 활용 안내", (){}),
          settings("백년가게 홈페이지", (){launchUrl(_homePageUrl);}),
          settings("소상공인시장진흥공단 홈페이지", (){launchUrl(_smallStoreUrl);}),
          settings("중소배쳐 24 홈페이지", (){launchUrl(_24Url);}),
          settings("k-스타트업 홈페이지", (){launchUrl(_kStartUrl);}),
          settings("중소시업현황정보시스템", (){}),
        ],
      ),
    );
  }

  Container line() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 0.3,
      color: Colors.black.withOpacity(0.3),
    );
  }

  Padding settings(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.7)),
              ),
              IconButton(onPressed : onPressed, icon: Icon(Icons.arrow_forward)),
            ],
          ),
          line(),
        ],
      ),
    );
  }
}
