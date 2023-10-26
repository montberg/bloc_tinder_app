import 'package:bloc_tinder_app/blocs/photo_dialog_bloc/photo_dialog_bloc.dart';
import 'package:bloc_tinder_app/pages/home/widgets/cards_switcher/cards_switcher.dart';
import 'package:bloc_tinder_app/pages/home/widgets/photo_dialog/photo_dialog.dart';
import 'package:bloc_tinder_app/pages/home/widgets/user_card/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
                builder: (cardcontext, CardSwitcherState state) {
                  if (state is CardSwitcherStateLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is CardSwitcherStateError) {
                    return Center(child: Text(state.errorMessage));
                  }
                  if (state is CardSwitcherStateLoaded) {
                    UserCard userCard = UserCard.fromRawData(
                      onTap: () {
                        BlocProvider.of<PhotoDialogBloc>(cardcontext)
                            .add(OpenPhotoDialog(state.user.photos));
                      },
                      photoUrl: state.user.photos.first.url,
                      username: state.user.name,
                      companyName: state.user.company.name,
                      description: [
                        state.user.phone,
                        state.user.email,
                        state.user.address.city,
                        state.user.address.street,
                        state.user.address.suite,
                        state.user.address.zipcode
                      ],
                    );
                    return BlocListener<PhotoDialogBloc, PhotoDialogState>(
                      listener: (listenercontext, state) {
                        switch (state) {
                          case PhotoDialogClosed():
                            return;
                          case PhotoDialogOpen():
                            showDialog(
                              barrierDismissible: false,
                              context: cardcontext,
                              builder: (BuildContext context) => PhotoDialog(
                                onTapClose: () {
                                  BlocProvider.of<PhotoDialogBloc>(
                                          listenercontext)
                                      .add(ClosePhotoDialog());
                                },
                                photos: state.photos,
                              ),
                            );
                          //PhotoDialog(photos: state.photos, onTapClose: (){});
                        }
                      },
                      child: Column(
                          children: [Expanded(flex: 12, child: userCard)]),
                    );
                  }
                  return const CircularProgressIndicator.adaptive();
                },
              ),
            ),
            Expanded(
                flex: 1,
                child: CardsSwitcher(goForwardAction: () {
                  BlocProvider.of<CardSwitcherBloc>(context)
                      .add(CardSwitherLoadNextCardEvent());
                }, goBackwardAction: () {
                  BlocProvider.of<CardSwitcherBloc>(context)
                      .add(CardSwitherLoadPreviousCardEvent());
                }))
          ],
        ),
      ),
    );
  }
}
