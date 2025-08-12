// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebView extends StatefulWidget {
//   const WebView({required this.url, super.key});
//   final String url;

//   @override
//   WebViewState createState() => WebViewState();
// }

// class WebViewState extends State<WebView> {
//   late final WebViewController controller;
//   int loadingPercentage = 0;

//   @override
//   void initState() {
//     super.initState();
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(Colors.white)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onPageStarted: (url) {
//             print('On page started url : $url');
//             setState(() {
//               loadingPercentage = 0;
//             });
//           },
//           onNavigationRequest: (request) {
//             print('On navigation request : ${request.url}');
//             return NavigationDecision.navigate;
//           },
//           onHttpError: (error) {
//             print('On HTTP error : ${error.response} ');
//             setState(() {
//               loadingPercentage = 0;
//             });
//           },
//           onHttpAuthRequest: (request) {
//             print('On HTTP auth request : ${request.host}');
//           },
//           onWebResourceError: (error) {
//             print('On web resource error : ${error.description}');
//             setState(() {
//               loadingPercentage = 0;
//             });
//           },
//           onProgress: (progress) {
//             print('Page progress : $progress');
//             setState(() {
//               loadingPercentage = progress;
//             });
//           },
//           onPageFinished: (url) {
//             print('On Page finished Url : $url');
//             setState(() {
//               loadingPercentage = 100;
//             });
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse(widget.url));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: WebViewWidget(controller: controller),
//     );
//   }
// }
