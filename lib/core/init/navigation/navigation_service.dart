import 'package:go_router/go_router.dart';
import 'package:kelepir/core/enums/navigations_enum/navigation_enums.dart';
import 'package:kelepir/feature/auth/view/authentication_view.dart';
import 'package:kelepir/feature/no_connection/no_connection.dart';
import 'package:kelepir/product/widgets/dummyViews.dart';
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
      GoRoute(path: NavigationEnums.auth.routeName, builder: ((context, state) => const AuthenticationView())),
      GoRoute(path: NavigationEnums.home.routeName, builder: (context, state) => const HomeView()),
    ],
    errorBuilder: ((context, state) => const NoConnectionView()),
  );
}
