import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:adhisree_foundation/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Otpscreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<Otpscreen> {
  final List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.all(width * 0.02),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0XFFEFEEEE),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: Colors.black, size: width * 0.05),
              ),
            ),
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Color.fromARGB(255, 181, 233, 240),
            ], begin: Alignment.topCenter, end: Alignment.bottomRight)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.05 ),
                  Text(
                    'We Just send you an SMS',
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: width*0.07,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    'Enter the security code we sent to',
                    style: TextStyle(
                      color: Color(0XFF747272),
                      fontSize: width * 0.04
                    ),
                  ),
                  Text(
                    '***123',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: Color(0XFF747272),
                    ),
                  ),
                  SizedBox(height: height * 0.03 ),

                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(6, (index) {
                      return Container(
                        width: width * 0.12,
                        margin: EdgeInsets.symmetric(horizontal: width * 0.01),
                        child: TextFormField(
                          controller: _controllers[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          style: TextStyle(fontSize: width * 0.04, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 5) {
                              FocusScope.of(context).nextFocus();
                            } else if (value.isEmpty && index > 0) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                        ),
                      );
                    }),
                  ),

                  SizedBox(height: height * 0.05 ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child : CustomButton(text: 'confirm', onPressed: () => Navigator.pushNamed(context, AppRoutes.mainScreen))
                  ),

                  SizedBox(height:  height * 0.03),

                  Text(
                    'Didn`t received a code ?',
                    style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.04,
                    ),
                  )

                ],
              ),
            )));
  }
}
