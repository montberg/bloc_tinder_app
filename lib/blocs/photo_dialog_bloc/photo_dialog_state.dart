part of 'photo_dialog_bloc.dart';

sealed class PhotoDialogState extends Equatable {
  const PhotoDialogState();
  
  @override
  List<Object> get props => [];
}


final class PhotoDialogClosed extends PhotoDialogState {}

final class PhotoDialogOpen extends PhotoDialogState {
  final List<AlbumPhoto> photos;

  const PhotoDialogOpen(this.photos);
}
