// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_import, unused_element, unused_local_variable, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:io';

import 'package:digitalcard/Pages/Authentification/presentationPage.dart';
import 'package:digitalcard/Pages/Authentification/verification/verification.dart';
import 'package:digitalcard/Widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import '../../home/home.dart';
import 'form1.dart';
import 'form2.dart';
import 'form4.dart';

class Form4 extends StatefulWidget {
  const Form4({Key? key}) : super(key: key);

  @override
  State<Form4> createState() => _Form4State();
}

class _Form4State extends State<Form4> {
  // File? pickedImage;
  File? pickedImageP;
  // bool loading = false;
  bool loadingP = false;

  pickImageP(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImageP = tempImage;
        // _photoController = pickedImage;
      });
      if (pickedImageP != null) {
        loadingP = true;
        setState(() {});
      }
      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  // pickImage(ImageSource imageType) async {
  //   try {
  //     final photo = await ImagePicker().pickImage(source: imageType);
  //     if (photo == null) return;
  //     final tempImage = File(photo.path);
  //     setState(() {
  //       pickedImage = tempImage;
  //       // _photoController = pickedImage;
  //     });
  //     if (pickedImage != null) {
  //       loading = true;
  //       setState(() {});
  //     }
  //     Get.back();
  //   } catch (error) {
  //     debugPrint(error.toString());
  //   }
  // }

  Future uploadImage({required String path}) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(path + "/" + pickedImageP.toString());
    await ref.putFile(pickedImageP!);
    // UploadTask upload = ref.putFile(img!);
    String url = await ref.getDownloadURL();
    // await FirebaseFirestore.collection("Utilisateur");
    // upload.then((res) {
    //   res.ref.getDownloadURL();
    // });
    // await upload.onComplete;
    // return await ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    void imagePickerOptionPiece() {
      Get.bottomSheet(SingleChildScrollView(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10.0)),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "CHARGER L'IMAGE DEPUIS...",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        pickImageP(ImageSource.camera);
                      },
                      icon: Icon(Icons.camera),
                      label: Text("CAMERA")),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        pickImageP(ImageSource.gallery);
                      },
                      icon: Icon(Icons.image),
                      label: Text("GALERIE")),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.close),
                      label: Text("RETOUR")),
                ],
              ),
            ),
          ),
        ),
      ));
    }

    final TextStyle headline4 = Theme.of(context).textTheme.headline4!;
    return GestureDetector(
      onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
      child: Scaffold(
          backgroundColor: Color(0xFFe7edeb),
          body: SingleChildScrollView(
            child: Container(
              // color: Color(0xFFe7edeb),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Form2()));
                            },
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Color(0xffe2b80e),
                              size: 30,
                            )),
                        InkWell(
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
                                  return Verification();
                                }));
                          },
                          child: Row(
                            children: [
                              Text(
                                "SUIVANT",
                                style: GoogleFonts.aBeeZee(
                                    textStyle: headline4,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffe2b80e)),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: Color(0xffe2b80e),
                                size: 30,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    child: Lottie.asset(
                      'assets/scanPiece.json',
                      repeat: true,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    child: Center(
                      child: Text(
                        "Prenez en photo votre pièce d'identité svp \n CNI - PASSPORT - PERMIS - ATTESTATION",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.aBeeZee(
                            // textStyle: headline4,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffe2b80e), width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Container(
                              child: pickedImageP != null
                                  ? Image.file(
                                      pickedImageP!,
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      height: 250,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      "assets/int.png",
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      height: 250,
                                      fit: BoxFit.cover,
                                    ),
                            )),
                        if (loadingP)
                          Positioned(
                            top: 0,
                            // left: 3,
                            right: 3,
                            // bottom: 2,
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.amber),
                            ),
                          ),
                        Positioned(
                            bottom: 0,
                            right: 5,
                            child: IconButton(
                                onPressed: imagePickerOptionPiece,
                                icon: Icon(
                                  Icons.add_a_photo_outlined,
                                  color: Colors.black,
                                  size: 30,
                                )))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Text(
                      loadingP
                          ? "Si la photo n'est pas clair, cliquez sur l'appareil photo pour reprendre sinon SUIVANT"
                          : " ",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aBeeZee(
                        textStyle: headline4,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
