import 'package:flutter/material.dart';
import 'package:frostbyte/Calculations.dart';
import 'package:frostbyte/main.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget femalegauge(double val) {
    return SizedBox(
      height: 265.h,
      width: 255.w,
      child: SfRadialGauge(
        enableLoadingAnimation: true,
        animationDuration: 4000,
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 10,
            maximum: 40,
            interval: 2,
            ranges: <GaugeRange>[
              GaugeRange(
                startValue: 0,
                endValue: 10,
                color: Colors.red,
              ),
              GaugeRange(
                startValue: 10,
                endValue: 14,
                color: Colors.yellow,
              ),
              GaugeRange(
                startValue: 14,
                endValue: 21,
                color: const Color.fromARGB(255, 56, 205, 61),
              ),
              GaugeRange(
                startValue: 21,
                endValue: 25,
                color: const Color.fromARGB(255, 14, 149, 18),
              ),
              GaugeRange(
                startValue: 25,
                endValue: 32,
                color: Colors.orange,
              ),
              GaugeRange(
                startValue: 32,
                endValue: 40,
                color: const Color.fromARGB(255, 241, 20, 5),
              ),
            ],
            pointers: <GaugePointer>[
              NeedlePointer(
                enableAnimation: true,
                value: val,
              )
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Text(
                  "$val%",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp),
                ),
                positionFactor: 0.5,
                angle: 90,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget malegauge(double val) {
    return SizedBox(
      height: 265.h,
      width: 255.w,
      child: SfRadialGauge(
        enableLoadingAnimation: true,
        animationDuration: 4000,
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 2,
            maximum: 28,
            interval: 2,
            ranges: <GaugeRange>[
              GaugeRange(
                startValue: 0,
                endValue: 2,
                color: Colors.red,
              ),
              GaugeRange(
                startValue: 2,
                endValue: 6,
                color: Colors.yellow,
              ),
              GaugeRange(
                startValue: 6,
                endValue: 14,
                color: const Color.fromARGB(255, 56, 205, 61),
              ),
              GaugeRange(
                startValue: 14,
                endValue: 18,
                color: const Color.fromARGB(255, 14, 149, 18),
              ),
              GaugeRange(
                startValue: 18,
                endValue: 25,
                color: Colors.orange,
              ),
              GaugeRange(
                startValue: 25,
                endValue: 28,
                color: const Color.fromARGB(255, 241, 20, 5),
              ),
            ],
            pointers: <GaugePointer>[
              NeedlePointer(
                enableAnimation: true,
                value: val,
              )
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Text(
                  "$val%",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp),
                ),
                positionFactor: 0.5,
                angle: 90,
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(393, 851),
        builder: (context, child) {
          return MaterialApp(
              home: SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  title: const Text("Body Fat Calculator",
                      style: TextStyle(
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold)),
                  centerTitle: true,
                  flexibleSpace: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 83, 21, 191),
                          Color.fromARGB(255, 14, 186, 123),
                        ],
                      ),
                    ),
                  ),
                ),
                body: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                        Color.fromARGB(255, 83, 21, 191),
                        Color.fromARGB(255, 14, 186, 123),
                      ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          transform: GradientRotation(0))),
                  child: ListView(children: [
                    Card(
                      elevation: 200.h,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r)),
                      margin: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 15.w),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 50.h, horizontal: 50.w),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 14, 21, 163),
                                Color.fromARGB(255, 9, 116, 255),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              transform: GradientRotation(1)),
                          borderRadius: BorderRadius.all(Radius.circular(30.r)),
                        ),
                        child: Column(children: <Widget>[
                          if (gender == 0) ...[
                            malegauge(double.parse(ans))
                          ] else ...[
                            femalegauge(double.parse(ans)),
                          ],
                          Text(
                            "Your Body Fat Percentage Is:",
                            style: TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 19.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "$ans%",
                            style: TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 30.sp,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            "Your Body Fat Category:",
                            style: TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 19.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            (gender == 0)
                                ? maleCategory(double.parse(ans))
                                : femaleCategory(double.parse(ans)),
                            style: TextStyle(
                                fontFamily: "Quicksand",
                                fontSize: 30.sp,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 35.h,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "Body Fat Mass:",
                                style: TextStyle(
                                    fontFamily: "Quicksand",
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Text(
                                (gender == 0)
                                    ? "${maleBodyMass(double.parse(ans))} kg"
                                    : "${femaleBodyMass(double.parse(ans))} kg",
                                style: TextStyle(
                                    fontFamily: "Quicksand",
                                    fontSize: 23.sp,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "Lean Mass:",
                                style: TextStyle(
                                    fontFamily: "Quicksand",
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 62.w,
                              ),
                              Text(
                                (gender == 0)
                                    ? "${maleLeanMass(lean)} kg"
                                    : "${femaleLeanMass(lean)} kg",
                                style: TextStyle(
                                    fontFamily: "Quicksand",
                                    fontSize: 23.sp,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 45.h,
                          ),
                          SizedBox(
                            width: 240.w,
                            height: 50.h,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.r),
                                    ),
                                    backgroundColor:
                                        const Color.fromARGB(255, 241, 20, 4)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Recalculate",
                                  style: TextStyle(
                                      fontFamily: "Quicksand",
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold),
                                )),
                          )
                        ]),
                      ),
                    ),
                  ]),
                )),
          ));
        });
  }
}
