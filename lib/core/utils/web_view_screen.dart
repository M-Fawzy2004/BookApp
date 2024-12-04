import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key, required this.url});

  final String url;

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();

    // تحقق من الرابط وضمان أنه يحتوي على scheme
    String validUrl = widget.url;

    // التأكد من إضافة http:// أو https://
    if (!validUrl.startsWith('http://') && !validUrl.startsWith('https://')) {
      validUrl = 'https://$validUrl'; // إضافة https إذا لم يكن موجودًا
    }

    // إذا كان الرابط صالح، تحميله
    if (validUrl.isNotEmpty) {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(validUrl)); // تحميل الرابط بعد التحقق
    } else {
      print('The URL is empty or invalid.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: WebViewWidget(controller: controller),
    );
  }

  // Method AppBar
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bookly',
            style: TextStyle(color: Colors.grey[800], fontSize: 17),
          ),
          const Text(
            'App',
            style: TextStyle(fontSize: 17, color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }
}
