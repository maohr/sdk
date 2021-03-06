// Copyright (c) 2020, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/src/error/codes.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

import '../dart/resolution/driver_resolution.dart';

main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(AccessPrivateEnumFieldTest);
  });
}

@reflectiveTest
class AccessPrivateEnumFieldTest extends DriverResolutionTest {
  @failingTest
  test_name() async {
    await assertErrorsInCode(r'''
enum E { ONE }
String name(E e) {
  return e._name;
}
''', [
      error(CompileTimeErrorCode.ACCESS_PRIVATE_ENUM_FIELD, 45, 5),
    ]);
  }
}
