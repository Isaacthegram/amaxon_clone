import 'package:amaxonclone/constants/global_variables.dart';
import 'package:amaxonclone/features/admin/screens/admin_screen.dart';
import 'package:amaxonclone/features/auth/screens/auth_screen.dart';
import 'package:amaxonclone/features/auth/services/auth_service.dart';
import 'package:amaxonclone/features/home/screens/home_screen.dart';
import 'package:amaxonclone/providers/user_provider.dart';
import 'package:amaxonclone/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/widgets/bottom_bar.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider(),),
  ],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData(context);
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amaxon Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black
          )
        ),
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,

        ),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
          ? const BottomBar()
          : const AdminScreen()
          : const AdminScreen()
    );
  }
}
