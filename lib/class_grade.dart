import 'package:flutter/material.dart';
import 'models/grade_tools.dart';
import 'styles.dart';
import 'models/user_classes.dart';
import 'database_helper.dart';

//Handle code for final grade calculator screen 
//How stateful widgets work

//1. We create a class that extends statefulwidget
//2. Create a subclass of State<YourWidget>
//3. Doing so allows to crate the widget that is mutable and has a build method

//Note: Need to call setstate() to redraw and update widget
//So lets say we have an icon button with param onPressed:
//We need onPressed to take a void callback function

/* Example of using setState. onPressed must be a void callback
   Suppose body belongs in scaffold

body: IconButton(icon: Text("$counter"), onPressed: _onPress,),

void _onPress() {
  setState(() {counter++;});
}

*/

class ClassGradeScreen extends StatefulWidget{
  final GradeTool currentTool;

  ClassGradeScreen(this.currentTool);
  @override
  _ClassGradeScreenState createState() => _ClassGradeScreenState(currentTool);
  //_ClassGradeScreenState stores the mutable data
}

class _ClassGradeScreenState extends State<ClassGradeScreen>{
  final GradeTool currentTool;

  _ClassGradeScreenState(this.currentTool);

  static TextEditingController createClassController = TextEditingController();

  final dbHelper = DatabaseHelper.instance;
  List<UserClasses> retrieved = [];

  @override
  Widget build(BuildContext context)
  {
    //Retrieve any classes stored in database
    return Scaffold(
      appBar: AppBar(title: Text(currentTool.toolName, style: Styles.navBarHeader)),
      body: Column(children: _renderColumnClasses(context)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _createClass,
        ),
      );
  }

  void _createClass() {
    //Create a class when floating action button pressed.

    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(content: 
          Column(children: _createClassAlertDialog(), mainAxisSize: MainAxisSize.min,
          )
        );
        }
      );
  }

  List<Widget> _createClassAlertDialog()
  {
    return [
            Container(padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0), child: Text("Create a Class", textAlign: TextAlign.center, style: Styles.popUpText,)),
            Container(padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 25.0), child: TextField(controller: createClassController, style: Styles.defaultText, decoration: InputDecoration(hintText: "Class Name"))),
            Container(child: RaisedButton(child: Text("Create"), onPressed: _onPressedCreateClass, ))
          ];
  }

  void _onPressedCreateClass(){

    setState(() { //setState needed so we redraw the widget
        _insertClassAsync(UserClasses(className: createClassController.text));
    });
    createClassController.clear();

  }

  List<Widget> _renderColumnClasses(BuildContext context){
    //List of classes to build, pulled from database
    _getClassesAsync();
  
    List<Widget> columnChildren = [];

    for(int i = 0; i < retrieved.length; i++){
      //Create a card for each class
      columnChildren.add(_addCard(i));
    }

    return columnChildren;

  }
  
  Widget _addCard(int index){
    return Card(
      child: Column(
        children: [
          Row(children: [_renderRowTitle(index), _deleteButton(index)], mainAxisAlignment: MainAxisAlignment.spaceBetween,),
        ],

      ),

    );
  }

  Widget _renderRowTitle(int index){
    return Container(padding: EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 10.0), child: Text(retrieved[index].className, style: Styles.classCardTitles));
  }

  Widget _deleteButton(int index){
    return FlatButton(child: Text("Delete", style: Styles.defaultText,), onPressed: () {
      setState(() {
        _deleteClassAsync(index);
      });
      //_deleteClassAsync(index);
    },);
  }
  

  void _insertClassAsync(UserClasses classToAdd) async {
    print("adding classes");
    await dbHelper.insertClass(classToAdd);
  }

  void _getClassesAsync() async {
    print("getting classes");
    retrieved = await dbHelper.getClasses();
  }

  void _deleteClassAsync(int index) async {
    await dbHelper.deleteClass(retrieved[index].className);
  }

}