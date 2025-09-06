// ignore_for_file: library_private_types_in_public_api

import 'package:ev_tech_user/Widget/custom_text.dart';
import 'package:flutter/material.dart';

class NoConnectionScreen extends StatefulWidget {
  const NoConnectionScreen({super.key});

  @override
  _NoConnectionScreenState createState() => _NoConnectionScreenState();
}

class _NoConnectionScreenState extends State<NoConnectionScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.network_wifi),
              SizedBox(height: 20),
              CustomText(text: 'No Internet Connection', fontSize: 20, fontWeight: FontWeight.bold)
            ],
          ),
        ),
      ),
    );
  }
}
