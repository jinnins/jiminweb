import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/generalController.dart';
import '../../model/experienceModel.dart';
import '../../resource/appClass.dart';
import '../../resource/colors.dart';
import '../../resource/strings.dart';

class ExperienceWeb extends StatefulWidget {
  const ExperienceWeb({Key? key}) : super(key: key);

  @override
  State<ExperienceWeb> createState() => _ExperienceWebState();
}

class _ExperienceWebState extends State<ExperienceWeb> {
  @override
  Widget build(BuildContext context) {
    List<ExperienceModel> experienceList = [
      ExperienceModel(
          desig: Strings.expDesig1,
          compName: Strings.expCompName1,
          duration: Strings.expDur1,
          points: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(
                      width: AppClass().getMqWidth(context) * 0.35,
                      child: Text(
                        Strings.expAbout1,
                        style: TextStyle(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 20,
                            fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: AppColors().neonColor,
                        size: 20,
                      ),
                    ),
                    Container(
                      width: AppClass().getMqWidth(context) * 0.35,
                      child: Text(
                        Strings.expAbout1_2,
                        style: TextStyle(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 20,
                            fontFamily: 'sfmono'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    ];

    return Container(
      height: AppClass().getMqHeight(context) - 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    text: "02.",
                    style: TextStyle(
                        color: AppColors().neonColor,
                        fontSize: 20,
                        fontFamily: 'sfmono'),
                    children: <TextSpan>[
                      TextSpan(
                        text: ''' Where I've Worked''',
                        style: GoogleFonts.robotoSlab(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      )
                    ]),
              ),
            ],
          ),
          Container(
              width: AppClass().getMqWidth(context) * 0.6,
              margin: EdgeInsets.only(top: 30.0, left: 30.0),
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: experienceList[0].desig,
                              style: GoogleFonts.roboto(
                                  color: AppColors().textColor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontSize: 25),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' @${experienceList[0].compName}',
                                  style: GoogleFonts.roboto(
                                      color: AppColors().neonColor,
                                      fontSize: 20),
                                )
                              ]),
                        ),
                        Text(
                          experienceList[0].duration.toString(),
                          style: TextStyle(
                              color: AppColors().textLight,
                              letterSpacing: 1,
                              height: 1.5,
                              fontSize: 14,
                              fontFamily: 'sfmono'),
                        ),
                        experienceList[0].points!
                      ],
                    ),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}