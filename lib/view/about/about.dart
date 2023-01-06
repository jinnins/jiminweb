import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../responsive.dart';
import 'aboutMobile.dart';
import 'aboutTab.dart';
import 'aboutWeb.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      webView: AboutWeb(),
      tabView: AboutTab(),
      mobileView: AboutMobile(),
    );
  }
}