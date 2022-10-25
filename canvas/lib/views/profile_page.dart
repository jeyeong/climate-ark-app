import 'package:canvas/constants.dart';
import 'package:flutter/material.dart';
import 'package:canvas/components/profile/profile_picture.dart';
import 'package:canvas/components/profile/selection.dart';
import 'package:canvas/components/general/logo.dart';

class ProfilePage extends StatelessWidget {
  final String name;

  const ProfilePage({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryDarkColor,
        title: const Logo(width: 60.0),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            color: primaryWhite,
            width: 400.0,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(children: [
                      const ProfilePicture(),
                      Positioned(
                        bottom: 10,
                        right: 5,
                        child: MaterialButton(
                          onPressed: () {},
                          color: primaryColor,
                          textColor: Colors.white,
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          shape: const CircleBorder(),
                        ),
                      ),
                    ]),
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    Section(
                        title: 'Account Settings',
                        subtitle: 'Name, Password, Other Details',
                        icon: const Icon(
                          Icons.settings,
                          color: primaryColor,
                        )),
                    Section(
                        title: 'App Settings',
                        subtitle: 'Notifications, Dark Mode, Privacy',
                        icon: const Icon(
                          Icons.app_settings_alt,
                          color: primaryColor,
                        )),
                    Section(
                        title: 'Categories & Levels',
                        subtitle: 'Basic Level, Automotive',
                        icon: const Icon(
                          Icons.category,
                          color: primaryColor,
                        )),
                    Section(
                        title: 'About this App',
                        subtitle: 'App Info, License',
                        icon: const Icon(
                          Icons.info,
                          color: primaryColor,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
