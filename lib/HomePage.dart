import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/colors.dart' as color;
import 'package:ui/video_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info=[];
  _initData(){
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
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
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 70.0, left: 30, right: 30),
        child: Column(
          // columns can have many children
          children: [
            Row(
              children: [
                Text("Training",
                style: TextStyle(
                  fontSize: 30,
                  color: color.AppColor.homePageTitle,
                  fontWeight: FontWeight.w700,
                ),
                ),
                Expanded(child: Container()),
                Icon(Icons.arrow_back_ios,
                size: 20,
                  color: color.AppColor.homePageIcons,),
                const SizedBox(width: 10,),
                Icon(Icons.calendar_today_outlined,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
                const SizedBox(width: 15,),
                Icon(Icons.arrow_forward_ios,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
              ],
            ),
            // rows are use to help align the individual elements
            const SizedBox(height: 40,),
            Row(
              children: [
                Text("Your Program",
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageSubtitle,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(child: Container()),
                Text("Details",
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageDetail,
                  ),
                ),
                const SizedBox(width: 5,),
                InkWell(
                  onTap: (){
                    Get.to(()=>const VideoInfo());
                  },
                  child: Icon(Icons.arrow_forward,
                    size: 20,
                  color: color.AppColor.homePageIcons,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            // Container is used to help control the size and border radius
            Container(
              // media query is used to help cover entire container
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                // we introduce Linear gradient property to help fade the design color
                gradient: LinearGradient(colors: [
                  color.AppColor.gradientFirst.withOpacity(0.8),
                  color.AppColor.gradientSecond.withOpacity(0.9),
                ],
                  // use to direct the gradient
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(80),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                // we use box-show property to throw shadow
                boxShadow:  [
                  BoxShadow(
                    offset: const Offset(5, 10),
                    blurRadius: 10,
                    color: color.AppColor.gradientSecond //.withOpacity(0.01)
                  )
                ]
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Next workout",
                      style: TextStyle(
                        fontSize: 16,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
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
                    const SizedBox(height: 25,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.timer, size: 20,
                              color: color.AppColor.homePageContainerTextSmall,
                            ),
                          ],
                        ),
                        const SizedBox(width: 10,),
                        Text(
                          "60 min",
                          style: TextStyle(
                            fontSize: 14,
                            color: color.AppColor.homePageContainerTextSmall,
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: [
                              BoxShadow(
                                color: color.AppColor.gradientFirst,
                                blurRadius: 10,
                                offset: const Offset(4, 8),
                              )
                            ]
                          ),
                          child: const Icon(Icons.play_circle_fill,
                            color: Colors.white, size: 60,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5,),
            // this column host a stack which harbours several containers
            Column(
              children: [
                SizedBox(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      // this container was used to place image in a container
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(top: 20),
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: AssetImage(
                                  "assets/card.jpg"
                                ),
                                fit: BoxFit.fill
                              ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 40,
                              offset: const Offset(8, 10),
                              color: color.AppColor.gradientSecond
                            )
                          ]
                        ),
                      ),
                      // design for the image on container
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(right: 200, bottom: 30),
                        decoration: BoxDecoration(
                          //color: Colors.deepOrangeAccent.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: AssetImage(
                                    "assets/figure.png",
                                ),
                                //fit: BoxFit.fill
                            ),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 100,
                        //color: Colors.deepOrangeAccent.withOpacity(0.3),
                        margin: const EdgeInsets.only(left: 150, top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("You are doing great", style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: color.AppColor.homePageDetail
                            ),
                            ),
                            const SizedBox(height: 10,),
                            RichText(text: TextSpan(
                              text: "Keep it up\nStart here\n",
                              style: TextStyle(
                                color: color.AppColor.homePagePlanColor,
                                fontSize: 16,
                              ),
                              children: const [
                                TextSpan(
                                  text: "Stick to your plan"
                                )
                              ]
                            ),
                            ),
                          ],
                        ),

                      )
                    ],
                  ),

                ),
              ],
            ),
            Row(
              children: [
                Text("Area of Focus",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: color.AppColor.homePageTitle,
                ),
                ),
              ],
            ),
            Expanded(child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: MediaQuery.removePadding(context: context, removeTop: true,
                child: ListView.builder(
                  itemCount: info.length.toDouble()~/2,
                    itemBuilder: (_, i){
                    int a = 2*i;
                    int b = 2*i +1;
                      return Row(
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width-90)/2,
                            height: 170,
                            margin: const EdgeInsets.only(left: 30, bottom: 15, top: 15),
                            padding: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  offset: const Offset(5,5),
                                  color: color.AppColor.gradientSecond.withOpacity(0.2)
                                ),
                            BoxShadow(
                                blurRadius: 4,
                                offset: const Offset(-5,-5),
                                color: color.AppColor.gradientSecond.withOpacity(0.2)
                            )
                              ],
                              image: DecorationImage(
                                image: AssetImage(
                                  info[a]['img'],
                                ),
                              ),
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[a]["title"],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: color.AppColor.homePageDetail
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width-90)/2,
                            height: 170,
                            margin: const EdgeInsets.only(left:30, bottom: 15, top: 15),
                            padding: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    offset: const Offset(5,5),
                                    color: color.AppColor.gradientSecond.withOpacity(0.2)
                                ),
                                BoxShadow(
                                    blurRadius: 4,
                                    offset: const Offset(-5,-5),
                                    color: color.AppColor.gradientSecond.withOpacity(0.2)
                                )
                              ],
                              image: DecorationImage(
                                image: AssetImage(
                                  info[b]['img'],
                                ),
                              ),
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[b]["title"],
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: color.AppColor.homePageDetail
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                ),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
