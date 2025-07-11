import 'package:flutter/material.dart';
import 'package:matajer_app/theme_controller.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isDark = ThemeController.isDarkMode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Toggle app theme'),
            value: isDark,
            onChanged: (value) async {
              setState(() {
                isDark = value;
              });
              await ThemeController.toggleTheme(value);
            },
          ),
        ],
      ),
    );
  }
}
