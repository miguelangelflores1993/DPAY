import 'package:app/homeview.dart';
import 'package:app/modules/auth/presentation/pages/forgot_password/forgot_password_page.dart';
import 'package:app/modules/auth/presentation/pages/login/login_page.dart';
import 'package:app/modules/auth/presentation/pages/otp/otp_verification_page.dart';
import 'package:app/modules/auth/presentation/pages/otp/retry_otp_verification_page.dart';
import 'package:app/modules/auth/presentation/pages/register/register_page.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

class FadeSlideTransitionPage extends CustomTransitionPage<void> {
  FadeSlideTransitionPage({required super.child, required super.key})
    : super(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Animar opacidad y posición
          final curveTween = CurveTween(curve: Curves.easeInOut);
          final fadeAnimation = animation.drive(curveTween);

          // Efecto de deslizamiento sutil desde abajo
          const beginOffset = Offset(0, 0.05); // Un deslizamiento muy sutil
          const endOffset = Offset.zero;
          final slideAnimation = Tween(
            begin: beginOffset,
            end: endOffset,
          ).chain(curveTween).animate(animation);

          return FadeTransition(
            opacity: fadeAnimation,
            child: SlideTransition(position: slideAnimation, child: child),
          );
        },
        transitionDuration: const Duration(milliseconds: 250),
        reverseTransitionDuration: const Duration(milliseconds: 200),
      );
}

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/login', // Ruta de inicio
  routes: [
    GoRoute(
      path: '/forgot_password',
      name: 'forgot_password',
      builder: (context, state) => const ForgotPasswordPage(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => HomeView(),
    ),

    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => RegisterPage(),
    ),
    GoRoute(
      path: '/otp',
      name: 'otp',
      builder: (context, state) => OTPVerificationPage(),
    ),
    GoRoute(
      path: '/retry_otp',
      name: 'retry_otp',
      builder: (context, state) => RetryOtpVerificationPage(),
    ),
    

    // ShellRoute(
    //   navigatorKey: shellNavigatorKey,
    //   builder: (context, state, child) {
    //     return child;
    //   },
    //   routes: [
        
    //     // Rutas dentro del ShellRoute
    //   ],
    // ),

  ],
);
