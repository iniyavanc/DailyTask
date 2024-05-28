enum AppRoutes { root, productScreen, productDetailScreen }

extension AppRouteExtension on AppRoutes {
  static const appRoutes = {
    AppRoutes.root: "/",
    AppRoutes.productScreen: "/Product",
    AppRoutes.productDetailScreen: "/ProductDetailScreen",
  };

  String get toName => appRoutes[this]!;
}

enum ApiRoutes {
  login,
}

extension ApiRouteExtension on ApiRoutes {
  static const apiRoutes = {
    ApiRoutes.login: "",
  };

  String get toName => apiRoutes[this]!;
}
