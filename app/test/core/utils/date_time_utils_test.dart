import 'package:app/core/utils/date_time_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('calculateMonthsBetweenDate', () {
    test('If two Date is the same  months should return 0', (){
      DateTime from = DateTime(2021, 1, 1);
      DateTime to = DateTime(2021, 1, 30);
      int result = calculateMonthsBetweenDate(fromTime: from, toTime: to);
      expect(result, 0);
    });

    test('If the two dates have different months but the month has not yet expired in the following month, the difference -1 must be returned.', (){
      DateTime from = DateTime(2021, 1, 15);
      DateTime to = DateTime(2021, 2, 12);
      int result = calculateMonthsBetweenDate(fromTime: from, toTime: to);
      expect(result, 0);

    });
    test('If the two dates have different months and the month has expired  should return the difference', (){
      DateTime from = DateTime(2021, 1, 15);
      DateTime to = DateTime(2021, 2, 18);
      int result = calculateMonthsBetweenDate(fromTime: from, toTime: to);
      expect(result, 1);

    });
    test('If the two dates have different one month exactly should return  the difference', (){
      DateTime from = DateTime(2021, 1, 15);
      DateTime to = DateTime(2021, 2, 15);
      int result = calculateMonthsBetweenDate(fromTime: from, toTime: to);
      expect(result, 1);

    });
  });
  group('calculateWeeksBetweenDate', () {
    test('Si la diferencia es de 10 dias debe retornar 1', (){
      DateTime from = DateTime(2021, 1, 1);
      DateTime to = DateTime(2021, 1, 11);
      int result = calculateWeeksBetweenDate(fromTime: from, toTime: to);
      expect(result, 1);
    });
    test('Si la diferencia es de 15 dias debe retornar 2', (){
      DateTime from = DateTime(2021, 1, 1);
      DateTime to = DateTime(2021, 1, 16);
      int result = calculateWeeksBetweenDate(fromTime: from, toTime: to);
      expect(result, 2);
    });

  });
}