import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sslmixes/core/common/di/injection.dart';
import 'package:sslmixes/features/mixes/presentation/bloc/get_mixes_bloc.dart';
import 'package:sslmixes/features/mixes/presentation/pages/mixes_page.dart';

void main()  async{
   configureDependencies();
  EquatableConfig.stringify = kDebugMode;
  if (kDebugMode) {
    await dotenv.load(fileName: ".dev.env");
  } else {
    await dotenv.load(fileName: ".env");
  }

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => getIt<GetMixesBloc>(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SSL Pinning Mixes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MixesPage(),
    );
  }
}
