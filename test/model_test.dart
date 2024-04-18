import 'package:flutter_test/flutter_test.dart';
import 'package:keeyosk/models/User.dart';

void main() {
  group('Models', () {
    test('User', () {
      final json = {
        'first_name': 'Bob',
        'last_name': 'Ross',
        'user_id': 'sdf3kj43',
        'email': 'Bobross@gmail.com',
        'avatar_image_url': 'image.com'
      };
      final fromJson = User.fromJSON(json);
      expect(fromJson.firstName, 'Bob');
    });
  });
}
