part of 'card_switcher_bloc.dart';

abstract class CardSwitcherState extends Equatable {
  const CardSwitcherState();

  @override
  List<Object> get props => [];
}

class CardSwitcherStateInitial extends CardSwitcherState {}

class CardSwitcherStateLoading extends CardSwitcherState {}

class CardSwitcherStateLoaded extends CardSwitcherState {
  final User user;
  final int userId;
  const CardSwitcherStateLoaded(this.user, this.userId);

  @override
  List<Object> get props => [user];
}

class CardSwitcherStateError extends CardSwitcherState {
  final String errorMessage;

  const CardSwitcherStateError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}