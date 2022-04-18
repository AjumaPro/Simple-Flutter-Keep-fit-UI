import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'colors.dart' as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List info=[];
  _initData(){
    DefaultAssetBundle.of(context).loadString("json/videoinfo.json").then((value) {
      info= json.decode(value);
    });
  }

  @override
  void initState(){
    super.initState();
    _initData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.AppColor.gradientFirst,
                color.AppColor.gradientSecond,
              ],
              begin: const FractionalOffset(0.0, 0.2),
              end: Alignment.topRight
            )
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back_ios,
                          size: 20,
                            color: color.AppColor.secondPageIconColor,
                          ),
                        ),
                        Expanded(child: Container()),
                        Icon(Icons.info_outline,
                          size: 20,
                          color: color.AppColor.secondPageIconColor,
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Leg Toning",
                      style: TextStyle(
                        fontSize: 26,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      "and Glutes Workout",
                      style: TextStyle(
                        fontSize: 26,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    const SizedBox(height: 50,),
                    Row(
                      children: [
                        Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                color.AppColor.secondPageContainerGradient1stColor,
                                color.AppColor.secondPageContainerGradient2ndColor
                              ]
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.timer_outlined,
                              size: 20,
                                color: color.AppColor.secondPageIconColor,
                              ),
                              const SizedBox(width: 5,),
                              Text("68 min",
                              style: TextStyle(
                                fontSize: 16,
                                color: color.AppColor.secondPageIconColor,
                              ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Container(
                          width: 220,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  color.AppColor.secondPageContainerGradient1stColor,
                                  color.AppColor.secondPageContainerGradient2ndColor
                                ]
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.handyman_rounded,
                                size: 20,
                                color: color.AppColor.secondPageIconColor,
                              ),
                              const SizedBox(width: 5,),
                              Text("Resilient is Hallmark",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: color.AppColor.secondPageIconColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 30,),
                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        Text(
                            "Circuit 1: Legs Toning",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.circuitsColor
                          ),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Icon(Icons.loop_sharp,
                              size: 30,
                              color:color.AppColor.loopColor,),
                            const SizedBox(width: 10,),
                             Text(
                                "3 sets",
                              style: TextStyle(
                                fontSize: 15,
                                color: color.AppColor.setsColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20,),
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}