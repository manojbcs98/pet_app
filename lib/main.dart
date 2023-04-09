import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'pet_preface.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(Home(savedThemeMode: savedThemeMode));
}

class Home extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const Home({this.savedThemeMode});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isMaterial = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child: PetPreface(
            savedThemeMode: widget.savedThemeMode,
            onChanged: () => setState(() => isMaterial = false)));
  }
}
