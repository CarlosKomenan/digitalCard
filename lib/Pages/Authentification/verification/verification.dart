// ignore_for_file: unnecessary_import, implementation_imports, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_element, avoid_print, unused_local_variable, unused_import, prefer_interpolation_to_compose_strings, no_leading_underscores_for_local_identifiers

import 'dart:async';

import 'package:digitalcard/Pages/Authentification/enregistrement/form2.dart';
import 'package:digitalcard/Pages/Authentification/enregistrement/form4.dart';
import 'package:digitalcard/Pages/Authentification/enregistrement/password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:otp_text_field/otp_field.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  void initState() {
    super.initState();
    demarreTemps();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 40);
    return Timer(duration, loginRoute);
  }

  loginRoute() {
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => LoadingPage()));
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (builder) => CreatePassword()),
        (route) => false);
  }

  int debut = 30;
  bool wait = false;
  void demarreTemps() {
    const onsec = Duration(seconds: 1);
    Timer _temps = Timer.periodic(onsec, (timer) {
      if (debut == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          debut--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget otpField() {
      return OTPTextField(
        length: 5,
        width: MediaQuery.of(context).size.width - 30,
        fieldWidth: 58,
        otpFieldStyle: OtpFieldStyle(
            backgroundColor: Color(0xff1d1d1d), borderColor: Color(0xffe2b80e)),
        style: TextStyle(fontSize: 17, color: Color(0xffe2b80e)),
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldStyle: FieldStyle.underline,
        onCompleted: (pin) {
          print("Completed: " + pin);
        },
        onChanged: (pin) {
          print("Changed: " + pin);
        },
      );
    }

    final TextStyle headline4 = Theme.of(context).textTheme.headline4!;

    return GestureDetector(
      onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              transitionDuration: Duration(seconds: 1),
                              transitionsBuilder: (context, animation,
                                  anotherAnimation, child) {
                                animation = CurvedAnimation(
                                    curve: Curves.easeIn, parent: animation);
                                return SlideTransition(
                                  position: Tween(
                                          begin: Offset(1.0, 0.0),
                                          end: Offset(0.0, 0.0))
                                      .animate(animation),
                                  child: child,
                                );
                              },
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation) {
                                return Form2();
                              }));
                        },
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 30,
                          color: Color(0xffe2b80e),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.1),
                child: Text(
                  "Vérification",
                  style: GoogleFonts.aBeeZee(
                    textStyle: headline4,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffe2b80e),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.1),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Un code de vérification vous a été envoyé par SMS sur le numéro renseigner à la page précédente",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.aBeeZee(
                    textStyle: headline4,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                ),
                width: MediaQuery.of(context).size.width - 30,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    Text(
                      "Entrez les 5 chiffres",
                      style: GoogleFonts.aBeeZee(
                        textStyle: headline4,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.1),
              otpField(),
              SizedBox(height: MediaQuery.of(context).size.width * 0.1),
              InkWell(
                onTap: wait
                    ? null
                    : () {
                        setState(() {
                          debut = 30;
                          wait = true;
                        });
                        demarreTemps();
                      },
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "Vous n'avez pas réçu de code ?",
                    style: GoogleFonts.aBeeZee(
                      decoration: TextDecoration.underline,
                      textStyle: headline4,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Color(0xffe2b80e),
                    ),
                  ),
                  TextSpan(
                    text: "  00:$debut",
                    style: GoogleFonts.aBeeZee(
                      textStyle: headline4,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.red,
                    ),
                  ),
                  TextSpan(
                    text: " sec",
                    style: GoogleFonts.aBeeZee(
                      textStyle: headline4,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Color(0xffe2b80e),
                    ),
                  ),
                ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
