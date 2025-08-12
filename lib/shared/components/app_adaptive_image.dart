import 'package:app/shared/constants/app_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAdaptiveImage extends StatelessWidget {
  const AppAdaptiveImage(
    this.path, {
    super.key,
    this.imageKey,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.colorFilter,
    this.errorBuilder,
    this.placeholderBuilder,
    this.onImageLoaded,
  });

  final String path;
  final Key? imageKey;
  final double? width;
  final double? height;
  final BoxFit fit;
  final ColorFilter? colorFilter;
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;
  final Widget Function(BuildContext)? placeholderBuilder;
  final VoidCallback? onImageLoaded;

  bool get _isNetwork => path.startsWith('http');
  bool get _isSvg => path.toLowerCase().endsWith('.svg');

  static Widget defaultPlaceholder(BuildContext context) =>
      Center(child: Transform.scale(scale: 0.75, child: const CircularProgressIndicator()));

  static Widget defaultError({
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) => Center(
    child: SvgPicture.asset(
      AppImages.error,
      width: width,
      height: height,
      fit: fit,
    ),
  );

  static Widget fadeInFrameBuilder(
    BuildContext context,
    Widget child,
    int? frame,
    // This parameter is used to determine if the image was loaded synchronously.
    // ignore: avoid_positional_boolean_parameters
    bool wasSynchronouslyLoaded,
    Widget Function(BuildContext)? placeholderBuilder,
    VoidCallback? onImageLoaded,
  ) {
    if (wasSynchronouslyLoaded) {
      Future.microtask(() => onImageLoaded?.call());
      return child;
    }
    if (frame == null) {
      return placeholderBuilder?.call(context) ?? defaultPlaceholder(context);
    }
    Future.microtask(() => onImageLoaded?.call());
    return AnimatedOpacity(
      opacity: 1,
      duration: const Duration(milliseconds: 300),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final keyToUse = imageKey ?? ValueKey(path);
    final cacheKey = keyToUse is ValueKey ? keyToUse.value.toString() : null;

    if (_isSvg) {
      final svg = _isNetwork
          ? SvgPicture.network(
              path,
              key: keyToUse,
              width: width,
              height: height,
              fit: fit,
              colorFilter: colorFilter,
              placeholderBuilder: placeholderBuilder ?? defaultPlaceholder,
              errorBuilder: errorBuilder ?? (context, error, _) => defaultError(width: width, height: height, fit: fit),
            )
          : SvgPicture.asset(
              path,
              key: keyToUse,
              width: width,
              height: height,
              fit: fit,
              colorFilter: colorFilter,
              placeholderBuilder: placeholderBuilder ?? defaultPlaceholder,
              errorBuilder: errorBuilder ?? (context, error, _) => defaultError(width: width, height: height, fit: fit),
            );

      return Builder(
        builder: (context) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            onImageLoaded?.call();
          });
          return svg;
        },
      );
    }

    if (_isNetwork) {
      return CachedNetworkImage(
        imageUrl: path,
        key: keyToUse,
        cacheKey: cacheKey,
        width: width,
        height: height,
        maxHeightDiskCache: width != null ? (width! * 3).toInt() : null,
        maxWidthDiskCache: height != null ? (height! * 3).toInt() : null,
        fit: fit,
        placeholder: (context, url) => placeholderBuilder?.call(context) ?? defaultPlaceholder(context),
        errorWidget: (context, url, error) =>
            errorBuilder?.call(context, error, StackTrace.current) ??
            defaultError(width: width, height: height, fit: fit),
        imageBuilder: (context, imageProvider) {
          return Image(
            image: imageProvider,
            width: width,
            height: height,
            fit: fit,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                Future.microtask(() => onImageLoaded?.call());
                return child;
              }
              return placeholderBuilder?.call(context) ?? defaultPlaceholder(context);
            },
          );
        },
      );
    }

    return Image.asset(
      path,
      key: keyToUse,
      width: width,
      height: height,
      cacheHeight: width != null ? (width! * 3).toInt() : null,
      cacheWidth: height != null ? (height! * 3).toInt() : null,
      fit: fit,
      errorBuilder: errorBuilder ?? (context, error, _) => defaultError(width: width, height: height, fit: fit),
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
          fadeInFrameBuilder(context, child, frame, wasSynchronouslyLoaded, placeholderBuilder, onImageLoaded),
    );
  }
}
