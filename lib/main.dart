import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("first page ")),
      body: Center(
        child: RaisedButton(
          onPressed: () async {

            var message = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context){
                return SecondPage("messageFromFirstPage");
              },
              //ここにtrue追加するとモーダル遷移に変わる
              //モーダルの場合ヘッダーーが✖︎に変わってくれる、Frameworkのおかげ
              
              fullscreenDialog: true),
            );
            print(message);
          },
          child: Text("next page "),
          ),
        ),
      );
  }
}

class SecondPage extends StatelessWidget{

  final String messageFromFirstPage;
  SecondPage(this.messageFromFirstPage);
  


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("second page")),
      body:  Center(
        child: RaisedButton(
            onPressed: (){
              Navigator.pop(context, "!!!!!!!back to seconpage");
            },
            child: Text("go back "),
          ),
        ),
    );
  }
}