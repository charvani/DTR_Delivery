enum FlavorEnum { demo, prod }

class Flavour {
  static FlavorEnum? appFlavour;
  static String get title {
    switch (appFlavour) {
      case FlavorEnum.demo:
        return 'DTR Demo';
      case FlavorEnum.prod:
        return "DTR Prod";
      default:
        return "DTR Default";
    }
  }
}
