import 'dart:io';

void main (){
print("Welcome to the Fitness Challenge!");
print("please enter your goal in push ups:");
String? input = stdin.readLineSync();
int goal = int.parse(input!);
print("your goal is to do $goal push ups!");
print("let's start the challenge!");
print("enter your push ups done today:");
String? input2 = stdin.readLineSync();
int goal2 = int.parse(input2!);


if(goal2<goal){
  int remaining = goal - goal2;
  print("you did $goal2 push ups today. you need $remaining more to reach your goal.");
}else if (goal2 == goal){
  print("congratulations! you reached your goal of $goal push ups!");
}else if (goal2 > goal){
  print("you did more than your goal amazing!");

}else{
  print("you must rememmber your goal");

}

}
