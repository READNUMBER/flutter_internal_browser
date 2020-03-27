import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internal_browser/internal_browser.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Internal Browser'),
          ),
          body: Center(
            child: RaisedButton(
              child: Text('Open Url'),
              onPressed: () async {
                final url = 'http://www.readnumber.com';
                try {
                  await InternalBrowser.open(url);
                } catch (e) {
                  await showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: Text('Error'),
                      content: Text('${e ?? '실행할 수 있는 앱이 없습니다.'}'),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      );
}
