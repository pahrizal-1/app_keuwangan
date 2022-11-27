import 'package:app_keuwangan/models/uang.dart';

List<money> geter() {
  money upwork = money();
  upwork.name = 'Pergi Kerja';
  upwork.fee = '65000';
  upwork.time = 'today';
  upwork.image = 'Transportation.png';
  upwork.buy = false;

  money staclbucks = money();
  staclbucks.buy = true;
  staclbucks.fee = '1000';
  staclbucks.image = 'food.png';
  staclbucks.name = 'Bayar Makan';
  staclbucks.time = 'today';

  money tranfers = money();
  tranfers.buy = true;
  tranfers.fee = '20000';
  tranfers.image = 'Transfer.png';
  tranfers.name = 'Tranfer Ke Udin';
  tranfers.time = 'jan 20,2003';

  return [upwork, staclbucks, tranfers, upwork, staclbucks, tranfers];
}
