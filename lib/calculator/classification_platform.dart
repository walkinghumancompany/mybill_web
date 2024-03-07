import 'package:flutter/material.dart';
import 'package:mybill_web/calculator/responsive.dart';

class ClassificationPlatform {

  bool isMobile({required context,}) {
    if (Responsive.isMobile(context)) {
      return true;
    } else if (Responsive.isTablet(context)) {
      return false;
    } else {
      return false;
    }
  }

  classifyWithScreenSize({required context, criteriaSize = 900, tabletCriteriaSize = 630,}) {
    final double screenWidthSize = MediaQuery.of(context).size.width;

    if (screenWidthSize > criteriaSize) {
      // web
      return 2;
    } else if(screenWidthSize < criteriaSize && screenWidthSize > tabletCriteriaSize) {
      // tablet
      return 1;
    } else {
      // mobile
      return 0;
    }
  }

  int classifyWithDevice({required context,}) {
    if (Responsive.isMobile(context)) {
      return 0;
    } else if (Responsive.isTablet(context)) {
      return 1;
    } else {
      return 2;
    }
  }

}