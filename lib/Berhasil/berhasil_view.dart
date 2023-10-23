import 'package:flutter/material.dart';
import 'package:otp_field/Otp/otp_field.dart';
import 'package:otp_field/shared/shared/style.dart';

class BerhasilView extends StatefulWidget {
  const BerhasilView({super.key});

  @override
  State<BerhasilView> createState() => _BerhasilViewState();
}

class _BerhasilViewState extends State<BerhasilView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25.0,
              ),
              Center(
                child: Container(
                  height: 290,
                  width: 283,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://img.freepik.com/free-vector/product-quality-concept-illustration_114360-7301.jpg?size=626&ext=jpg&ga=GA1.1.1753521837.1696602171&semt=sph",
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        8.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Text(
                "Mendaftar Berhasil",
                style: Styles.txt24w600,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Data Anda telah terdaftar dalam aplikasi kami. \nSilakan masuk menggunakan nama, email, atau \nnomor HP",
                style: Styles.txt12w400,
              ),
              const SizedBox(
                height: 60.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffA91D1D),
                      Color(0xffFF2C2C),
                      Color(0xff000000)
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors
                        .transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OtpView(),));
                  },
                  child: Text(
                    "Lanjutkan",
                    style: Styles.txt16w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
