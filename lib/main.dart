import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frostbyte/Calculations.dart';
import 'package:frostbyte/result.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

int gender = 5;

class _MyAppState extends State<MyApp> {
  final formKey = GlobalKey<FormState>();

  Widget resultbox() {
    return ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            if (gender == 0) {
              ans = maleBFP();
            } else {
              ans = femaleBFP();
            }
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const Result();
                },
              ),
            );
          }
        },
        child: SizedBox(
          width: double.infinity,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 13.w),
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
              child: Text("Calculate",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Quicksand",
                      fontSize: 25.sp)),
            ),
          ),
        ));
  }

  bool click = false;
  int currentindex = 2;
  Color malecolor = const Color.fromARGB(255, 13, 89, 251);
  Color femalecolor = const Color.fromARGB(255, 222, 26, 121);

  void changeindex(int index) {
    currentindex = index;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: Size(width, height),
        builder: (context, child) {
          return SafeArea(
            top: true,
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Body Fat Calculator",
                    style: TextStyle(
                        fontFamily: 'Quicksand', fontWeight: FontWeight.bold)),
                centerTitle: true,
                flexibleSpace: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                      Color.fromARGB(255, 83, 21, 191),
                      Color.fromARGB(255, 14, 186, 123),
                    ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            transform: GradientRotation(0)))),
              ),
              body: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Color.fromARGB(255, 83, 21, 191),
                            Color.fromARGB(255, 14, 186, 123),
                          ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              transform: GradientRotation(0))),
                      child: Column(children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, height * 0.024, 0, 0),
                          child: Text(
                            'Please Select Your Gender',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: width * 0.06,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  changeindex(0);
                                  gender = 0;
                                });
                              },
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(width * 0.057),
                                      side: BorderSide(
                                          color: (currentindex == 0)
                                              ? malecolor
                                              : const Color.fromARGB(
                                                  255, 66, 66, 66))),
                                  elevation: height * 0.02,
                                  margin: EdgeInsets.fromLTRB(
                                      width * 0.01,
                                      height * 0.017,
                                      width * 0.035,
                                      height * 0.017),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(
                                        49.w, 180.h, 49.w, 10.h),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              if (currentindex == 0) ...[
                                                Colors.black,
                                                const Color.fromARGB(
                                                    255, 38, 131, 208),
                                              ] else ...[
                                                const Color.fromARGB(
                                                    255, 83, 21, 191),
                                                const Color.fromARGB(
                                                    255, 14, 186, 123),
                                              ]
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            transform:
                                                const GradientRotation(0)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(width * 0.057)),
                                        image: DecorationImage(
                                            image: Image.asset(
                                              'assets/male.png',
                                              fit: BoxFit.contain,
                                              scale: width * 0.0028,
                                            ).image,
                                            alignment: AlignmentDirectional(
                                                0, height * -0.0006))),
                                    child: Text('Male',
                                        style: TextStyle(
                                          fontSize: width * 0.057,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Quicksand',
                                        )),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  changeindex(1);
                                  gender = 1;
                                });
                              },
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(width * 0.057),
                                      side: BorderSide(
                                          color: (currentindex == 1)
                                              ? femalecolor
                                              : const Color.fromARGB(
                                                  255, 66, 66, 66))),
                                  elevation: height * 0.02,
                                  margin: EdgeInsets.fromLTRB(
                                      width * 0.035,
                                      height * 0.017,
                                      width * 0.01,
                                      height * 0.017),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(
                                        35.w, 180.h, 35.w, 10.h),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              if (currentindex == 1) ...[
                                                Colors.black,
                                                const Color.fromARGB(
                                                    255, 255, 27, 103),
                                              ] else ...[
                                                const Color.fromARGB(
                                                    255, 83, 21, 191),
                                                const Color.fromARGB(
                                                    255, 14, 186, 123),
                                              ]
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            transform:
                                                const GradientRotation(0)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(width * 0.057)),
                                        image: DecorationImage(
                                            image: Image.asset(
                                              'assets/female.png',
                                              fit: BoxFit.contain,
                                              scale: width * 0.0028,
                                            ).image,
                                            alignment: AlignmentDirectional(
                                                0, height * -0.0005))),
                                    child: Text('Female',
                                        style: TextStyle(
                                            fontSize: width * 0.057,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Quicksand')),
                                  )),
                            )
                          ],
                        ),
                        if (gender == 0) ...[
                          SizedBox(height: 25.h),
                          buildTextFormAge("Age"),
                          SizedBox(height: 15.h),
                          buildHeightTextForm("Height", "cm"),
                          SizedBox(height: 15.h),
                          buildWeightTextForm("Weight", "kg"),
                          SizedBox(height: 15.h),
                          buildWaistTextForm("Waist", "cm"),
                          SizedBox(height: 15.h),
                          buildNeckTextForm("Neck", "cm"),
                          SizedBox(height: height * 0.116),
                          resultbox()
                        ] else if (gender == 1) ...[
                          SizedBox(height: 25.h),
                          buildTextFormAge("Age"),
                          SizedBox(height: 15.h),
                          buildHeightTextForm("Height", "cm"),
                          SizedBox(height: 15.h),
                          buildWeightTextForm("Weight", "kg"),
                          SizedBox(height: 15.h),
                          buildWaistTextForm("Waist", "cm"),
                          SizedBox(height: 15.h),
                          buildNeckTextForm("Neck", "cm"),
                          SizedBox(height: 15.h),
                          buildHipTextForm("Hip", "cm"),
                          SizedBox(height: height * 0.04),
                          resultbox()
                        ] else if (gender == 5) ...[
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.58,
                          )
                        ],
                      ]),
                    ),
                  )),
            ),
          );
        });
  }
}
