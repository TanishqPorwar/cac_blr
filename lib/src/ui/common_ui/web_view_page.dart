import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  String _url;
  WebViewPage(this._url);
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: _url,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
