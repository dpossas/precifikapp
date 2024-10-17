enum Flavor {
  dev,
  prod,
}

class F {
  static Flavor? appFlavor;
  static String? appVersion;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Erika Precifica - Dev';
      case Flavor.prod:
        return 'Erika Precifica';
      default:
        return 'title';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'http://vmi2073903.contaboserver.net/';
      case Flavor.prod:
      default:
        return 'https://erikaprecifica.com.br/';
    }
  }
}
