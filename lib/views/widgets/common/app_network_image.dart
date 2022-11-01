import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/common/config/app_assets.dart';

class AppNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final String defaultImageAsset;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? errorWidget;

  const AppNetworkImage({
    Key? key,
    this.imageUrl,
    this.defaultImageAsset = AppAssetsImage.defaultImage,
    this.width,
    this.height,
    this.fit,
    this.errorWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return Image.asset(
        defaultImageAsset,
        width: width,
        height: height,
        fit: fit,
      );
    }

    return CachedNetworkImage(
      imageUrl: imageUrl!,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) {
        return Image.asset(
          defaultImageAsset,
          width: width,
          height: height,
          fit: fit,
        );
      },
      errorWidget: (context, url, error) => errorWidget == null
          ? Image.asset(
              defaultImageAsset,
              width: width,
              height: height,
              fit: fit,
            )
          : errorWidget!,
    );
  }
}
