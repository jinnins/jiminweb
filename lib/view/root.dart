import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiminweb/view/widget/appBar.dart';
import 'package:jiminweb/view/widget/leftPane.dart';
import 'package:jiminweb/view/widget/rightPane.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../controller/generalController.dart';
import '../resource/appClass.dart';

class RootScreen extends ConsumerStatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends ConsumerState<RootScreen> {
  final aScrollController = AutoScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              ref.read(scrollControlProvider.notifier).state = false;
            } else if (direction == ScrollDirection.forward) {
              ref.read(scrollControlProvider.notifier).state = true;
            }
            return true;
          },
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xff112240),
                      Color(0xff0a192f),
                      Color(0xff020c1b)
                    ])),
            height: AppClass().getMqHeight(context),
            child: Column(
              children: [
                Consumer(builder: (context, ref, child) {
                  var isScrollingUp = ref.watch(scrollControlProvider);
                  return AnimatedOpacity(
                    opacity: isScrollingUp ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: ActionBar(aScrollController),
                  );
                }),
                Expanded(
                  child: () {
                    ScreenType scrType = AppClass().getScreenType(context);
                    return Row(
                      children: [
                        scrType == ScreenType.mobile ? SizedBox() : LeftPane(),
                        Expanded(
                            flex: 8,
                            child: ListView(
                              controller: aScrollController,
                              children: [

                              ],
                            )),
                        scrType == ScreenType.mobile ? SizedBox() : RightPane(),
                      ],
                    );
                  }(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}