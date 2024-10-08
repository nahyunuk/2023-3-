import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pratice_2023_3/Home/integrationHome.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
List recentSearches =["삼","백","집","삼백","백집","삼집","검색어","검색어","검색어","검색어"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "검색",
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text("검색어"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.blueAccent,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blueAccent,
                      width: 1,
                    )),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blueAccent,
                      width: 1,
                    ))),
              ),
            ),
          ),
          text("최근 검색어"),
          SizedBox(
            height: 120,
            width: MediaQuery.of(context).size.width,
            child: GridView.count(
              crossAxisCount: 4,
              childAspectRatio: 3 / 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
                shrinkWrap: false,
              children:List.generate(10, (Index){
                return recentBox(recentSearches[Index]);
              }),
            ),
          ),
          text("최근에 본 백년가게"),
          SizedBox(
            height: 190,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10.0,
              ),
              itemCount: 20,
              itemBuilder: (context,index){
                return Column(
                    children: [
                      Container(
                        height: 90,
                        width:170,
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
                                },
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
                            padding: const EdgeInsets.only(left: 16,top: 4),
                            child: Text("삼백집",style: TextStyle(color: Colors.blueAccent,fontSize: 14,fontWeight: FontWeight.w600),),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("주차장",style: TextStyle(fontSize: 13,color: Colors.blueAccent,fontWeight: FontWeight.w600),),
                            Text("예약",style:TextStyle(fontSize: 11,color: Colors.grey,fontWeight: FontWeight.w600)),
                            Text("포장",style:TextStyle(fontSize: 11,color: Colors.grey,fontWeight: FontWeight.w600)),
                            Text("장예인편의",style: TextStyle(fontSize: 13,color:Colors.blueAccent,fontWeight: FontWeight.w600)),
                          ],
                        ),
                      )
                    ],
                );
              },
            ),
          ),
          text("AI 기반 추천 백년가게"),
          SizedBox(
            height: 190,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10.0,
              ),
              itemCount: 20,
              itemBuilder: (context,index){
                return Column(
                    children: [
                      Container(
                        height: 90,
                        width:170,
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
                                },
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
                            padding: const EdgeInsets.only(left: 16,top: 4),
                            child: Text("삼백집",style: TextStyle(color: Colors.blueAccent,fontSize: 14,fontWeight: FontWeight.w600),),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("주차장",style: TextStyle(fontSize: 13,color: Colors.blueAccent,fontWeight: FontWeight.w600),),
                            Text("예약",style:TextStyle(fontSize: 11,color: Colors.grey,fontWeight: FontWeight.w600)),
                            Text("포장",style:TextStyle(fontSize: 11,color: Colors.grey,fontWeight: FontWeight.w600)),
                            Text("장예인편의",style: TextStyle(fontSize: 13,color:Colors.blueAccent,fontWeight: FontWeight.w600)),
                          ],
                        ),
                      )
                    ],
                );
              },
            ),
          ),

        ],
      ),
    );
  }
  Padding recentBox(text){
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 40,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.blueAccent,
            width: 1,
          )
        ),
        child: Center(child: Text(text + "  X",style: TextStyle(color: Colors.blueAccent,fontSize: 16,fontWeight: FontWeight.w600),)),
      ),
    );
  }
  Padding text(text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
