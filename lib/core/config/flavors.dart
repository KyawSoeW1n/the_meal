enum Flavor {
  local,
  development,
  production,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.local:
        return 'The Meal Local';
      case Flavor.development:
        return 'The Meal Development';
      case Flavor.production:
        return 'The Meal Production';
      default:
        return 'title';
    }
  }

  /// Defines the environment variables filename for each flavor
  static String get envFileName => '${appFlavor?.name}.config.json';
}
