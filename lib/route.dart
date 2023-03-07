//external

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//local
import 'signUpOrLogin.dart';
import 'signUpMethod.dart';
import 'appLang/appLocale.dart';
import 'role/role.dart';
import 'spokenLang/spokenLang.dart';


import'signUp/UI/smsPinSignUp.dart';
import 'permissions.dart';
import 'signUp/UI/signUpPg.dart';


const String signupLoginRoute = '/';
const String signupMethodRoute = '/signupMethod';
const String appLocaleRoute = '/appLocale';
const String roleRoute = '/role';
const String spokenLangRoute = '/spokenLang';
const String signUpPgRoute = '/signUpPg';
const String smsPinSignUpRoute = '/smsPinSignUp';
const String permissionsRoute = '/permissions';

Map<String,Widget Function(BuildContext)> routes = {
  signupLoginRoute: (context) => const signUpOrLogin(),
  signupMethodRoute:(context) => const signUpMethod(),
  appLocaleRoute: (context)=> const appLocale(),
  roleRoute:(context)=> const role(),
  spokenLangRoute:(context)=>  spokenLang(),
  signUpPgRoute:(context)=> const signUpPg(),
  smsPinSignUpRoute:(context)=>const smsPinSignUp(),
  permissionsRoute:(context)=>const permissions(),
};