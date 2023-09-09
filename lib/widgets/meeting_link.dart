

import 'package:flutter/material.dart';
import 'package:stress_management_app/utils/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MeetingLink extends StatefulWidget {
  const MeetingLink({super.key});

  @override
  State<MeetingLink> createState() => _MeetingLinkState();
}

class _MeetingLinkState extends State<MeetingLink> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://meet.google.com/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meeting Link', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: kLeadBlack,
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
