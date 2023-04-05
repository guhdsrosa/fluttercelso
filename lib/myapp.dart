import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'calc_page.dart';
import 'home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: [
        GoRoute(
            path: "/",
            builder: (context, state) => const HomePage(),
            routes: [
              GoRoute(
                path: "calc/:imc/:igc",
                name: "calc",
                builder: (context, state) => CalcPage(
                  imc: state.params["imc"]!,
                  igc: state.params["igc"]!,
                ),
              )
            ]),
      ],
    );

    return MaterialApp.router(
      routerConfig: _router,
      title: 'App',
      debugShowCheckedModeBanner: false,
    );
  }
}
