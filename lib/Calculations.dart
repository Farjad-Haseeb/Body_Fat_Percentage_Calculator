// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:eval_ex/built_ins.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String ans = '';
double lean = 0.0;
var age;
var neck;
var height;
var weight;
var waist;
var hip;

String maleBFP() {
  double finalmale = (495 /
          (1.0324 - 0.19077 * log10(waist - neck) + 0.15456 * log10(height))) -
      450;
  String male = finalmale.toStringAsFixed(1);
  if (finalmale < 2.0) {
    return male = "0.0";
  } else {
    return male;
  }
}

String femaleBFP() {
  double finalfemale = (495 /
          (1.29579 -
              0.35004 * log10(waist + hip - neck) +
              0.22100 * log10(height))) -
      450;
  String female = finalfemale.toStringAsFixed(1);
  if (finalfemale < 10.0) {
    return female = "0.0";
  } else {
    return female;
  }
}

String maleCategory(double func) {
  double temp = func;
  if (temp >= 2 && temp <= 5) {
    return "Essential Fat";
  } else if (temp >= 6 && temp < 14) {
    return "Athletes";
  } else if (temp >= 14 && temp < 18) {
    return "Fitness";
  } else if (temp >= 18 && temp < 25) {
    return "Average";
  } else if (temp >= 25) {
    return "Obese";
  } else {
    return "Invalid Input";
  }
}

String femaleCategory(double func) {
  double temp = func;
  if (temp >= 10 && temp < 14) {
    return "Essential Fat";
  } else if (temp >= 14 && temp < 21) {
    return "Athletes";
  } else if (temp >= 21 && temp < 25) {
    return "Fitness";
  } else if (temp >= 25 && temp < 32) {
    return "Average";
  } else if (temp >= 32) {
    return "Obese";
  } else {
    return "Invalid Input";
  }
}

String maleBodyMass(double fun) {
  double mBM = (fun * weight) / 100;
  mBM.round();
  lean = mBM;
  return mBM.toStringAsFixed(1);
}

String maleLeanMass(double xyz) {
  double temp = weight - xyz;
  return temp.toStringAsFixed(1);
}

String femaleLeanMass(double xyz) {
  double temp = weight - xyz;
  return temp.toStringAsFixed(1);
}

String femaleBodyMass(double fun) {
  double fBM = (fun * weight) / 100;
  fBM.round();
  lean = fBM;
  return fBM.toStringAsFixed(1);
}

Widget buildTextFormAge(String name) {
  return SizedBox(
    width: 350.w,
    child: TextFormField(
      maxLength: 3,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
      ],
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 12.w),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.r)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.r)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10.r)),
        labelText: "Enter Your $name",
        labelStyle: const TextStyle(
            color: Colors.black,
            fontFamily: "Quicksand",
            fontWeight: FontWeight.bold),
      ),
      onChanged: (value) {
        age = double.tryParse(value);
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "This Is A Required Form Field";
        } else if (value == '.') {
          return "Invalid Input";
        } else {
          return null;
        }
      },
    ),
  );
}

Widget buildHeightTextForm(String name, String unit) {
  return SizedBox(
    width: 350.w,
    child: TextFormField(
      maxLength: 5,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
      ],
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 12.w),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.r)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.r)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10.r)),
        labelText: "Enter Your $name (in $unit)",
        labelStyle: const TextStyle(
            color: Colors.black,
            fontFamily: "Quicksand",
            fontWeight: FontWeight.bold),
      ),
      onChanged: (value) {
        height = double.parse(value);
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "This Is A Required Form Field";
        } else if (value == '.') {
          return "Invalid Input";
        } else {
          return null;
        }
      },
    ),
  );
}

Widget buildWeightTextForm(String name, String unit) {
  return SizedBox(
    width: 350.w,
    child: TextFormField(
      maxLength: 5,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
      ],
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 12.w),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.r)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.r)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10.r)),
        labelText: "Enter Your $name (in $unit)",
        labelStyle: const TextStyle(
            color: Colors.black,
            fontFamily: "Quicksand",
            fontWeight: FontWeight.bold),
      ),
      onChanged: (value) {
        weight = double.parse(value);
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "This Is A Required Form Field";
        } else if (value == '.') {
          return "Invalid Input";
        } else {
          return null;
        }
      },
    ),
  );
}

Widget buildWaistTextForm(String name, String unit) {
  return SizedBox(
    width: 350.w,
    child: TextFormField(
      maxLength: 5,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
      ],
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 12.w),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.r)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.r)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10.r)),
        labelText: "Enter Your $name (in $unit)",
        labelStyle: const TextStyle(
            color: Colors.black,
            fontFamily: "Quicksand",
            fontWeight: FontWeight.bold),
      ),
      onChanged: (value) {
        waist = double.parse(value);
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "This Is A Required Form Field";
        } else if (value == '.') {
          return "Invalid Input";
        } else {
          return null;
        }
      },
    ),
  );
}

Widget buildNeckTextForm(String name, String unit) {
  return SizedBox(
    width: 350.w,
    child: TextFormField(
      maxLength: 5,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
      ],
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 12.w),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.r)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.r)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10.r)),
        labelText: "Enter Your $name (in $unit)",
        labelStyle: const TextStyle(
            color: Colors.black,
            fontFamily: "Quicksand",
            fontWeight: FontWeight.bold),
      ),
      onChanged: (value) {
        neck = double.tryParse(value);
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "This Is A Required Form Field";
        } else if (value == '.') {
          return "Invalid Input";
        } else {
          return null;
        }
      },
    ),
  );
}

Widget buildHipTextForm(String name, String unit) {
  return SizedBox(
    width: 350.w,
    child: TextFormField(
      maxLength: 5,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
      ],
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 12.w),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.r)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.r)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10.r)),
        labelText: "Enter Your $name (in $unit)",
        labelStyle: const TextStyle(
            color: Colors.black,
            fontFamily: "Quicksand",
            fontWeight: FontWeight.bold),
      ),
      onChanged: (value) {
        hip = double.tryParse(value);
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "This Is A Required Form Field";
        } else if (value == '.') {
          return "Invalid Input";
        } else {
          return null;
        }
      },
    ),
  );
}


