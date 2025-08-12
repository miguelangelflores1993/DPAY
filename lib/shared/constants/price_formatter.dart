class PriceFormatter {
  static String format(num? price, {String symbol = 'Bs.'}) {
    final value = (price ?? 0).toDouble();
    final fixed = value.toStringAsFixed(2);
    final dotIndex = fixed.indexOf('.');
    final integerPart = fixed.substring(0, dotIndex);
    final decimalPart = fixed.substring(dotIndex + 1);

    final buffer = StringBuffer();
    final len = integerPart.length;
    for (var i = 0; i < len; i++) {
      buffer.write(integerPart[i]);
      final posFromRight = len - i - 1;
      if (posFromRight > 0 && posFromRight % 3 == 0) {
        buffer.write('.');
      }
    }

    return '$symbol $buffer,$decimalPart';
  }
}
