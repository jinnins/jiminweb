import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../controller/generalController.dart';
import '../../resource/appClass.dart';
import '../../resource/colors.dart';

class ActionBar extends ConsumerStatefulWidget with PreferredSizeWidget {
  final AutoScrollController controller;

  ActionBar(this.controller, {Key? key}) : super(key: key);

  @override
  ConsumerState<ActionBar> createState() => _ActionBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ActionBarState extends ConsumerState<ActionBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        padding: EdgeInsets.only(right: 55.0, top: 33.0),
        child: () {
          ScreenType scrType = AppClass().getScreenType(context);
          if (scrType == ScreenType.mobile || scrType == ScreenType.tab) {
            return Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Image.asset(
                        'assets/svg/kcLogo.png',
                        width: AppClass().getMqWidth(context) * 0.5,
                        height: AppClass().getMqHeight(context) * 0.5,
                      ),
                    )),
                Expanded(
                  flex: 9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PopupMenuButton(
                        color: AppColors().cardColor,
                        itemBuilder: (c) => <PopupMenuEntry>[
                          PopupMenuItem(
                            child: Container(
                                width: 90.0,
                                child: InkWell(
                                  onTap: () => widget.controller.scrollToIndex(
                                      1,
                                      preferPosition: AutoScrollPosition.begin),
                                  child: Row(
                                    children: [
                                      Icon(Icons.account_circle_rounded,
                                          size: 18),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          'About',
                                          style: GoogleFonts.roboto(),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                          PopupMenuItem(
                            child: InkWell(
                              onTap: () => widget.controller.scrollToIndex(2,
                                  preferPosition: AutoScrollPosition.begin),
                              child: Row(
                                children: [
                                  Icon(Icons.travel_explore_rounded, size: 18),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Experience',
                                      style: GoogleFonts.roboto(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            child: InkWell(
                              onTap: () => widget.controller.scrollToIndex(3,
                                  preferPosition: AutoScrollPosition.begin),
                              child: Row(
                                children: [
                                  Icon(Icons.computer_rounded, size: 18),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Work',
                                      style: GoogleFonts.roboto(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                        child: Icon(Icons.menu_rounded, size: 25),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
          return Row(
            children: [
              Expanded(child: Image.asset('assets/svg/appLogo.png')),
              Expanded(
                flex: 9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    /*Text(scrType.name),*/
                    InkWell(
                      onTap: () {
                        widget.controller.scrollToIndex(1,
                            preferPosition: AutoScrollPosition.begin);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Row(
                          children: [
                            Text("01. About",
                                style: TextStyle(
                                    color: AppColors().neonColor,
                                    fontSize: 13,
                                    fontFamily: 'sfmono')),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        widget.controller.scrollToIndex(2,
                            preferPosition: AutoScrollPosition.begin);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Row(
                          children: [
                            Text("02. Experience",
                                style: TextStyle(
                                    color: AppColors().neonColor,
                                    fontSize: 13,
                                    fontFamily: 'sfmono')),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        widget.controller.scrollToIndex(3,
                            preferPosition: AutoScrollPosition.begin);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Row(
                          children: [
                            Text("03. Work",
                                style: TextStyle(
                                    color: AppColors().neonColor,
                                    fontSize: 13,
                                    fontFamily: 'sfmono')),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }());
  }
}