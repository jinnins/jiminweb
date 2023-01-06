import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../responsive.dart';
import 'introMobile.dart';
import 'introTab.dart';
import 'introWeb.dart';


class IntroContent extends StatefulWidget {

  IntroContent({Key? key}) : super(key: key);

  @override
  State<IntroContent> createState() => _IntroContentState();
}

class _IntroContentState extends State<IntroContent> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      tabView: IntroTab(),
      mobileView: IntroMobile(),
      webView: IntroWeb(),
    );
  }
}