import 'package:bloc_tinder_app/models/album_photo.dart';

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
  final List<AlbumPhoto> photos;

  User({required this.photos, required this.id, required this.name, required this.username, required this.email, required this.address, required this.phone, required this.company});
  
}