import 'address.dart';
import 'company.dart';

class User {
  
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final Company company;

  User({required this.id, required this.name, required this.username, required this.email, required this.address, required this.phone, required this.company});
  
}