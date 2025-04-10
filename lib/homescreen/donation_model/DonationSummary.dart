import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/utils/routes.dart';
import 'package:flutter/material.dart';

class Donationsummary extends StatefulWidget {
  @override
  _DonationsummaryState createState() => _DonationsummaryState();
}

class _DonationsummaryState extends State<Donationsummary> {
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
        child:  Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: width * 0.03),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: double.infinity,
                    height: width * 0.5,
                    child: Image.asset(
                      'assets/images/Png/child.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Below Poverty Level students',
                  style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Basic School Kits for 5',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '₹ 1000',
                      textAlign: TextAlign.end, 
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
             Align( alignment: Alignment.centerLeft, child:Text('Donation Breakup' , style: TextStyle(fontSize: width * 0.04, fontWeight: FontWeight.bold),)),
             SizedBox(height: height * 0.01),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 4, child: Text('Donation', style: TextStyle(fontSize: width * 0.04, ),)),
                Expanded(flex: 1, child: Text('₹1000', style: TextStyle(fontSize: width * 0.04, ),)),
              ],
             ),
             SizedBox(height: height * 0.01),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 4, child: Text('GST', style: TextStyle(fontSize: width * 0.04, ),)),
                Expanded(flex: 1, child: Text('₹20', style: TextStyle(fontSize: width * 0.04, ),)),
              ],
             ),
             SizedBox(height: height * 0.01),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 4, child: Text('Platform fee', style: TextStyle(fontSize: width * 0.04, ),)),
                Expanded(flex: 1, child: Text('₹10', style: TextStyle(fontSize: width * 0.04, ),)),
              ],
             ),
             SizedBox(height: height * 0.02),
             Divider(color: Colors.grey,),
             SizedBox(height: height * 0.01),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 4, child: Text('Total', style: TextStyle(fontSize: width * 0.04, ),)),
                Expanded(flex: 1, child: Text('₹1030', style: TextStyle(fontSize: width * 0.04, ),)),
              ],
             ),
             Spacer(),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              child: CustomButton(text: 'PROCEED', onPressed: () => Navigator.pushNamed(context, AppRoutes.volunteerSummary)),
             ),
            ],
          ),
        ))
  );}
}
