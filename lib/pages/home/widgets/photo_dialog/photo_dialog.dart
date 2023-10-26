import 'package:flutter/material.dart';

import '../../../../models/album_photo.dart';

class PhotoDialog extends StatelessWidget {
  final List<AlbumPhoto> photos;
  final VoidCallback onTapClose;
  const PhotoDialog(
      {super.key, required this.photos, required this.onTapClose});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: WillPopScope(
        onWillPop: () async {
          onTapClose();
          return true;
        },
        child: Dialog.fullscreen(
          child: Stack(children: [
            Align(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (var photo in photos)
                      GestureDetector(
                        onTap: () {},
                        child: Image.network(photo.thumbnail),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        onTapClose();
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close))),
            ),
          ]),
        ),
      ),
    );
  }
}
