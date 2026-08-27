import 'package:flutter/material.dart';
import 'package:online_store/core/const/app_color.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.iconSize = 50,
  });

  final String? url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final imageUrl = url?.trim() ?? '';
    if (imageUrl.isEmpty) {
      return Icon(
        Icons.image_not_supported,
        size: iconSize,
        color: AppColor.b,
      );
    }
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => Icon(
        Icons.image_not_supported,
        size: iconSize,
        color: AppColor.b,
      ),
    );
  }
}
