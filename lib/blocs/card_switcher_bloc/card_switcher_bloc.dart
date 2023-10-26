import 'package:bloc/bloc.dart';
import 'package:bloc_tinder_app/interfaces/i_internet_connection_checker.dart';
import 'package:bloc_tinder_app/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import '../../interfaces/i_http_client.dart';
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
        try {
          User? user = await UserRepository.getUserById(httpClient, id);
          if(user==null) {
            emit(const CardSwitcherStateError("Server error"));
          } else {
            emit(CardSwitcherStateLoaded(user, id));
          }
        } catch (e) {
          emit(CardSwitcherStateError(e.toString()));
          rethrow;
        }
      
    });
  }
}
