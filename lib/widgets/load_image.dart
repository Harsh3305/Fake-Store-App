import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'my_theme.dart';

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
            return CircularProgressIndicator(color: MyTheme.primaryLight);
          }
        },
        errorBuilder: (context, child, stackTrace) {
          return CircularProgressIndicator(color: MyTheme.primaryLight);
        },
      );
    } else if (height == -1) {
      return Image.network(
        urlOfImage,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return CircularProgressIndicator(color: MyTheme.primaryLight);
            ;
          }
        },
        errorBuilder: (context, child, stackTrace) {
          return CircularProgressIndicator(color: MyTheme.primaryLight);
          ;
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
            return CircularProgressIndicator(color: MyTheme.primaryLight);
          }
        },
        errorBuilder: (context, child, stackTrace) {
          return CircularProgressIndicator(color: MyTheme.primaryLight);
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
            return CircularProgressIndicator(color: MyTheme.primaryLight);
          }
        },
        errorBuilder: (context, child, stackTrace) {
          return CircularProgressIndicator(color: MyTheme.primaryLight);
        },
        height: height,
        width: width,
        scale: 0.5,
      );
    }
  }
}
