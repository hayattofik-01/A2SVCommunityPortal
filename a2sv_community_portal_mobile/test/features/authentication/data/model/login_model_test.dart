import 'dart:convert';
import 'package:a2sv_community_portal_mobile/features/authentication/data/model/login_model.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/entities/login.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const  tLoginModel = LoginModel(
     token: "1234");

  test("Should be a subclass of Login Entity", () async {
    expect(tLoginModel, isA<Login>());
  });
  test("Should return a valid model when the JSON is valid", () async {
    final Map<String, dynamic> jsonMap = json.decode(fixture("user_login.json"));

    final result = LoginModel.fromJson(jsonMap);
    expect(result, tLoginModel);
  });

  test('Should return a JSON map with the proper data', () async {
    final result = tLoginModel.toJson();
    final expectedMap = {
      "token": "1234"
    };
    expect(result, expectedMap);
  });
}
