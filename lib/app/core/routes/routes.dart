import 'package:asl/app/core/extension/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../view/screens/authentication/sign_in/sign_in_screen.dart';
import '../../view/screens/authentication/sign_up/sign_up_screen.dart';
import '../../view/screens/home/add/add_screen.dart';
import '../../view/screens/home/add/model/post.dart';
import '../../view/screens/home/details/details_screen.dart';
import '../../view/screens/home/home_screen.dart';
import '../../view/screens/home/post_list/post_list_screen.dart';
import '../../view/screens/splash/splash_screen.dart';
import '../enums/transition_type.dart';
import 'route_path.dart';

class AppRouter {
  static final GoRouter initRoute = GoRouter(
      initialLocation: RoutePath.splashScreen.addBasePath,
      debugLogDiagnostics: true,
      navigatorKey: GlobalKey<NavigatorState>(),
      routes: [
        ///======================= Initial Route =======================
        GoRoute(
          name: RoutePath.splashScreen,
          path: RoutePath.splashScreen.addBasePath,
          pageBuilder: (context, state) => _buildPageWithAnimation(
            child: SplashScreen(),
            state: state,
          ),
        ),

        ///======================= HomeScreen =======================
        GoRoute(
          name: RoutePath.homeScreen,
          path: RoutePath.homeScreen.addBasePath,
          pageBuilder: (context, state) => _buildPageWithAnimation(
            child: HomeScreen(),
            state: state,
          ),
        ),

        ///======================= SignInScreen =======================
        GoRoute(
          name: RoutePath.signInScreen,
          path: RoutePath.signInScreen.addBasePath,
          pageBuilder: (context, state) => _buildPageWithAnimation(
            child: SignInScreen(),
            state: state,
          ),
        ),

        ///======================= SignUpScreen =======================
        GoRoute(
          name: RoutePath.signUpScreen,
          path: RoutePath.signUpScreen.addBasePath,
          pageBuilder: (context, state) => _buildPageWithAnimation(
            child: SignUpScreen(),
            state: state,

          ),
        ),

        ///======================= PostListScreen =======================
        GoRoute(
          name: RoutePath.postListScreen,
          path: RoutePath.postListScreen.addBasePath,
          pageBuilder: (context, state) => _buildPageWithAnimation(
            child: PostListScreen(),
            state: state,

          ),
        ),
        ///======================= AddEditPostScreen =======================
        GoRoute(
          name: RoutePath.addEditPostScreen,
          path: RoutePath.addEditPostScreen.addBasePath,
          pageBuilder: (context, state) {
            final post = state.extra as Post?; // null হলে add mode, না হলে edit mode
            return MaterialPage(
              child: AddEditPostScreen(post: post),
              key: state.pageKey,
            );
          },
        ),



        ///======================= DetailsScreen =======================
        GoRoute(
          name: RoutePath.detailsScreen,
          path: RoutePath.detailsScreen.addBasePath,
          pageBuilder: (context, state) {
            final data = state.extra as Map<String, dynamic>? ?? {};
            return _buildPageWithAnimation(
              child: DetailsScreen(data: data),
              state: state,
              transitionType: TransitionType.detailsScreen, // এখানে টাইপ পাস করলেন
            );
          },
        ),


      ]);

  static CustomTransitionPage _buildPageWithAnimation({
    required Widget child,
    required GoRouterState state,
    bool disableAnimation = false,
    TransitionType transitionType = TransitionType.defaultTransition,
  }) {
    if (disableAnimation) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionDuration: Duration.zero, // Disable animation
        transitionsBuilder: (_, __, ___, child) => child, // No transition
      );
    }

    // Custom transition for Details Screen (center open animation)
    if (transitionType == TransitionType.detailsScreen) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionDuration: const Duration(milliseconds: 600),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Center Open Animation
          var curve = Curves.easeOut; // Smooth opening
          var tween = Tween(begin: 0.0, end: 1.0); // Scale transition
          var scaleAnimation =
          animation.drive(tween.chain(CurveTween(curve: curve)));

          return ScaleTransition(
            scale: scaleAnimation,
            child: child,
          );
        },
      );
    }

    // Default Slide Transition (right to left)
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 600),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Slide from right
        const end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  static GoRouter get route => initRoute;
}
