class AssetsUtils {
  AssetsUtils._(); // make this class singleton/ unable to create instance from

  // static file accessible without creating instances
  static const String _imagePath = 'assets/images'; // make private with underscore
  static const String backgroundSVG = "$_imagePath/background.svg";
  static const String logoSVG = "$_imagePath/logo.svg";
}
