import 'package:app/data/services/dana_analytics_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('know retained users', (){
    test('user not registered', (){
      bool result = DanaAnalyticsService.isUserRetained();
    });
    test('user registered today', (){
      DateTime userRegistered = DateTime.now();
      bool result = DanaAnalyticsService.isUserRetained(registerDate:userRegistered);
      expect(result, equals(false));
    });
    test('user registered 29 days ago', (){
      DateTime userRegistered = DateTime.now().subtract(Duration(days:29));
      bool result = DanaAnalyticsService.isUserRetained(registerDate:userRegistered);
      expect(result, equals(false));
    });
    test('user registered 30 days ago', (){
      DateTime userRegistered = DateTime.now().subtract(Duration(days:30, hours: 1));
      bool result = DanaAnalyticsService.isUserRetained(registerDate:userRegistered);
      expect(result, equals(true));
    });
    test('user registered 31 days ago', (){
      DateTime userRegistered = DateTime.now().subtract(Duration(days:31));
      bool result = DanaAnalyticsService.isUserRetained(registerDate:userRegistered);
      expect(result, equals(true));
    });
    test('user registered 40 days ago', (){
      DateTime userRegistered = DateTime.now().subtract(Duration(days:40));
      bool result = DanaAnalyticsService.isUserRetained(registerDate:userRegistered);
      expect(result, equals(true));
    });
  });
}