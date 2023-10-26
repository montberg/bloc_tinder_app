import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/album_photo.dart';

part 'photo_dialog_event.dart';
part 'photo_dialog_state.dart';

class PhotoDialogBloc extends Bloc<PhotoDialogEvent, PhotoDialogState> {
  PhotoDialogBloc() : super(PhotoDialogClosed()) {
    on<PhotoDialogEvent>((event, emit) {
      if (event is OpenPhotoDialog) {
        emit(PhotoDialogOpen(event.photos));
        print("dialog opened");
      }
      if (event is ClosePhotoDialog) {
        print("dialog closed");
        emit(PhotoDialogClosed());
      }
    });
  }
}
