import 'package:dio/dio.dart';
import 'package:webmotors/src/core/errors/app_error.dart';

const String baseUrl =
    'https://desafioonline.webmotors.com.br/api/OnlineChallenge';

enum RequestType { get, post, put, delete }

class HttpService {
  final Dio provider;

  HttpService({
    required this.provider,
  }) {
    _init();
  }

  void _init() {
    provider.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 20000,
      contentType: 'application/json',
      validateStatus: (status) => (status ?? 400) < 400,
    );
  }

  Future<T?> request<T>(
    String path, {
    required RequestType type,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    T? Function(Map<String, dynamic> json)? parser,
    T? Function(List<dynamic> list)? listParser,
  }) async {
    try {
      Response? res = await provider.request(
        path,
        data: data,
        options: _checkOptions(type),
        queryParameters: queryParameters,
      );
      if (res.data is List && listParser != null) return listParser(res.data);
      if (parser != null) return parser(res.data);
      return res.data;
    } on DioError catch (error) {
      if (error.response?.data != null) {
        throw AppError(
          error.response!.data['msg'],
        );
      }

      throw AppError('Algo deu errado');
    }
  }

  Options _checkOptions(RequestType method, [Options? options]) {
    options ??= Options();
    options.method = method.name.toUpperCase();
    return options;
  }
}
