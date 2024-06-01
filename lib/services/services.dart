import 'package:dio/dio.dart';

import '../models/faq_model.dart';

class Services {
  /// Vamos a utilizar el api https://catfact.ninja/
  /// Para consultar una lista de faqs
  /// Al momento de consultar el api, vamor a utilizar
  /// https://cataas.com/
  /// Para generar una imagen random en base a la primera palabra del faq

  /// 1. Crearnos una instancia de DIO -> cliente usando HTTP
  /// 2. Crearnos un método para retornar las faqs
  /// 3. controlar los errores

  /// 1.
  final dio = Dio();

  /// 2.
  Future<FaqModel> getFaqs() async {
    try {
      /// 1. Declarar la url
      const url = "https://catfact.ninja/facts";
      final response = await dio.get(url);
      print(response.data);

      /// 2. Retornar la data en base a un modelo
      return FaqModel.fromJson(response.data);
    } on DioException catch (err) {
      /// Controlar el error y notificarlo al backend - logs
      rethrow;
    } catch (err) {
      /// controlar el error y notificar - herramienta de crash - crashlytics
      rethrow;
    }
  }
}
