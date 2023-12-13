import 'package:flutter/material.dart';
import 'package:my_heart/Core/constance/app_function.dart';

class StopPlayAlert extends StatefulWidget {
  const StopPlayAlert({Key? key, required this.isPlayed1}) : super(key: key);

  final bool isPlayed1;
  @override
  State<StopPlayAlert> createState() => _StopPlayAlertState();
}

class _StopPlayAlertState extends State<StopPlayAlert> {
  bool isPlayed2 = false;
  @override
  void initState() {
    isPlayed2 = widget.isPlayed1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black,
        width: 2,
      )),
      child: MaterialButton(
        height: MediaQuery.of(context).size.width * 0.14,
        onPressed: () {
          isPlayed2 ? AppFunctions.pauseAlert() : AppFunctions.playAlert();

          setState(() {
            isPlayed2 = !isPlayed2;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isPlayed2 ? 'Stop Alert' : 'Play Alert',
              style: TextStyle(
                color: isPlayed2 ? Colors.red : Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Icon(
              isPlayed2 ? Icons.stop : Icons.play_arrow,
              color: isPlayed2 ? Colors.red : Colors.green,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
