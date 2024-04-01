import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:midterm_app/pages/about.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Column(
        children: [
          MaterialButton(
            highlightColor: Colors.white,
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const About())),
            child: const Row(
              children: [
                FaIcon(FontAwesomeIcons.circleQuestion),
                SizedBox(
                  width: 22,
                ),
                Text(
                  'About',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          MaterialButton(
            highlightColor: Colors.white,
            onPressed: () {},
            child: const Row(
              children: [
                FaIcon(FontAwesomeIcons.code),
                SizedBox(
                  width: 16,
                ),
                Text(
                  'Development Team',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          MaterialButton(
            highlightColor: Colors.white,
            onPressed: () {},
            child: const Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.rotateRight,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 22,
                ),
                Text(
                  'Reset App Data',
                  style: TextStyle(
                      fontFamily: 'Poppins', fontSize: 20, color: Colors.red),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
