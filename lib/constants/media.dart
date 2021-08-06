class AppMediaAssets {
  AppMediaAssets._();

  static const String _base = "assets/";

  static final _Images images = _Images(base: "${_base}images/");
}

class _Images {
  late String _base;
  _Images({required String base}) {
    _base = base;
  }

  String withName(String name) => _base + name;
}
