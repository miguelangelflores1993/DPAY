import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GenericWebView extends StatefulWidget {
  const GenericWebView({required this.url, super.key});

  final String url;

  @override
  State<GenericWebView> createState() => _GenericWebViewState();
}

class _GenericWebViewState extends State<GenericWebView> {
  late final WebViewController _controller;
  int _loadingPercentage = 0;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) {
            setState(() => _loadingPercentage = 0);
          },
          onProgress: (progress) {
            setState(() => _loadingPercentage = progress);
          },
          onPageFinished: (_) {
            setState(() => _loadingPercentage = 100);
          },
          onWebResourceError: (error) {
            developer.log('Web resource error: ${error.description}');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (_loadingPercentage < 100)
              const Center(
                child: CircularProgressIndicator(),
              ),
            //boton para atras
            Positioned(
              top: 0.6.h,
              left: 2.2.w,
              child: IconButton(
                padding: EdgeInsets.zero,
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  context.pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
