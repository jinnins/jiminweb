import 'package:flutter/material.dart';
import 'styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/workModel.dart';

enum ScreenType { mobile, tab, web }

class AppClass {
  static final AppClass _mAppClass = AppClass._internal();
  static BuildContext? lastContext;
  ScrollController controller = ScrollController();

  List<String> projectImageList = [
    "assets/svg/library.png",
    "assets/svg/mobile.png",
    "assets/svg/ecd.png",
    "assets/svg/cadvizor.png",
  ];

  List<WorkModel> projectList = [
    WorkModel(
        projectTitle: "Library Module",
        projectContent:
        "AWS/MongoDB 구축 및 마이그레이션, Library 모듈 개발",
        tech1: "Windows",
        tech2: ".Net/C#",
        tech3: "MongoDB"),
    WorkModel(
        projectTitle: "CAD Mobile/Web",
        projectContent: "Github 및 Github action을 통한 CI/CD 파이프라인 구축, 라이브러리 및 도면 뷰어 웹/앱 개발",
        tech1: "Cross Platform",
        tech2: "Flutter",
        tech3: "Dart"),
    WorkModel(
        projectTitle: "산출물 비교 프로그램",
        projectContent:
        '''엑셀 양식에 맞는 설계 산출물 비교 프로그램 개발''',
        tech1: "Algorithm",
        tech2: ".Net/C#",
        tech3: " "),
    WorkModel(
        projectTitle: "CAD 기능개발",
        projectContent:
        '''타 부서와 업무 협업을 통한 기능 개발''',
        tech1: "Windows",
        tech2: ".Net/C#",
        tech3: " "),
  ];

  factory AppClass() {
    return _mAppClass;
  }

  AppClass._internal();

  getMqWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  getMqHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  showSnackBar(String msg, {BuildContext? context}) {
    ScaffoldMessenger.of(context ?? lastContext!)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  ScreenType getScreenType(BuildContext context) {
    double scrWidth = getMqWidth(context);
    if (scrWidth > 915) {
      return ScreenType.web;
    } else if (scrWidth < 650) {
      return ScreenType.mobile;
    }
    return ScreenType.tab;
  }

  alertDialog(context, title, msg) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
            title: Text(title, style: TxtStyle().boldWhite(context)),
            content: Text(msg),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: () => Navigator.pop(context),
                  child: Text('Okay'))
            ]));
  }
}
