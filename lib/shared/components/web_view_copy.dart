// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// class WebView extends StatefulWidget {
//   const WebView({required this.url, super.key});
//   final String url;

//   @override
//   WebViewState createState() => WebViewState();
// }

// class WebViewState extends State<WebView> {
//   int loadingPercentage = 0;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: InAppWebView(
//         onProgressChanged: (InAppWebViewController inAppWebViewController, int progress) {},
//         onWebViewCreated: (InAppWebViewController inAppWebViewController) {},
//         onReceivedServerTrustAuthRequest: (controller, challenge) async {
//           print(challenge);
//           return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
//         },
//         initialUrlRequest: URLRequest(
//           url: WebUri.uri(Uri.parse('https://stagingpasarela.datec.com.bo/linkdepago/BERiMarE4QC83RWj2')),
//         ),
//       ),
//     );
//   }
// }
