import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  final String photoUrl;
  final VoidCallback onTap;
  const ProfilePhoto({super.key, required this.photoUrl, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 300,
          width: double.infinity,
          child: ClipRect(
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              photoUrl,
              fit: BoxFit.fitWidth,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
