import 'package:rive/rive.dart';

class RiveModel {
  final String src, artboard, stateMachineName;
  late SMIBool? status;
  set setStat(SMIBool stat) {
    status = stat;
  }

  RiveModel({
    required this.src,
    required this.artboard,
    required this.stateMachineName,
  });
 static List<RiveModel> bottomNavItems = [
    RiveModel(
        src: "assets/animated-icons.riv",
        artboard: "HOME",
        stateMachineName: "HOME_Interactivity"),
    RiveModel(
        src: "assets/animated-icons.riv",
        artboard: "HOME",
        stateMachineName: "HOME_Interactivity"),
    RiveModel(
        src: "assets/animated-icons.riv",
        artboard: "HOME",
        stateMachineName: "HOME_Interactivity"),
    
  ];
}
