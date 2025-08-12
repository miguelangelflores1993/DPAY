import 'package:app/core/config/go_router.dart';
import 'package:app/core/modules/conectivity/bloc/conectivity_bloc.dart';
import 'package:app/core/ui/theme/app_theme.dart';
import 'package:app/modules/auth/presentation/pages/menu/get_profile_bloc.dart';
import 'package:datec_latam_translations/datec_latam_translations.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityBloc>(create: (_) => ConnectivityBloc()),
       
        BlocProvider<GetProfileBloc>(create: (_) => GetProfileBloc()),
      ],
      child: EasyLocalizationWrapper(
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp.router(
              localizationsDelegates: EasyLocalizationWrapper.localizationDelegatesDatec(context),
              supportedLocales: EasyLocalizationWrapper.supportedLocalesDatec(context),
              locale: DevicePreview.locale(context),
              routerConfig: router,
              title: 'El GenioX',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              themeMode: ThemeMode.light,
              builder: EasyLoading.init(
                builder: (context, child) {
                  return FToastBuilder()(
                    context,
                    BlocListener<ConnectivityBloc, ConnectivityState>(
                      listener: (context, state) {
                        if (state == ConnectivityState.disconnected) {
                          showConnectivityToast(
                            context,
                            AppStrings.connectionLost,
                            Colors.black,
                          );
                        } else if (state == ConnectivityState.reconnecting) {
                          showConnectivityToast(
                            context,
                            AppStrings.connectionRestored,
                            Colors.green,
                          );
                        }
                      },
                      child: MediaQuery(
                        data: MediaQuery.of(context).copyWith(
                          textScaler: MediaQuery.of(context).textScaler.clamp(minScaleFactor: 0.8, maxScaleFactor: 1.2),
                        ),
                        child: child!,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void showConnectivityToast(
    BuildContext context,
    String message,
    Color color,
  ) {
    FToast()
        .init(context)
        .showToast(
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.wifi, color: Colors.white),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      message,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          gravity: ToastGravity.BOTTOM,
          toastDuration: const Duration(seconds: 10),
        );
  }
}
