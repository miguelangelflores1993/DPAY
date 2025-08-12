import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sizer/sizer.dart';


/// Una clase para mostrar una imagen con zoom en un diálogo.
class ZoomableImageDialog extends StatelessWidget {
  const ZoomableImageDialog({
    required this.imageUrl,
    super.key,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    // Asegúrate de que ScreenUtil.init() se haya llamado previamente en tu aplicación
    // (normalmente en el main.dart o en el widget raíz).
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: SizedBox(
        // Usamos 45.h directamente aquí, asumiendo que ScreenUtil está inicializado.
        height: 45.h,
        child: PhotoView(
          backgroundDecoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 1.7,
          imageProvider: CachedNetworkImageProvider(imageUrl),
        ),
      ),
    );
  }

  /// Método estático conveniente para mostrar el diálogo.
  ///
  /// Recibe el [context] y la [imageUrl] de la imagen a mostrar.
  static Future<void> show(BuildContext context, String imageUrl) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return ZoomableImageDialog(imageUrl: imageUrl);
      },
    );
  }
}
