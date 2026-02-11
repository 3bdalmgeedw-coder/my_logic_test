import 'dart:io';

void main() {
print("Welcome to the Shopping Cart Manager!");
List cart =[];

if(cart.isEmpty){

  print("your cart is empty please enter your Products: ");
}
while (true){
  String? input = stdin.readLineSync();
  cart.add(input!);
  if (input == "exit") { break; }
  print("Added! Current cart: $cart");

}


}