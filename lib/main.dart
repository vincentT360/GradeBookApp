import 'package:flutter/material.dart';
import 'tool_select.dart';
import 'models/active_grade_tools.dart';
import 'models/grade_tools.dart';

main() {

  final List<GradeTool> gradeTools = ActiveGradeTools.fetchAll();
  final int toolNum = ActiveGradeTools.toolCountGet();

  runApp(MaterialApp(
    home: ToolSelect(gradeTools, toolNum),
  ));

}