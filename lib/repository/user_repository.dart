import 'dart:convert';

import '../interfaces/i_http_client.dart';
import '../models/address.dart';
import '../models/album_photo.dart';
import '../models/company.dart';
import '../models/user.dart';

class UserRepository {
  static Future<User?> getUserById(IHttpClient httpClient, int id) async {
    var response =
        await httpClient.get("jsonplaceholder.typicode.com", "users/$id");
    if (response == null) {
      return null;
    }
    if (response.data == null) {}
    Map<String, dynamic> userJson = jsonDecode(response.data!);
    response = await httpClient.get(
        "jsonplaceholder.typicode.com", "users/$id/albums");
    if (response == null) {
      return null;
    }
    List<dynamic> albumsJson = jsonDecode(response.data!);
    Map<String, dynamic> firstItem = albumsJson.first;
    var firstId = firstItem['id'];
    response = await httpClient.get(
        "jsonplaceholder.typicode.com", "albums/$firstId/photos");

    if (response == null) {
      return null;
    }
    List<dynamic> photosJson = jsonDecode(response.data!);
    List<AlbumPhoto> photos = photosJson
        .map((item) => AlbumPhoto(
            url: item['url'], id: item['id'], thumbnail: item['thumbnailUrl']))
        .toList();

    User user = User(
      photos: photos,
      id: userJson['id'],
      name: userJson['name'],
      username: userJson['username'],
      email: userJson['email'],
      address: Address(
        street: userJson['address']['street'],
        suite: userJson['address']['suite'],
        city: userJson['address']['city'],
        zipcode: userJson['address']['zipcode'],
      ),
      phone: userJson['phone'],
      company: Company(
        name: userJson['company']['name'],
        catchPhrase: userJson['company']['catchPhrase'],
        bs: userJson['company']['bs'],
      ),
    );
    return user;
  }
}
