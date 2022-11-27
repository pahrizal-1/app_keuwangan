import 'package:app_keuwangan/models/uang.dart';

// ignore: non_constant_identifier_names
List<money> geter_top() {
  money snapFood = money();
  snapFood.name = 'Snap Food';
  snapFood.fee = '- 6500';
  snapFood.time = 'jan, 20,2023';
  snapFood.image = 'food.png';
  snapFood.buy = true;
  ///////////////////////
  money snap = money();
  snap.name = 'Tranfer';
  snap.fee = '- 5000';
  snap.time = 'Today';
  snap.image = 'Transfer.png';
  snap.buy = true;

  return [snapFood, snap, snapFood, snap];
}
