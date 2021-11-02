import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadImageFromNetwork extends StatelessWidget {
  const LoadImageFromNetwork(
      {Key? key,
      required this.urlOfImage,
      required this.height,
      required this.width})
      : super(key: key);
  final String urlOfImage;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    if (height == -1 && width == -1) {
      return Image.network(
        urlOfImage,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return const CircularProgressIndicator();
          }
        },
        errorBuilder: (context, child, stackTrace) {
          return const CircularProgressIndicator();
        },
      );
    } else if (height == -1) {
      return Image.network(
        urlOfImage,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return const CircularProgressIndicator();
          }
        },
        errorBuilder: (context, child, stackTrace) {
          return const CircularProgressIndicator();
        },
        width: width,
      );
    } else if (width == -1) {
      return Image.network(
        urlOfImage,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return const CircularProgressIndicator();
          }
        },
        errorBuilder: (context, child, stackTrace) {
          return const CircularProgressIndicator();
        },
        height: height,
      );
    } else {
      return Image.network(
        urlOfImage,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return const CircularProgressIndicator();
          }
        },
        errorBuilder: (context, child, stackTrace) {
          return const CircularProgressIndicator();
        },
        height: height,
        width: width,
        scale: 0.5,
      );
    }
  }
}
