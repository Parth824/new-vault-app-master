import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:untitled/config/app_color.dart';

import '../../config/size_config.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.url});

  final String url;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  InAppWebViewController? webViewController;
  var initialUrl = "";
  TextEditingController textEditingController = TextEditingController();
  double _progress = 0;
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
        var isLastPage = await webViewController!.canGoBack();
        if (isLastPage) {
          webViewController!.goBack();
          return false;
        }
        return true;
      },
      child: Scaffold(

        body: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight *0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(16)),
              child: TextFormField(
                onFieldSubmitted: (value) async {
                  if(value.contains(".")){
                    initialUrl = "https://";
                    initialUrl += value;
                  }
                  else {
                    initialUrl = "https://www.google.com/search?q=";
                    initialUrl += value;
                  }
                  await webViewController?.loadUrl(
                    urlRequest: URLRequest(
                      url: Uri.parse(initialUrl),
                    ),
                  );
                },
                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(getProportionateScreenHeight(13)),
                  ),
                  hintText: "Enter url or website name",
                  prefixIcon: ImageIcon(
                    const AssetImage("assets/images/search.png"),
                    color: Colors.black,
                    size: getProportionateScreenHeight(20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight *0.01,
            ),
            _progress < 1
                ? LinearProgressIndicator(
              minHeight: 1,
              color: AppColors.primaryColor,
              value: _progress,
            )
                : const SizedBox(),
            SizedBox(
              height: SizeConfig.screenHeight *0.01,
            ),
            Expanded(
              child: InAppWebView(
                onWebViewCreated: (controller) =>
                webViewController = controller,
                initialUrlRequest: URLRequest(
                  url: Uri.parse(widget.url),
                ),
                onProgressChanged: (controller, progress) {
                  setState(() {
                    _progress = progress / 100;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
