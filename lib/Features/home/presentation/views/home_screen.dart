import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_heart/Core/constance/app_colors.dart';
import 'package:my_heart/Core/constance/app_function.dart';
import 'package:my_heart/Features/home/presentation/views/widgets/stop_and_play_alert_button.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Core/constance/assets_manager.dart';
import '../../../../Core/servises/firebase_servise.dart';
import '../../../../Core/widgets/loading_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPlayed = false;
  int heartRateNum = 0;

  Color heartRateColor = Colors.green;

  @override
  void dispose() {
    AppFunctions.assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DataSnapshot>(
      stream: FirebaseDataService().dataStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          DataSnapshot? data = snapshot.data;
          if (data!.value != null) {
            Object? o2Value =
                snapshot.data!.child('now').child('Oximeter SpO2 Value').value;
            print(o2Value);
            if ((o2Value is int && o2Value > 100) ||
                (o2Value is int && o2Value < 95)) {
              AppFunctions.playAlert();
              AppFunctions.sendAlertMessage(ratio: o2Value);
              isPlayed = true;
              heartRateColor = Colors.red;
            } else {
              AppFunctions.pauseAlert();
              isPlayed = false;
              heartRateColor = Colors.green;
            }
            return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.primaryColor,
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Shimmer.fromColors(
                      period: const Duration(seconds: 2),
                      baseColor: Colors.black,
                      highlightColor: Colors.white,
                      child: const Text(
                        'O2 App',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      AssetsManager.appImage,
                      width: MediaQuery.of(context).size.width * 0.13,
                    ),
                  ],
                ),
              ),
              body: SafeArea(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        AssetsManager.backgroundImage,
                      ),
                      fit: BoxFit.contain,
                      opacity: 0.3,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                width: 3,
                                color: Colors.black,
                              )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$o2Value %',
                                style: TextStyle(
                                  color: heartRateColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 80,
                                ),
                              ),
                              Image.asset(
                                AssetsManager.heartRate,
                                width: MediaQuery.of(context).size.width * 0.3,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        if ((o2Value is int && o2Value > 100) ||
                            (o2Value is int && o2Value < 95))
                          StopPlayAlert(
                            isPlayed1: isPlayed,
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                        if ((o2Value is int && o2Value > 100) ||
                            (o2Value is int && o2Value < 95))
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                )),
                            child: MaterialButton(
                              height: MediaQuery.of(context).size.width * 0.14,
                              onPressed: () {
                                AppFunctions.sendAlertMessage(ratio: o2Value);
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Share your state',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  Icon(
                                    Icons.share,
                                    color: Colors.blue,
                                    size: 28,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const LoadingScreen();
          }
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}
