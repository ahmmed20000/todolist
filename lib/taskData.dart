import 'package:todolist/task.dart';

// ignore: camel_case_types
class taskData {
  static late taskData t1 = taskData._taskData();
  taskData._taskData();
  factory  taskData.getel(){
    // ignore: unnecessary_null_comparison
    if (t1 == null){
      t1 = taskData._taskData();
    }
    return t1;
  }
  List<task> t = [
  ];
}
