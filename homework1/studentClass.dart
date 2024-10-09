import 'dart:io';

class Student {
  String? name;
  String? surname;
  List<double>? resultList;
  double? averageNote;

  Student([this.name, this.surname, this.resultList, this.averageNote]);

  void notEkle(List<double> resultList){
    this.resultList = resultList;
  }

  void ortalamaHesapla() {
    if (resultList == null || resultList!.isEmpty) {
      throw ArgumentError("Note list empty.");
    }
    
    double total = resultList!.reduce((a, b) => a + b);
    averageNote = total / resultList!.length;

    print("$name $surname's avarage note is $averageNote");
  }
}

void main(List<String> args) {
  try {
    print("Type your name.");
    String? name = stdin.readLineSync();

    if (name == null || name == "") {
     throw ArgumentError("Can't be empty");
    }

    name = name.trim();
  
    print("Type your Surname.");
    String? surname = stdin.readLineSync();

    if (surname == null || surname == "") {
      throw ArgumentError("Can't be empty");
    }

    surname = surname.trim();

    print("Type your exam results (e.g. 80 90 ) :");
    String? results = stdin.readLineSync();

    if (results == null || results == "") {
      throw ArgumentError("Can't be empty");
    }

    List<double> resultList = results.split(" ").map((e) => double.parse(e)).toList().cast<double>();
    
    for (var element in resultList) {
      if (element < 0 || element > 100) {
        throw ArgumentError("Result must be between 0 and 100.");
      }
    }

    Student student1 = Student(name, surname);
    student1.notEkle(resultList);
    student1.ortalamaHesapla();
 } catch (e) {
   print("$e");
 }
}