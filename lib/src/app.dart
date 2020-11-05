import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodels/home_viewmodel.dart';
import 'views/screens/home_screen.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
