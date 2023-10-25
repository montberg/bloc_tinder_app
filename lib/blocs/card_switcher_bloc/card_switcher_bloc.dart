import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_tinder_app/interfaces/i_internet_connection_checker.dart';
import 'package:bloc_tinder_app/models/album_photo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../interfaces/i_http_client.dart';
import '../../models/address.dart';
import '../../models/company.dart';
import '../../models/user.dart';
part 'card_switcher_event.dart';
part 'card_switcher_state.dart';

class CardSwitcherBloc extends Bloc<CardSwitcherEvent, CardSwitcherState> {
  IHttpClient httpClient;
  IInternetConnectionChecker internetConnectionChecker;
  int id;
  CardSwitcherBloc(
      {required this.id, required this.httpClient, required this.internetConnectionChecker})
      : super(CardSwitcherStateInitial()) {
    on<CardSwitcherEvent>((event, emit) async {
      if (await internetConnectionChecker.checkInternetConnection() == false) {
        debugPrint("no internet");
        emit(const CardSwitcherStateError("Check your Internet connection"));
        return;
      }
      if (event is CardSwitherLoadNextCardEvent) {
        id++;
        if(id==11) id=1;
      }
      if (event is CardSwitherLoadPreviousCardEvent) {
        id--;
        if(id==0) id=10; 
      }
        emit(CardSwitcherStateLoading());
        
        
        //print("state.id ${id}");
        //if(state.id==null) debugPrint("id is null");
        try {
          var response = await httpClient.get(
              "jsonplaceholder.typicode.com", "users/${id}");
          //print("isnull ${response?.data == null}");
          if (response == null) {
            emit(CardSwitcherStateError("Server error"));
            return;
          }
          if(response.data==null){

          }
          debugPrint(response.responseCode.toString());
          debugPrint(response.error ?? "No error");
          debugPrint(response.data);
          Map<String, dynamic> userJson = jsonDecode(response.data!);
          response = await httpClient.get(
              "jsonplaceholder.typicode.com", "users/${id}/albums");
          if (response == null) {
            emit(CardSwitcherStateError("Couldn't fetch albums list"));
            return;
          }
          List<dynamic> albumsJson = jsonDecode(response.data!);
          Map<String, dynamic> firstItem = albumsJson.first;
          //print(firstItem);
          var firstId = firstItem['id'];
          response = await httpClient.get(
              "jsonplaceholder.typicode.com", "albums/$firstId/photos");

          if (response == null) {
            emit(CardSwitcherStateError("Couldn't fetch photos list"));
            return;
          }
          List<dynamic> photosJson = jsonDecode(response.data!);
          Map<String, dynamic> albumInfo = photosJson.first;
          print("albumphoto : $albumInfo");
          String firstPhotoUrl = albumInfo['url'];

          User user = User(
            photo: AlbumPhoto(url: firstPhotoUrl),
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
          emit(CardSwitcherStateLoaded(user, id));
        } catch (e) {
          emit(CardSwitcherStateError(e.toString()));
          rethrow;
        }
      
    });
  }
}
