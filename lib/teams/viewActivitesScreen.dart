import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Viewactivitesscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    const textData = [
      {'text': 'Attend morning meetings 8:30 to 9:30  .'},
      {'text': 'Participate in donation with only ID card'},
      {
        'text':
            'Earn rewards through referrals and withdraw your earnings easily.'
      },
      {'text': 'Get instant joining confirmation with lifetime validity.'},
      {'text': ' Participate in meaningful social work and events.'},
      {
        'text':
            'Receive a personalized visiting card for professional networking.'
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'volunteer tasks',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: width * 0.1, // Add top padding
          left: width * 0.04,
          right: width * 0.04,
        ),
        child: Column(
          children: textData
              .map(
                (item) => Padding(
                  padding: EdgeInsets.symmetric(vertical: width * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/Png/Arrow.png',
                        width: width * 0.1,
                      ),
                      SizedBox(width: width * 0.02),
                      Expanded(
                        child: Text(
                          item['text']!,
                          style: TextStyle(
                            fontSize: width * 0.035,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
