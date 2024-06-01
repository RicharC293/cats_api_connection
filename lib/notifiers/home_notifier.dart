import 'package:cats_api_connection/models/faq_model.dart';
import 'package:cats_api_connection/services/services.dart';
import 'package:flutter/material.dart';

class HomeNotifier extends ChangeNotifier {
  /// Vamos a utilizar el notifier para cambiar el estado global (Tema)

  /// 1. bool para definir el estado del tema
  /// 2. getter para obtener el tema según el estado
  /// 3. setter para actualizar el valor del bool cuando demos click a un btn

  /// 1
  bool _isDark = false;

  /// 2
  bool get isDark => _isDark;

  /// 3
  set isDark(bool value) {
    _isDark = value;

    /// Es quien se encarga de notificar a los que le escuchen
    /// Provider es quien escucha
    notifyListeners();
  }

  /// Metodo para hacer switch
  void switchTheme() {
    _isDark = !isDark;
    notifyListeners();
  }

  /// Vamos a utilizar el notifier para manejar lógica de negocio

  ///2. crear variables que definan ese dato en específico
  FaqModel? _faqModel;

  /// getter -> faqs
  List<Datum> get faqs => _faqModel?.data ?? [];

  FaqModel? get faqModel => _faqModel;

  ///1. crear un método para que consulte el api

  Future<void> getFaqs() async {
    try {
      _faqModel = await Services().getFaqs();
    } catch (err) {
      print("OCURRIDO_UN_ERROR: $err");
      _faqModel = null;
    } finally {
      notifyListeners();
    }
  }
}
