class DolaModel {
  static String formatCurrency(num amount) {
    String number = amount.toInt().toString();
    String result = '';

    for (int i = 0; i < number.length; i++) {
      result += number[i];

      int remaining = number.length - i - 1;

      if (remaining > 0 && remaining % 3 == 0) {
        result += '.';
      }
    }

    return result;
  }
}
