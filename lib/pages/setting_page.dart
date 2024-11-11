import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tdl_app/library/provider/theme_provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "S E T T I N G ",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Switch to Dark Mode",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                CupertinoSwitch(
                    value: Provider.of<ThemeProvider>(context, listen: false)
                        .isDarkMode,
                    onChanged: (value) =>
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggleSwitch())
              ],
            ),
          )
        ],
      ),
    );
  }
}
