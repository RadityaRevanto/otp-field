import 'package:flutter/material.dart';
import 'package:otp_field/shared/shared/style.dart';

import '../Berhasil/berhasil_view.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Styles.white,
        ),
        child: OtpScreen(),
      ),
    );
  }
}

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  List<String> currentOtp = ["", "", "", "", "", ""];

  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();
  TextEditingController pinFiveController = TextEditingController();
  TextEditingController pinSixController = TextEditingController();

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.transparent),
  );

  int otpIndex = 0;

  bool showErrorMessage = false;
  String correctOtp = "258036";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Expanded(
            child: Container(
              alignment: Alignment(0, 0.5),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildSecurityText(),
                  const SizedBox(height: 40.0),
                  buildOtpRow(),
                ],
              ),
            )),
        buildNumberPad(),
      ],
    ));
  }
  buildNumberPad(){
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    KeyboardNumber(
                      n: 1,
                      onPressed: (){
                        otpIndexSetup("1");
                      },
                    ),
                    KeyboardNumber(
                      n: 2,
                      onPressed: (){
                        otpIndexSetup("2");
                      },
                    ),
                    KeyboardNumber(
                      n: 3,
                      onPressed: (){
                        otpIndexSetup("3");
                      },
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    KeyboardNumber(
                      n: 4,
                      onPressed: (){
                        otpIndexSetup("4");
                      },
                    ),
                    KeyboardNumber(
                      n: 5,
                      onPressed: (){
                        otpIndexSetup("5");
                      },
                    ),
                    KeyboardNumber(
                      n: 6,
                      onPressed: (){
                        otpIndexSetup("6");
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    KeyboardNumber(
                      n: 7,
                      onPressed: (){
                        otpIndexSetup("7");
                      },
                    ),
                    KeyboardNumber(
                      n: 8,
                      onPressed: (){
                        otpIndexSetup("8");
                      },
                    ),
                    KeyboardNumber(
                      n: 9,
                      onPressed: (){
                        otpIndexSetup("9");
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 60.0,
                      child: MaterialButton(
                        onPressed: null,
                        child: SizedBox(),
                      ),
                    ),
                    KeyboardNumber(
                      n: 0,
                      onPressed: (){
                        otpIndexSetup("0");
                      },
                    ),
                    Container(
                      width: 60.0,
                      child: MaterialButton(
                        onPressed: (){
                          clearOtp();
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.0),
                        ),
                        child: Icon(
                          Icons.backspace,
                          color: Styles.g90,
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
        ),
      ),
    );
  }

  otpIndexSetup(String text){
    if (showErrorMessage) {
      pinOneController.clear();
      pinTwoController.clear();
      pinThreeController.clear();
      pinFourController.clear();
      pinFiveController.clear();
      pinSixController.clear();
      otpIndex = 0;
      showErrorMessage = false;
    } else {
      if(otpIndex == 0)
        otpIndex = 1;
      else if (otpIndex < 6)
        otpIndex++;
    }
    setOtp(otpIndex, text);
    currentOtp[otpIndex-1] = text;

    if (otpIndex == 6) {
      String enteredPin = currentOtp.join();
      if (enteredPin == correctOtp) {
        print("Correct PIN entered: $enteredPin");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BerhasilView(),));
      } else {
        print("Incorrect PIN entered: $enteredPin");
        showErrorMessage = true;
      }
    } else {
      showErrorMessage = false;
    }
    setState(() {

    });
  }

  setOtp(int n,String text){
    switch(n){
      case 1:
        pinOneController.text = text;
        break;
      case 2:
        pinTwoController.text = text;
        break;
      case 3:
        pinThreeController.text = text;
        break;
      case 4:
        pinFourController.text = text;
        break;
      case 5:
        pinFiveController.text = text;
        break;
      case 6:
        pinSixController.text = text;
        break;
    }
  }

  clearOtp(){
    if(otpIndex == 0)
      otpIndex = 0;
    else if(otpIndex == 6){
      setOtp(otpIndex, "");
      currentOtp[otpIndex-1] = "";
      otpIndex--;
    } else {
      setOtp(otpIndex, "");
      currentOtp[otpIndex-1] = "";
      otpIndex--;
    }
  }

  buildOtpRow() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OTPNumber(
              outlineInputBorder: outlineInputBorder,
              textEditingController: pinOneController,
            ),
            OTPNumber(
              outlineInputBorder: outlineInputBorder,
              textEditingController: pinTwoController,
            ),
            OTPNumber(
              outlineInputBorder: outlineInputBorder,
              textEditingController: pinThreeController,
            ),
            OTPNumber(
              outlineInputBorder: outlineInputBorder,
              textEditingController: pinFourController,
            ),
            OTPNumber(
              outlineInputBorder: outlineInputBorder,
              textEditingController: pinFiveController,
            ),
            OTPNumber(
              outlineInputBorder: outlineInputBorder,
              textEditingController: pinSixController,
            ),
          ],
        ),
        SizedBox(height: 15,),
        if (showErrorMessage)
          Text(
            "Silahkan Coba Lagi",
            style: TextStyle(
              color: Colors.red,
              fontSize: 16.0,
            ),
          ),
      ],
    );
  }

  buildSecurityText(){
    return Text(
      "Masukan OTP",
      style: TextStyle(
        color: Colors.black,
        fontSize: 21.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

}

class OTPNumber extends StatelessWidget {

  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;
  const OTPNumber({super.key, required this.textEditingController, required this.outlineInputBorder});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      child: TextField(
          controller: textEditingController,
          enabled: false,
          obscureText: false,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(16.0),
            border: outlineInputBorder,
            filled: true,
            fillColor: Colors.transparent,
          ),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21.0,
            color: Styles.g90,
          )
      ),
    );
  }
}

class KeyboardNumber extends StatelessWidget {
  final int n;
  final Function() onPressed;
  const KeyboardNumber({super.key, required this.n, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Styles.g30,
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        onPressed: onPressed,
        padding: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        height: 90.0,
        child: Text(
          "$n",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24 * MediaQuery.of(context).textScaleFactor,
            color: Styles.g90,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}