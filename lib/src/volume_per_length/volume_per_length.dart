import 'package:international_system_of_units/src/length/international_system.dart';
import 'package:international_system_of_units/src/volume/international_system.dart';

extension ISVolumePerLength on num {
  num get toLiterPerKilometer => toMetre(LengthUnit.kilometre);
  num get toUsGallonPerMile => toUSLiquidGallon.toMetre(LengthUnit.mile);
  num get toImperialGallonPerMile => toImperialGallon.toMetre(LengthUnit.mile);

  num toLiterPerMeter(VolumePerLengthUnit unit) {
    switch (unit) {
      case VolumePerLengthUnit.usGallonPerMile:
        return this * 2.352 / 1000;
      case VolumePerLengthUnit.imperialGallonPerMile:
        return this * 2.825 / 1000;
      case VolumePerLengthUnit.literPerKilometer:
        return this / 1000;
      default:
        return this;
    }
  }
}

enum VolumePerLengthUnit {
  literPerMeter,
  literPerKilometer,
  usGallonPerMile,
  imperialGallonPerMile,
}
