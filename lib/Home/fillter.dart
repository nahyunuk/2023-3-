import 'package:flutter/material.dart';
import 'package:pratice_2023_3/Home/bakyungage.dart';

class Fillter extends StatefulWidget {
  const Fillter({super.key});

  @override
  State<Fillter> createState() => _FillterState();
}

class _FillterState extends State<Fillter> {
  final _cities = [
    '서울특별시',
    '대전광역시',
    '대구광역시',
    '부산광역시',
    '인천광역시',
    '울산광역시',
    '광주광역시'
  ];

  String _selectedCity = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedCity = _cities[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "시도 선택",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 16.0),
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
                border: OutlineInputBorder(), // 윤각선 추가
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent), // 선택되지 않은 상태의 윤각선 색상
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent), // 선택된 상태의 윤각선 색상
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
