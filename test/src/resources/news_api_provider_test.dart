import 'package:hacker_news/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  final newsApi = NewsApiProvider();

  test('FetchTopIds returns a list of ids', () async {
    newsApi.client = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4]), 200);
    });

    final ids = await newsApi.fetchTopIds();
    expect(ids, [1, 2, 3, 4]);
  });

  test('FetchItem returns a item model', () async {
    newsApi.client = MockClient((request) async {
      final jsonMap = {'id': 123, };
      return Response(json.encode(jsonMap), 200);
    });

    final item = await newsApi.fetchItem(123);
    expect(item.id, 123);
  });
}