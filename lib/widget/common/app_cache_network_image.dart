import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_meal/widget/common/text_view_widget.dart';

import 'loading_circle_indicator_widget.dart';

class AppCachedNetworkImage extends StatefulWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double? loadingSize;

  const AppCachedNetworkImage({
    this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.loadingSize,
    Key? key,
  }) : super(key: key);

  @override
  State<AppCachedNetworkImage> createState() => _AppCachedNetworkImageState();
}

class _AppCachedNetworkImageState extends State<AppCachedNetworkImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.imageUrl ?? "",
      fit: widget.fit,
      placeholder: (context, url) => const LoadingCircleIndicatorWidget(),
      errorWidget: (context, url, error) {
        print("Image Error**** $url");
        return LayoutBuilder(
          builder: ((context, constraints) => const TextViewWidget("Error")),
        );
      },
    );
  }
}
