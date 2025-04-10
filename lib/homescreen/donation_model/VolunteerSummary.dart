import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:flutter/material.dart';

class Volunteersummary extends StatefulWidget {
  @override
  _VolunteersummaryState createState() => _VolunteersummaryState();
}

class _VolunteersummaryState extends State<Volunteersummary> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text('Review Details'),
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
        child : Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: width * 0.07) ,
             child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 4,
                      child: Text(
                        'Volunteer Membership Entry fee',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        '₹1000',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueAccent,
                        ),
                      )),
                ],
              ),),
              SizedBox(height: height * 0.01),
              Text('AFTER Completion of payment , you will receive offer letter, id card and visiting card',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: width* 0.03,
              ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
             
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Donation Breakup',
                    style: TextStyle(
                        fontSize: width * 0.04, fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 4,
                      child: Text(
                        'Donation',
                        style: TextStyle(
                          fontSize: width * 0.04,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        '₹1000',
                        style: TextStyle(
                          fontSize: width * 0.04,
                        ),
                      )),
                ],
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 4,
                      child: Text(
                        'GST',
                        style: TextStyle(
                          fontSize: width * 0.04,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        '₹20',
                        style: TextStyle(
                          fontSize: width * 0.04,
                        ),
                      )),
                ],
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 4,
                      child: Text(
                        'Platform fee',
                        style: TextStyle(
                          fontSize: width * 0.04,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        '₹10',
                        style: TextStyle(
                          fontSize: width * 0.04,
                        ),
                      )),
                ],
              ),
              SizedBox(height: height * 0.02),
              Divider(
                color: Colors.grey,
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 4,
                      child: Text(
                        'Total',
                        style: TextStyle(
                          fontSize: width * 0.04,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        '₹1030',
                        style: TextStyle(
                          fontSize: width * 0.04,
                        ),
                      )),
                ],
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: CustomButton(text: 'PROCEED', onPressed: () {}),
              ),
            ],
          ),
        )),
  );}
}
