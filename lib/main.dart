import 'package:bloc_tinder_app/blocs/photo_dialog_bloc/photo_dialog_bloc.dart';
import 'package:bloc_tinder_app/interfaces/i_internet_connection_checker.dart';
import 'package:bloc_tinder_app/pages/home/home_page.dart';
import 'package:bloc_tinder_app/services/internet_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/card_switcher_bloc/card_switcher_bloc.dart';
import 'interfaces/i_http_client.dart';
import 'services/http_client.dart';

void main() {
  final IHttpClient client = HttpClient();
  final IInternetConnectionChecker checker = InternetConnectionChecker();
  runApp(MaterialApp(
      home: MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (_) => CardSwitcherBloc(
              httpClient: client, internetConnectionChecker: checker, id: 1)
            ..add(CardSwitherLoadCardEvent(id: 1))),
      BlocProvider(create: (_) => PhotoDialogBloc())
    ],
    child: HomePage(),
  )));
}
