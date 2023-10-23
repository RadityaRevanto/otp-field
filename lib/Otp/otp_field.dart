import 'package:flutter/material.dart';
import '../Berhasil/berhasil_view.dart';
import '../shared/shared/style.dart';

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
        child: const OtpScreen(),
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
  bool showErrorMessage = false;
  List<String> currentPin = ["", "", "", ""];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.transparent),
  );

  int pinIndex = 0;


  //Kode Otp Sementara
  String correctPin = "1234";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Container(
                  alignment: const Alignment(0, 0.5),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildSecurityText(),
                      const SizedBox(height: 40.0),
                      buildPinRow(),
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
                        pinIndexSetup("1");
                      },
                    ),
                    KeyboardNumber(
                      n: 2,
                      onPressed: (){
                        pinIndexSetup("2");
                      },
                    ),
                    KeyboardNumber(
                      n: 3,
                      onPressed: (){
                        pinIndexSetup("3");
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
                        pinIndexSetup("4");
                      },
                    ),
                    KeyboardNumber(
                      n: 5,
                      onPressed: (){
                        pinIndexSetup("5");
                      },
                    ),
                    KeyboardNumber(
                      n: 6,
                      onPressed: (){
                        pinIndexSetup("6");
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
                        pinIndexSetup("7");
                      },
                    ),
                    KeyboardNumber(
                      n: 8,
                      onPressed: (){
                        pinIndexSetup("8");
                      },
                    ),
                    KeyboardNumber(
                      n: 9,
                      onPressed: (){
                        pinIndexSetup("9");
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
                        pinIndexSetup("0");
                      },
                    ),
                    Container(
                      width: 60.0,
                      child: MaterialButton(
                        onPressed: (){
                          clearPin();
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

  pinIndexSetup(String text) {
    if (showErrorMessage) {
      pinOneController.clear();
      pinTwoController.clear();
      pinThreeController.clear();
      pinFourController.clear();
      pinIndex = 0;
      showErrorMessage = false;
    } else {
      if (pinIndex == 0) {
        pinIndex = 1;
      } else if (pinIndex < 4) {
        pinIndex++;
      }
      setPin(pinIndex, text);
      currentPin[pinIndex - 1] = text;

      if (pinIndex == 4) {
        String enteredPin = currentPin.join();
        if (enteredPin == correctPin) {
          print("Correct PIN entered: $enteredPin");
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BerhasilView(),));
        } else {
          print("Incorrect PIN entered: $enteredPin");
          showErrorMessage = true;
        }
      } else {
        showErrorMessage = false;
      }
    }
    setState(() {});
  }


  setPin(int n,String text){
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
    }
  }

  clearPin(){
    if(pinIndex == 0)
      pinIndex = 0;
    else if(pinIndex == 4){
      setPin(pinIndex, "");
      currentPin[pinIndex-1] = "";
      pinIndex--;
    } else {
      setPin(pinIndex, "");
      currentPin[pinIndex-1] = "";
      pinIndex--;
    }
  }

  buildPinRow() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PINNumber(
              outlineInputBorder: outlineInputBorder,
              textEditingController: pinOneController,
            ),
            PINNumber(
              outlineInputBorder: outlineInputBorder,
              textEditingController: pinTwoController,
            ),
            PINNumber(
              outlineInputBorder: outlineInputBorder,
              textEditingController: pinThreeController,
            ),
            PINNumber(
              outlineInputBorder: outlineInputBorder,
              textEditingController: pinFourController,
            ),
          ],
        ),
        SizedBox(height: 15,),
        if (showErrorMessage)
          Text(
            "Silahkan Coba Lagi",
            style: TextStyle(
              color: Colors.red,  // Atur warna teks sesuai keinginan
              fontSize: 16.0,  // Atur ukuran font sesuai keinginan
            ),
          ),
      ],
    );
  }

  buildSecurityText(){
    return Text(
      "Security Pin",
      style: TextStyle(
        color: Colors.black,
        fontSize: 21.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class PINNumber extends StatelessWidget {

  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;
  const PINNumber({super.key, required this.textEditingController, required this.outlineInputBorder});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      child: TextField(
          controller: textEditingController,
          enabled: false,
          obscureText: true, //true,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(16.0),
            // border: outlineInputBorder,
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