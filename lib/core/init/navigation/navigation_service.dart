import 'package:go_router/go_router.dart';
import 'package:kelepir/core/enums/navigations_enum/navigation_enums.dart';
import 'package:kelepir/feature/auth/view/login_view.dart';
import 'package:kelepir/feature/no_connection/no_connection.dart';
import '../../../feature/Image_upload/view/image_view.dart';
import '../../../feature/auth/view/register_view.dart';
import '../../../feature/home/view/home_view.dart';

class NavigationService {
  static NavigationService? _navigationServiceInstance;
  static NavigationService get instance {
    _navigationServiceInstance ??= NavigationService._init();
    return _navigationServiceInstance!;
  }

  NavigationService._init();

  final router = GoRouter(
    routes: <GoRoute>[
      GoRoute(path: NavigationEnums.register.routeName, builder: ((context, state) => const RegisterView())),
      GoRoute(path: NavigationEnums.login.routeName, builder: ((context, state) => const LoginView())),
      GoRoute(path: NavigationEnums.home.routeName, builder: (context, state) => const HomeView()),
      GoRoute(path: NavigationEnums.image.routeName, builder: (context, state) => const ImageView()),

      //GoRoute(path: NavigationEnums.splash.routeName, builder: (context, state) => const SplashView()),
    ],
    errorBuilder: ((context, state) => const NoConnectionView()),
  );
}
