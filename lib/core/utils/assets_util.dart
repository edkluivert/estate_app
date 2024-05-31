import 'package:estate_app/core/constants/app_constants.dart';

/// Created this extension as it is much easier and quicker for implementation
/// Code credits => Kluivert

extension ImageFormat on String {
  String get png {
    return '$imagesPath$this.png';
  }

  String get jpg {
    return '$imagesPath$this.jpg';
  }

  String get svg {
    return '$iconsPath$this.svg';
  }
  String get json {
    return '$jsonPath$this.json';
  }
}