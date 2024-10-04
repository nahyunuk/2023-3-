import 'package:flutter/material.dart';
import 'package:pratice_2023_3/Home/integrationHome.dart';

class Bakyungage extends StatefulWidget {
  const Bakyungage({super.key});

  @override
  State<Bakyungage> createState() => _BakyungageState();
}

class _BakyungageState extends State<Bakyungage> {
  List<bool> likesList = List.generate(8, (index) => false);

  void toggleLike(int index) {
    setState(() {
      likesList[index] = !likesList[index]; // 해당 카드의 like 상태 반전
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 스크롤 가능한 영역
          Column(
            children: [
              SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "전국의 백년가게 목록",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "전국의 1348개의 백년가게",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.blueAccent),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // 모서리 둥글기
                          ),
                        ),
                        child: Text(
                          "필터",
                          style: TextStyle(color: Colors.blueAccent),
                        )),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 0.8,
                  child: Container(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: List.generate(8, (index) {
                    return Column(
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
                                  onPressed: () {
                                    toggleLike(index);
                                  },
                                  icon: likesList[index]
                                      ? Icon(Icons.favorite)
                                      : Icon(Icons.favorite_border_outlined),
                                  color: likesList[index]? Colors.blueAccent:Colors.grey ,
                                ),
                              ),
                            ],
                          ),
                        ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16,top: 4),
                                  child: Text("삼백집",style: TextStyle(color: Colors.blueAccent,fontSize: 16,fontWeight: FontWeight.w600),),
                                ),
                              ],
                            ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16,top: 2),
                              child: Text("전라남도 순천시 연향동 삼백집",overflow: TextOverflow.fade,style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.w600),)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("주차장",style: TextStyle(fontSize: 14,color: Colors.blueAccent,fontWeight: FontWeight.w600),),
                              Text("예약",style:TextStyle(color: Colors.grey,fontWeight: FontWeight.w600)),
                              Text("포장",style:TextStyle(color: Colors.grey,fontWeight: FontWeight.w600)),
                              Text("장예인편의",style: TextStyle(fontSize: 14,color:Colors.blueAccent,fontWeight: FontWeight.w600)),
                            ],
                          ),
                        )
                      ],
                    );
                  }),
                ),
              )
            ],
          ),
          Container(
            color: Colors.blueAccent,
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IntegrationHome()));
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "백년가게",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 48),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
