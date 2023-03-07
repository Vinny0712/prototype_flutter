import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:eldtech_sos/signUp/signUpBloc.dart';
import 'package:eldtech_sos/spokenLang/spokenLangBloc.dart';
import'appLang/appLangBloc&Event&State.dart';
import 'route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider<appLangBloc>(
          create: (BuildContext context) => appLangBloc(),
        ),
        BlocProvider<signUpBloc>(
          create: (context) => signUpBloc(),
        ),
        BlocProvider<spokenLangBloc>(
          create: (context) => spokenLangBloc(),
        ),

      ],

      child: BlocBuilder<appLangBloc,String>(
        builder:(context,langCode){
          return MaterialApp(
          routes: routes,
          initialRoute: FirebaseAuth.instance.currentUser == null?signupLoginRoute:permissionsRoute,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(langCode),
          );
          },//builder
      ),
    );
  }
}




