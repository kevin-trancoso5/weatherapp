import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weatherapp/services/size_config.dart';

class MainContainer extends StatefulWidget {
  final Widget child;
  final bool canQuit;
  const MainContainer({required this.child, required this.canQuit});

  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(safeHeightBloc(context) * 2)),
            title: Text(
              'Voulez-vous quitter l\'application?',
              style: TextStyle(
                  fontSize: safeHeightBloc(context) * 2),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'Non',
                  style: TextStyle(
                      fontSize: safeHeightBloc(context) * 2.5),
                ),
              ),
              TextButton(
                onPressed: () =>
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
                child: Text(
                  'Oui',
                  style: TextStyle(
                      fontSize: safeHeightBloc(context) * 2.5),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: widget.canQuit ? _onWillPop : null,
        child: Scaffold(
            body: SafeArea(
                child: Container(
                    child:
                    widget.child))));
  }
}