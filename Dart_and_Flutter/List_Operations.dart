//Done by Vaibhav Gupta
import 'dart:io';
void main() {
  var name=[];
  for(int i=0;i<5;i++){
    print("Enter name: ${i+1}");
    String? users=stdin.readLineSync();
    name.add(users);
  }
  var roll=[];
  for(int j=0;j<5;j++){
    print("Enter roll number: ${j+1}");
    String? input=stdin.readLineSync();
    roll.add(input);
  }
  //print("${name},${roll}");
  var combined=[];
  for(int k=0;k<5;k++){
    combined.add([name[k],roll[k]]);
  }
  print("original list: ${combined}");

  for(int m=0;m<3;m+=2){
    combined.removeAt(m);//remove elemnt at 'odd' index..
    m-=1;
  }
  print("final result: ${combined}");
  
}
//did my best ngl..