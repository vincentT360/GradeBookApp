import 'package:flutter/material.dart';
import 'grade_tools.dart';

class ActiveGradeTools{
  
  static final int toolCount = 2;

  static final List<GradeTool> tools =[
    GradeTool(toolName: 'Final Grade Calculator', thumbnail: 'assets/images/calculator_icon.png'),
    GradeTool(toolName: 'Class Grade Calculator', thumbnail: 'assets/images/notebook_icon.png')

  ];

  static List<GradeTool> fetchAll() {
    return ActiveGradeTools.tools;
  }

  static int toolCountGet() {
    return ActiveGradeTools.toolCount;
  }

}