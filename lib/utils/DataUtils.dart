import 'package:intl/intl.dart';

class DataUtils {
  /// Format number to xxx.xxx.xxx
  String formatThousand(double price) {
    if (price < 1000) return price.floor().toString();

    final formatCurrency = NumberFormat("#,###");
    return formatCurrency.format(price.floor());
  }
}
