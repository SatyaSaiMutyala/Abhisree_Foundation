// import 'dart:async';

// import 'package:adhisree_foundation/controllers/userController.dart';
// import 'package:adhisree_foundation/utils/customButton.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// class Otpscreen extends StatefulWidget {
//   @override
//   _OtpScreenState createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<Otpscreen> {
//   final UserController userController = Get.put(UserController());

//   final List<TextEditingController> _controllers =
//       List.generate(6, (index) => TextEditingController());
//   String phoneNumber = '';
//   Timer? _timer;
//   int _start = 120;
//   bool _canResend = false;

//   @override
//   void initState() {
//     super.initState();
//     phoneNumber = Get.arguments?['phoneNumber'] ?? '';
//     print('Phone Number Received: $phoneNumber');
//     startTimer();
//   }

//   void startTimer() {
//     _start = 120;
//     _canResend = false;
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       if (_start == 0) {
//         setState(() {
//           _canResend = true;
//         });
//         _timer?.cancel();
//       } else {
//         setState(() {
//           _start--;
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   void resendOtp() {
//     userController.submitUserData('register', {'phone_number': phoneNumber});
//     startTimer();
//     Get.snackbar("OTP Sent", "A new OTP has been sent to your number.");
//   }

//   String getMaskedPhone() {
//     if (phoneNumber.length >= 4) {
//       return '**** ${phoneNumber.substring(phoneNumber.length - 4)}';
//     }
//     return '****';
//   }

//   void verifyOtp() {
//     String otp = _controllers.map((c) => c.text).join();
//     if (otp.length == 6) {
//       userController.verifyOtp(phoneNumber, otp);
//     } else {
//       Get.snackbar("Error", "Please enter a valid 6-digit OTP");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: Padding(
//             padding: EdgeInsets.all(width * 0.02),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Color(0XFFEFEEEE),
//                 shape: BoxShape.circle,
//               ),
//               child: IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: Icon(Icons.arrow_back,
//                     color: Colors.black, size: width * 0.05),
//               ),
//             ),
//           ),
//         ),
//         body: Container(
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [
//               Colors.white,
//               Colors.white,
//               Colors.white,
//               Colors.white,
//               Colors.white,
//               Color.fromARGB(255, 181, 233, 240),
//             ], begin: Alignment.topCenter, end: Alignment.bottomRight)),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SizedBox(height: height * 0.05),
//                   Text(
//                     'We Just sent you an SMS',
//                     style: TextStyle(
//                         fontSize: width * 0.07, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: height * 0.01),
//                   Text(
//                     'Enter the security code we sent to',
//                     style: TextStyle(
//                         color: Color(0XFF747272), fontSize: width * 0.04),
//                   ),
//                   Text(
//                     getMaskedPhone(),
//                     style: TextStyle(
//                         fontSize: width * 0.04,
//                         color: Color(0XFF747272),
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: height * 0.03),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: List.generate(6, (index) {
//                       return Container(
//                         width: width * 0.12,
//                         margin: EdgeInsets.symmetric(horizontal: width * 0.01),
//                         child: TextFormField(
//                           controller: _controllers[index],
//                           textAlign: TextAlign.center,
//                           keyboardType: TextInputType.number,
//                           maxLength: 1,
//                           style: TextStyle(
//                             fontSize: width * 0.04,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           decoration: InputDecoration(
//                             counterText: '',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           inputFormatters: [
//                             FilteringTextInputFormatter.digitsOnly
//                           ],
//                           onTap: () async {
//                             ClipboardData? data =
//                                 await Clipboard.getData(Clipboard.kTextPlain);
//                             if (data != null && data.text != null) {
//                               String text = data.text!.trim();
//                               if (text.length == 6 &&
//                                   RegExp(r'^\d{6}$').hasMatch(text)) {
//                                 for (int i = 0; i < 6; i++) {
//                                   _controllers[i].text = text[i];
//                                 }
//                                 FocusScope.of(context)
//                                     .unfocus();
//                               }
//                             }
//                           },
//                           onChanged: (value) {
//                             if (value.isNotEmpty && index < 5) {
//                               FocusScope.of(context).nextFocus();
//                             } else if (value.isEmpty && index > 0) {
//                               FocusScope.of(context).previousFocus();
//                             }
//                           },
//                         ),
//                       );
//                     }),
//                   ),
//                   SizedBox(height: height * 0.05),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: width * 0.05),
//                     child: CustomButton(text: 'Confirm', onPressed: verifyOtp),
//                   ),
//                   SizedBox(height: height * 0.03),
//                   _canResend
//                       ? GestureDetector(
//                           onTap: resendOtp,
//                           child: Text(
//                             'Resend OTP',
//                             style: TextStyle(
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold,
//                               fontSize: width * 0.04,
//                             ),
//                           ),
//                         )
//                       : Text(
//                           'Resend in ${_start ~/ 60}:${(_start % 60).toString().padLeft(2, '0')}',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: width * 0.04,
//                             color: Colors.grey,
//                           ),
//                         ),
//                 ],
//               ),
//             )));
//   }
// }



import 'dart:async';
import 'package:adhisree_foundation/controllers/userController.dart';
import 'package:adhisree_foundation/utils/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Otpscreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<Otpscreen> with CodeAutoFill {
  final UserController userController = Get.put(UserController());
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());

  String phoneNumber = '';
  Timer? _timer;
  int _start = 120;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    phoneNumber = Get.arguments?['phoneNumber'] ?? '';
    print('Phone Number Received: $phoneNumber');
    getAppSignature();
    startTimer();
    listenForCode(); 
  }

  void getAppSignature() async {
    String? signature = await SmsAutoFill().getAppSignature;
    print("App Signature: $signature");
  }

  void startTimer() {
    _start = 120;
    _canResend = false;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _canResend = true;
        });
        _timer?.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void resendOtp() {
    userController.submitUserData('register', {'phone_number': phoneNumber});
    startTimer();
    Get.snackbar("OTP Sent", "A new OTP has been sent to your number.");
  }

  String getMaskedPhone() {
    if (phoneNumber.length >= 4) {
      return '**** ${phoneNumber.substring(phoneNumber.length - 4)}';
    }
    return '****';
  }

  void verifyOtp() {
    String otp = _controllers.map((c) => c.text).join();
    if (otp.length == 6) {
      userController.verifyOtp(phoneNumber, otp);
    } else {
      Get.snackbar("Error", "Please enter a valid 6-digit OTP");
    }
  }

  @override
  void codeUpdated() {
    final receivedCode = code ?? '';
    if (receivedCode.length == 6) {
      for (int i = 0; i < 6; i++) {
        _controllers[i].text = receivedCode[i];
      }
      FocusScope.of(context).unfocus();
      verifyOtp();
    }
  }

  @override
  void dispose() {
    cancel(); // Stop listening for SMS
    _timer?.cancel();
    super.dispose();
  }

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
              icon: Icon(Icons.arrow_back,
                  color: Colors.black, size: width * 0.05),
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
          ], begin: Alignment.topCenter, end: Alignment.bottomRight),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.05),
              Text(
                'We Just sent you an SMS',
                style: TextStyle(
                    fontSize: width * 0.07, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: height * 0.01),
              Text(
                'Enter the security code we sent to',
                style:
                    TextStyle(color: Color(0XFF747272), fontSize: width * 0.04),
              ),
              Text(
                getMaskedPhone(),
                style: TextStyle(
                    fontSize: width * 0.04,
                    color: Color(0XFF747272),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: height * 0.03),
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
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onTap: () async {
                        ClipboardData? data =
                            await Clipboard.getData(Clipboard.kTextPlain);
                        if (data != null && data.text != null) {
                          String text = data.text!.trim();
                          if (text.length == 6 &&
                              RegExp(r'^\d{6}$').hasMatch(text)) {
                            for (int i = 0; i < 6; i++) {
                              _controllers[i].text = text[i];
                            }
                            FocusScope.of(context).unfocus();
                          }
                        }
                      },
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
              SizedBox(height: height * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: CustomButton(text: 'Confirm', onPressed: verifyOtp),
              ),
              SizedBox(height: height * 0.03),
              _canResend
                  ? GestureDetector(
                      onTap: resendOtp,
                      child: Text(
                        'Resend OTP',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.04,
                        ),
                      ),
                    )
                  : Text(
                      'Resend in ${_start ~/ 60}:${(_start % 60).toString().padLeft(2, '0')}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.04,
                        color: Colors.grey,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
