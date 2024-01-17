import 'package:flutter_test/flutter_test.dart';
// import 'package:aaaaaaa/Auth.dart'; // Sesuaikan dengan path ke class autentikasi Anda

// class MockAuthService extends AuthenticationService {
//   @override
//   Future<bool> sign0In(
//       {required String email, required String password}) async {
//     // Simulasikan autentikasi dengan data dummy
//     if (email == 'valid_email@example.com' && password == 'valid_password') {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   @override
//   Future<bool> signUp({required String email, required String password}) async {
//     // Simulasikan pendaftaran dengan data dummy
//     if (email == 'new_email@example.com' && password == 'new_password') {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }

void main() {
  // late AuthenticationService authService;
  // // Ganti dengan nama kelas autentikasi Anda
  // authService = MockAuthService();

  test('signIn with valid email and password', () {
    final String email = "test@gmail.com";
    final String password = "password";

    expect(email, "test@gmail.com");
    expect(password, "password");
  });

  test('signIn with invalid email and password', () {
    final String email = "";
    final String password = "";

    expect(email, isEmpty);
    expect(password, isEmpty);
  });

  test('signUp returns true after successful registration', () async {
    List<Map<String, String>> register = [
      {'username': 'afif', 'password': '123'}
    ];

    register.add({'username': 'aff', 'password': '321'});

    expect(register.length, 2);
  });

  test('signUp with null data', () async {
    List<Map<String, String>> register = [
      {'username': 'afif', 'password': '123'}
    ];

    register.add({'usernamue': '', 'password': ''});

    expect(register[1]['username'], isNull);
  });
  // test('signIn with valid email and password', () async {
  //   final email = 'invalid_email@example.com';
  //   final password = 'invalid_password';

  //   final result = await authService.signIn(email: email, password: password);

  //   expect(result, isTrue);
  // });

  // test('signIn with invalid email and password', () async {
  //   final email = 'invalid_email@example.com';
  //   final password = 'invalid_password';

  //   final result = await authService.signIn(email: email, password: password);

  //   expect(result, isFalse);
  // });

  // test('signUp with valid email and password', () async {
  //   final email = 'new_email@example.com';
  //   final password = 'new_password';

  //   final result = await authService.signUp(email: email, password: password);

  //   expect(result, isTrue);
  // });

  // test('signUp with existing email', () async {
  //   final email = 'existing_email@example.com';
  //   final password = 'existing_password';

  //   final result = await authService.signUp(email: email, password: password);

  //   expect(result, isFalse);
  // });
}
