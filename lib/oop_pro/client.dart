import 'package:project/oop_pro/bank_account.dart';
class Client {
  String name;
  String phone;
  String address;
  late BankAccount account;

  Client({required this.name, required this.phone, required this.address});

  void view() {
    print('Client name: $name');
    print('Client phone: $phone');
    print('Client address: $address');
  }
}
