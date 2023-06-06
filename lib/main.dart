import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:responsiveapp/large/homepageLarge.dart';
import 'package:responsiveapp/medium/homepageMedium.dart';
import 'package:responsiveapp/small/homepageSmall.dart';
import 'package:responsiveapp/util/responsive.dart';

// void main() {
//   runApp(MyApp());
// }
void main() => runApp(
     MyApp(),
      
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder, // <--- /!\ Add the builder

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

   late Widget widget;
    switch (getScreenSize(width)) {
      case ScreenSize.small:
        widget = HomePageSmall();

        break;
      case ScreenSize.medium:
        widget = HomePageMedium();

        break;
      case ScreenSize.large:
        widget = HomePageLarge();

        break;
      default:
    }
    return widget;
  }
}
