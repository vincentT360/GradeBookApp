import 'package:flutter/material.dart';
import 'styles.dart';
import 'models/grade_tools.dart';
import 'final_grade.dart';

//Home screen where users select what tool they want to use

class ToolSelect extends StatelessWidget{

  final List<GradeTool> gradeTools;
  final int toolNum;
  ToolSelect(this.gradeTools, this.toolNum);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Grade Tool", style: Styles.navBarHeader)),
      body: ListView.builder(
        itemCount: toolNum,
        itemBuilder: _buildListTiles,
        ),
    );
  }

  Widget _buildListTiles(BuildContext context, int index)
  {
    var currentTool = gradeTools[index];
    return Card(child: ListTile(
      contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
      leading: _listTileThumbnail(currentTool),
      title: _listTitle(currentTool),
      onTap: (){
        _handleOnTapTool(context, currentTool);
      }
      ));
  }

  Widget _listTileThumbnail(GradeTool currentTool)
  {
    return Container(
    constraints: BoxConstraints.tightFor(width: 100),
    child: Image(image: AssetImage(currentTool.thumbnail), fit: BoxFit.fitHeight),
    );
  }

  Widget _listTitle(GradeTool currentTool)
  {
    return Text(currentTool.toolName, style: Styles.listTitle);
  }

  void _handleOnTapTool(BuildContext context, GradeTool currentTool)
  { //Navigate to correct tool page on tap

    if (currentTool.toolName == 'Final Grade Calculator'){
      Navigator.push(context, MaterialPageRoute(builder: (context) => FinalGradeScreen(currentTool) ));
    }

  }

}