part of 'card_switcher_bloc.dart';


abstract class CardSwitcherEvent {

}

class CardSwitherLoadCardEvent extends CardSwitcherEvent {
  final int id;
  CardSwitherLoadCardEvent({required this.id});
}

class CardSwitherLoadNextCardEvent extends CardSwitcherEvent {

  CardSwitherLoadNextCardEvent();
}

class CardSwitherLoadPreviousCardEvent extends CardSwitcherEvent {

  CardSwitherLoadPreviousCardEvent();
}