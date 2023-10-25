import 'package:bloc_tinder_app/pages/home/widgets/cards_switcher/cards_switcher.dart';
import 'package:bloc_tinder_app/pages/home/widgets/user_card/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/card_switcher_bloc/card_switcher_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int id;
@override
  void initState() {
    id = 1;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 12,
              child: BlocBuilder<CardSwitcherBloc, CardSwitcherState>(
                builder: (context, state) {
                  if (state is CardSwitcherStateLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is CardSwitcherStateError) {
                    return Center(child: Text(state.errorMessage));
                  }
                  if (state is CardSwitcherStateLoaded) {
                    UserCard userCard = UserCard.fromRawData(
                      photoUrl: state.user.photo.url,
                      username: state.user.name,
                      companyName: state.user.company.name,
                      description: [],
                    );
                    return Expanded(flex: 12, child: userCard);
                  }
                  return const CircularProgressIndicator.adaptive();
                },
              ),
            ),
            Expanded(
                flex: 1,
                child: CardsSwitcher(goForwardAction: () {
                  id++;
                  if(id==10) id = 1;
                  BlocProvider.of<CardSwitcherBloc>(context)
                      .add(CardSwitherLoadNextCardEvent());
                }, goBackwardAction: () {
                  print(id);
                  id--;
                  print(id);
                  if(id==1) id = 10;
                  BlocProvider.of<CardSwitcherBloc>(context)
                      .add(CardSwitherLoadPreviousCardEvent());
                }))
          ],
        ),
      ),
    );
  }
}
