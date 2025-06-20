class FormatUtil {
  static String formattedCode(String code) => '#$code';

  static String formattedPrice(double price) =>
      '\$${price.truncateToDouble() == price ? price.toStringAsFixed(0) : price.toStringAsFixed(2)}';
}
