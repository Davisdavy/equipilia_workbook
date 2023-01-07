import 'dart:async';
import 'package:equipilia/main.dart';
import 'package:equipilia/widgets/color.dart';
import 'package:equipilia/widgets/custom_bottom_nav_widget.dart';
import 'package:equipilia/widgets/small_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:page_transition/page_transition.dart';


class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  Future<InternetConnectionStatus> dataConnection() async{
    InternetConnectionStatus statusMain = InternetConnectionStatus.disconnected;
    final StreamSubscription<InternetConnectionStatus> listener =
    InternetConnectionChecker().onStatusChange.listen(
          (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            statusMain = InternetConnectionStatus.connected;
            break;
          case InternetConnectionStatus.disconnected:
            statusMain = InternetConnectionStatus.disconnected;
            break;
        }
      },
    );

    // close listener after 30 seconds, so the program doesn't run forever
    await Future<void>.delayed(const Duration(seconds: 1));
    await listener.cancel();
    return statusMain;
  }

  @override
  void initState() {
    timer = Timer(
        const Duration(seconds: 4),() => Navigator.pushReplacement(
        context,
        PageTransition(
            child: FutureBuilder<InternetConnectionStatus>(
                future: dataConnection(),
                builder: (context, AsyncSnapshot snapshot) {
                  switch(snapshot.connectionState){
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const Scaffold(
                        extendBodyBehindAppBar: true,
                        backgroundColor: AppColors.primaryThemeColor,
                        // body: Center(
                        //   child: Image.asset(
                        //     "assets/animations/jety.gif",
                        //     height: 200,
                        //   ),
                        // ),
                      );
                    default:
                      if(snapshot.hasError) {
                        return const Scaffold(
                          extendBodyBehindAppBar: true,
                          backgroundColor: AppColors.primaryThemeColor,
                          // body: Center(
                          //   child: Image.asset(
                          //     "assets/animations/jety.gif",
                          //     height: 200,
                          //   ),
                          // ),
                        );
                      } else if(snapshot.data ==  InternetConnectionStatus.disconnected) {
                        return Scaffold(
                          extendBodyBehindAppBar: true,
                          backgroundColor: AppColors.primaryThemeColor,
                          body: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Center(
                                //   child: Image.asset(
                                //     "assets/animations/jety.gif",
                                //     height: 200,
                                //   ),
                                // ),
                                const Center(child: SmallTextWidget(text: "You seem to be offline", color: AppColors.whiteThemeColor,)),
                                const SizedBox(height: 8.0,),
                                Center(
                                  child: InkWell(
                                    onTap: (){
                                      RestartWidget.restartApp(context);
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.0),
                                          color: AppColors.whiteThemeColor
                                      ),
                                      child: const Center(child: Text("Retry", style: TextStyle(color: AppColors.primaryThemeColor, fontSize: 14.0, fontWeight: FontWeight.bold),)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        Scaffold(
                          extendBodyBehindAppBar: true,
                          backgroundColor: AppColors.primaryThemeColor,
                          body: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Center(
                              //   child: Image.asset(
                              //     "assets/animations/jety.gif",
                              //     height: 200,
                              //   ),
                              // ),
                              const SmallTextWidget(text: "Something wrong happened!", color: AppColors.whiteThemeColor,),
                              const SizedBox(height: 8.0,),
                              InkWell(
                                onTap: (){
                                  RestartWidget.restartApp(context);
                                },
                                child: Container(
                                  height: 45,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: AppColors.whiteThemeColor
                                  ),
                                  child: const Center(child: Text("Retry", style: TextStyle(color: AppColors.whiteThemeColor, fontSize: 14.0, fontWeight: FontWeight.bold),)),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return const CustomNavigation();
                  }

                }),
            type: PageTransitionType.fade))
    );
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.primaryThemeColor,
      // body: Center(
      //   child: Image.asset(
      //     "assets/animations/jety.gif",
      //     height: 200,
      //   ),
      //),
    );
  }
}
