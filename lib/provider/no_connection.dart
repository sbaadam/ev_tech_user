// ignore_for_file: library_private_types_in_public_api

import 'package:ev_tech_user/provider/no_connection_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/connectivity_provider.dart';

class XOnline extends StatefulWidget {
  final Widget child;
  const XOnline({super.key, required this.child});

  @override
  _XOnlineState createState() => _XOnlineState();
}

class _XOnlineState extends State<XOnline> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<ConnectivityProvider>(context).isConnected
        ? widget.child
        : const NoConnectionScreen();
  }
}
