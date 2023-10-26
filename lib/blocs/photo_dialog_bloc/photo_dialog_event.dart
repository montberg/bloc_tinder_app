part of 'photo_dialog_bloc.dart';

sealed class PhotoDialogEvent extends Equatable {
  const PhotoDialogEvent();

  @override
  List<Object> get props => [];
}

class OpenPhotoDialog extends PhotoDialogEvent {
  final List<AlbumPhoto> photos;

  const OpenPhotoDialog(this.photos);
}

class ClosePhotoDialog extends PhotoDialogEvent {}

