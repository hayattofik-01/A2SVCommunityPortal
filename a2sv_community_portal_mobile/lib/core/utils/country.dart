import 'constants.dart';

String? isvalid(String country) {
  if (countryCode.containsKey(country.toLowerCase())) {
    return countryCode[country.toLowerCase()];
  }
  return "";
}
