import 'package:international_system_of_units/src/length/international_system.dart';
import 'package:international_system_of_units/src/locale/locale_base.dart';
import 'package:international_system_of_units/src/unit_system.dart';
import 'package:intl/intl.dart';

class LocaleLength extends LocaleBase<LengthUnit> {
  final String _localeName;

  LocaleLength(NumberFormat _numberFormat, this._localeName)
      : super(_numberFormat);

  @override
  String localeUnit(
    final num value,
    UnitSystem unitSystem,
    LengthUnit unit, {
    bool shortUnit = true,
  }) {
    switch (unit) {
      case LengthUnit.kilometre:
        return shortUnit ? 'km' : localeKilometer(value);
      case LengthUnit.metre:
        return shortUnit ? 'm' : localeMeter(value);
      case LengthUnit.mile:
        return shortUnit ? 'mi' : localeMile(value);
      case LengthUnit.inch:
        return shortUnit ? 'in' : localeInch(value);
      default:
        throw UnsupportedError('We currently do not support this combinaison');
    }
  }

  @override
  num localeNumber(
    num lengthInMetre,
    UnitSystem unitSystem, {
    LengthUnit toInternationalUnit,
    LengthUnit toImperialUnit,
    LengthUnit toUsUnit,
  }) {
    switch (unitSystem) {
      case UnitSystem.imperial:
        return _localeNumberBase(lengthInMetre, toImperialUnit);
      case UnitSystem.us:
        return _localeNumberBase(lengthInMetre, toUsUnit);
      default:
        return _localeNumberBase(lengthInMetre, toInternationalUnit);
    }
  }

  num _localeNumberBase(num value, LengthUnit unit) {
    switch (unit) {
      case LengthUnit.mile:
        return value.toMile;
      case LengthUnit.foot:
        return value.toFoot;
      case LengthUnit.inch:
        return value.toInch;
      case LengthUnit.micrometre:
        return value.toMicrometre;
      case LengthUnit.millimetre:
        return value.toMillimetre;
      case LengthUnit.nanometre:
        return value.toNanometre;
      case LengthUnit.nauticalMile:
        return value.toNauticalMile;
      case LengthUnit.yard:
        return value.toYard;
      case LengthUnit.kilometre:
        return value.toKilometre;
      case LengthUnit.centimetre:
        return value.toCentimetre;
      case LengthUnit.metre:
        return value;
      default:
        throw UnsupportedError('We currently do not support this combinaison');
    }
  }

  @override
  String locale(
    num value,
    UnitSystem unitSystem, {
    bool withUnit = true,
    bool shortUnit = true,
    NumberFormat customNumberFormat,
    LengthUnit toInternationalUnit = LengthUnit.kilometre,
    LengthUnit toImperialUnit = LengthUnit.mile,
    LengthUnit toUsUnit = LengthUnit.mile,
  }) =>
      super.locale(
        value,
        unitSystem,
        withUnit: withUnit,
        toUsUnit: toUsUnit,
        shortUnit: shortUnit,
        customNumberFormat: customNumberFormat,
        toImperialUnit: toImperialUnit,
        toInternationalUnit: toInternationalUnit,
      );

  String localeMile(num length) => Intl.plural(
        length,
        name: 'localeMile',
        zero: 'miles',
        one: 'mile',
        other: 'miles',
        args: [length],
        locale: _localeName,
      );

  String localeInch(num length) => Intl.plural(
        length,
        name: 'localeInch',
        zero: 'inches',
        one: 'inche',
        other: 'inches',
        args: [length],
        locale: _localeName,
      );

  String localeMeter(num length) => Intl.plural(
        length,
        name: 'localeMeter',
        zero: 'meter',
        one: 'meter',
        other: 'meters',
        args: [length],
        locale: _localeName,
      );

  String localeKilometer(num length) => Intl.plural(
        length,
        name: 'localeKilometer',
        zero: 'kilometer',
        one: 'kilometer',
        other: 'kilometers',
        args: [length],
        locale: _localeName,
      );
}
