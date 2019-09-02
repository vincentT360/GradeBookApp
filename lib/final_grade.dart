import 'package:flutter/material.dart';
import 'models/grade_tools.dart';
import 'styles.dart';


class FinalGradeScreen extends StatefulWidget{
  final GradeTool currentTool;
  FinalGradeScreen(this.currentTool);
  @override
  _FinalGradeScreenState createState() => _FinalGradeScreenState(currentTool);
  //_FinalGradeScreenState stores the mutable data
}

class _FinalGradeScreenState extends State<FinalGradeScreen>{
  final GradeTool currentTool;
  _FinalGradeScreenState(this.currentTool);

  //Textfield Controllers, used to monitor input in TextFields
  static TextEditingController currentGradeController = TextEditingController();
  static TextEditingController wantedGradeController = TextEditingController();
  static TextEditingController finalWorthPercentController = TextEditingController();
  List<TextEditingController> controllerList = [currentGradeController, wantedGradeController, finalWorthPercentController];

  final String _descriptionText = "Ever wondered what you need on that final to pass with a certain grade? Use this calculator to find out!";

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text(currentTool.toolName, style: Styles.navBarHeader)),
      body: Column(children: _renderRows(context))
      );
  }


  List<Widget> _renderRows(BuildContext context){
    var rows = List<Widget>();
    List<String> categories = ['Current Grade (%):', 'Wanted Grade (%):', 'Your final is worth (%):'];
    
    rows.add(Container(padding: EdgeInsets.all(10.0), child: Text(_descriptionText, style: Styles.listTitle, textAlign: TextAlign.center)));
    
    //Adds the text to ask for input and get input
    for(int i = 0; i < categories.length; i++){
      rows.add(Row(children: _renderRowChildren(categories[i], controllerList[i])));
    }
    //Adds a result field and calculate button
    rows.add(_renderCalculateButton(context));

    return rows;
  }

  List<Widget> _renderRowChildren(String inputTitle, TextEditingController currentController){
    var rowChildren = List<Widget>();
    //Add the text to show what to is needed to calculate
    rowChildren.add(Container(padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 15.0), child: Text(inputTitle, style: Styles.defaultText), width: 250.0,));

    //Add input fields
    rowChildren.add(Container(padding: EdgeInsets.all(10.0), child: TextField(controller: currentController, style: Styles.defaultText,), width: 100.0,));
    return rowChildren;
  }

  Widget _renderCalculateButton(BuildContext context){
    return Container(padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 10.0), child: RaisedButton(onPressed: () {_onCalculatePress(context);}, child: Text("Calculate!", style: Styles.defaultText), elevation: 5.0,));
  }

  void _onCalculatePress(BuildContext context){
    //We use showDialog since onPressed doesn't allow for a return
    //So showDialog will show the AlertDialog without having _onCalculatePress return anything
    String result = "";
    double numericalResult = 0.0;
    //Get input, catch any exceptions from wrong user input error.
    try{
      double currentGrade = double.parse(currentGradeController.text);
      double wantedGrade = double.parse(wantedGradeController.text);
      double finalWorth = double.parse(finalWorthPercentController.text);

      numericalResult = ((wantedGrade - ((1.0 - (finalWorth/100.0))*currentGrade))/finalWorth)*100;
      
      result = "You need at least ${numericalResult.toString()}% in order to get a $wantedGrade% in your class.";
    }
    on FormatException{
      result = "Error! Check your input values. Make sure to only enter numbers.";
    }

    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(content: Text(result, style: Styles.popUpText, textAlign: TextAlign.center,));
        }
        );

  }
}