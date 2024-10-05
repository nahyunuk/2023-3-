import 'package:flutter/material.dart';

class Fillter extends StatefulWidget {
  const Fillter({super.key});

  @override
  State<Fillter> createState() => _FillterState();
}

class _FillterState extends State<Fillter> {
  List<bool> selectedType = List.generate(8, (index) => false);
  List<bool> selectedAmenities = List.generate(4, (index) => false);
  final _cities = [
    '서울특별시',
    '대전광역시',
    '대구광역시',
    '부산광역시',
    '인천광역시',
    '울산광역시',
    '광주광역시'
  ];
  final _gocido = [
    '1번 아이템',
    '2번 아이템',
    '3번 아이텝',
    '4번 아이템',
    '5번 아이텝',
  ];

  String _selectedCity = '';
  String _selected9 = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedCity = _cities[0];
      _selected9 = _gocido[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "필터",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close, size: 45, color: Colors.white)),
                ),
              ],
            ),
          ),
          buildText("시도 선택"),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: DropdownButtonFormField(
              value: _selectedCity,
              items: _cities
                  .map((e) => DropdownMenuItem(
                        value: e, // 선택 시 onChanged 를 통해 반환할 value
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCity = value!;
                });
              },
              style: TextStyle(color: Colors.blueAccent),
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
              ),
            ),
          ),
          buildText("구시군 선택"),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: DropdownButtonFormField(
              value: _selected9,
              items: _gocido
                  .map((a) => DropdownMenuItem(
                        value: a, // 선택 시 onChanged 를 통해 반환할 value
                        child: Text(a),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selected9 = value!;
                });
              },
              style: TextStyle(color: Colors.blueAccent),
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
              ),
            ),
          ),
          buildText("업종"),
          Row(
            children: [
              storetype("건설업", 0),
              storetype("농업", 1),
              storetype("도소매업", 2),
              storetype("서비스업", 3),
            ],
          ),
          Row(
            children: [
              storetype("숙박업", 4),
              storetype("음식점업", 5),
              storetype("제조업", 6),
              storetype("축산업", 7),
            ],
          ),
          buildText("편의시설"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Amenities("주차장", 0), Amenities("예약가능", 1)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Amenities("포장", 2), Amenities("장애인 편의", 3)],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              color: Colors.blueAccent.shade100.withOpacity(0.5),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        for (int i = 0; i < 8; i++) {
                          setState(() {
                            selectedType[i] = false;
                          });
                        }
                        for (int i = 0; i < 4; i++) {
                          setState(() {
                            selectedAmenities[i] = false;
                          });
                          setState(() {
                            _selected9 = _gocido[0];
                            _selectedCity = _cities[0];
                          });
                        }
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.blueAccent,
                            width: 0.3,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          "초기화",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {Navigator.pop(context);},
                    child: Container(
                      height: 40,
                      width: 190,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent.shade100,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          "필터 적용",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding buildText(String text) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Expanded storetype(String StoreType, int index) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedType[index] = !selectedType[index];
            });
          },
          child: Column(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: selectedType[index]
                      ? Colors.lightBlue.shade50.withOpacity(0.5)
                      : Colors.lightBlue.shade50.withOpacity(0.3),
                ),
                child: Center(
                  child: Icon(
                    Icons.image_outlined,
                    color: selectedType[index]
                        ? Colors.blueAccent
                        : Colors.blueAccent.shade100,
                  ),
                ),
              ),
              Text(
                StoreType,
                style: TextStyle(
                    fontSize: 16,
                    color: selectedType[index]
                        ? Colors.blue.shade600
                        : Colors.blue.shade600.withOpacity(0.5)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding Amenities(String Amenities, int index) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
          onTap: () {
            setState(() {
              selectedAmenities[index] = !selectedAmenities[index];
            });
          },
          child: Container(
            height: 40,
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: selectedAmenities[index]
                    ? Colors.lightBlue.shade50.withOpacity(0.5)
                    : Colors.white,
                border:
                    Border.all(color: Colors.blueAccent.shade100, width: 0.3)),
            child: Center(
              child: Text(
                Amenities,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          )),
    );
  }
}
