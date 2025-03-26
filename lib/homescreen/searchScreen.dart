import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    const data = [
      {'name': 'Education'},
      {'name': 'Food'},
      {'name': 'Old age homes'},
      {'name': 'Organs'},
    ];

    return Scaffold(
      backgroundColor: Colors.white, 
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white, 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(w * 0.05, w * 0.15, w * 0.05, w * 0.06),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(w * 0.04),
                    child: Image.asset(
                      "assets/icons/search_icon.png",
                      color: Colors.black,
                      fit: BoxFit.contain,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(w * 0.05, 0, w * 0.05, w * 0.05),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Donation Campaigns',
                  style: TextStyle(
                    fontSize: w * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: w * 0.03, 
                  runSpacing: h * 0.016,
                  children: data.map((item) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: h * 0.03, vertical: w * 0.03),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0XFFC9C9C9), width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        item['name']!,
                        style: TextStyle(
                          fontSize: w * 0.038,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
