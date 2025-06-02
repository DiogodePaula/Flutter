import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor implements InterceptorContract {
  Logger logger = Logger();

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    logger.v(
        "Requisição para ${data.baseUrl}\nCabeçalhos: ${data.headers}\nCorpo: ${data.body}");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    // é usada para verificar se o código de status HTTP indica sucesso (ou seja, está na faixa 200–299).
    if (data.statusCode ~/ 100 == 2) {
      logger.i(
          "Resposta para ${data.url}\nStatus: ${data.statusCode}\nCabeçalhos: ${data.headers}\nCorpo: ${data.body}");
    } else {
      logger.e(
          "Resposta para ${data.url}\nStatus: ${data.statusCode}\nCabeçalhos: ${data.headers}\nCorpo: ${data.body}");
    }

    return data;
  }
}
