const baseDevUrl = 'https://api-dev.criptix.app';
const baseProdUrl = 'https://api.criptix.app';

const _redeemFeature = String.fromEnvironment(
  'REDEEM_FEATURE',
  defaultValue: 'false',
);

class AppEnvironment {
  static String get baseUrl {
    return baseDevUrl;
  }

  static bool get redeemFeature => _redeemFeature == 'true';
}
