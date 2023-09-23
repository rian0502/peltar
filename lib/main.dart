import 'package:flutter/material.dart';
import 'package:peltar/route/app_route.dart';
import 'package:peltar/utils/mypeltar_theme.dart';
import 'package:peltar/viewmodel/assets_viewmodel.dart';
import 'package:peltar/viewmodel/form_inspection_viewmodel.dart';
import 'package:peltar/viewmodel/login_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final LoginViewModel loginViewModel = LoginViewModel();
  loginViewModel.initializeApp();
  runApp(MyPeltar(loginViewModel: loginViewModel));
}

class MyPeltar extends StatefulWidget {
  final LoginViewModel loginViewModel;
  const MyPeltar({super.key, required this.loginViewModel});

  @override
  State<MyPeltar> createState() => _MyPeltarState();
}

class _MyPeltarState extends State<MyPeltar> {
  late final AppRoute _appRoute = AppRoute(widget.loginViewModel);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LoginViewModel>(
            create: (context) => widget.loginViewModel,
          ),
          ChangeNotifierProvider<AssetsViewModel>(
              create: (context) => AssetsViewModel()),
          ChangeNotifierProvider<FormInspectionViewModel>(
            create: (context) => FormInspectionViewModel()),
        ],
        child: MaterialApp.router(
          title: 'Peltar',
          theme: MyPeltarTheme.light(),
          routeInformationParser: _appRoute.router.routeInformationParser,
          routerDelegate: _appRoute.router.routerDelegate,
          routeInformationProvider: _appRoute.router.routeInformationProvider,
        ));
  }
}
