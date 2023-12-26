import 'dart:convert';


import 'package:amaxonclone/features/home/screens/home_screen.dart';
import 'package:amaxonclone/models/user.dart';
import 'package:amaxonclone/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/error_handling.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';

class AuthService {
  get response => null;


    //sign up user
    void signUpUser({
        required BuildContext context,
        required String email,
        required String password,
        required String name,

    }) async {
        try {
            User user = User(
                id: '', 
                name: name, 
                password: password,
                email: email, 
                address: '', 
                type: '', 
                token: '',
            );  

            http.Response res = await http.post(
                Uri.parse('$uri/api/signin'),
                body: user.toJson(),
                headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                },
                );
               
               httpErrorHandle(
                response: response, 
                context: context, 
                onSuccess: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    Provider.of<UserProvider>(context, listen: false).setUser(res.body);
                    await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
                    Navigator.pushAndRemoveUntil(context, HomeScreen.routeName as Route<Object?>, (route) => false);

                },
               );
        } catch (e) {
            showSnackBar(context, e.toString());
        }
    }
}