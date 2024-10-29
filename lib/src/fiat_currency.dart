// Copyright (c) 2024, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// TODO
///
/// For more info about currencies visit:
/// - [ISO 4217 Wikipedia](https://en.wikipedia.org/wiki/ISO_4217#Active_codes_(List_One))
/// - [ISO 4217-1 with currency symbols](https://gist.github.com/sgraaf/21d5919940844c9f0c12f147ed45953d)
enum FiatCurrency {
  aed('AED', '784', 'د.إ', 2),
  afn('AFN', '971', '؋', 2),
  all('ALL', '008', 'Lek', 2),
  amd('AMD', '051', 'Դ', 2),
  ang('ANG', '532', 'ƒ', 2),
  aoa('AOA', '973', 'is', 2),
  ars('ARS', '032', r'$', 2),
  aud('AUD', '036', r'$', 2),
  awg('AWG', '533', 'ƒ', 2),
  azn('AZN', '944', '₼', 2),
  bam('BAM', '977', 'КМ', 2),
  bbd('BBD', '052', r'$', 2),
  bdt('BDT', '050', '৳', 2),
  bgn('BGN', '975', 'лв', 2),
  bhd('BHD', '048', 'ب.د', 3),
  bif('BIF', '108', '₣', 0),
  bmd('BMD', '060', r'$', 2),
  bnd('BND', '096', r'$', 2),
  bob('BOB', '068', 'Bs.', 2),
  bov('BOV', '984', 'Mvdol', 2),
  brl('BRL', '986', r'R$', 2),
  bsd('BSD', '044', r'$', 2),
  btn('BTN', '064', 'Nu.', 2),
  bwp('BWP', '072', 'P', 2),
  byn('BYN', '933', 'p.', 2),
  bzd('BZD', '084', r'$', 2),
  cad('CAD', '124', r'$', 2),
  cdf('CDF', '976', '₣', 2),
  che('CHE', '947', '', 2),
  chf('CHF', '756', '₣', 2),
  chw('CHW', '948', '', 2),
  clf('CLF', '990', 'UF', 2),
  clp('CLP', '152', r'$', 0),
  cop('COP', '170', r'$', 2),
  cou('COU', '970', '', 2),
  crc('CRC', '188', '₡', 2),
  cuc('CUC', '931', r'CUC$', 2),
  cup('CUP', '192', r'$', 2),
  cve('CVE', '132', r'$', 2),
  czk('CZK', '203', 'Kč', 2),
  djf('DJF', '262', '₣', 0),
  dkk('DKK', '208', 'kr', 2),
  dop('DOP', '214', r'$', 2),
  dzd('DZD', '012', 'د.ج', 2),
  egp('EGP', '818', '£', 2),
  ern('ERN', '232', 'Nfk', 2),
  etb('ETB', '230', 'Br', 2),
  eur('EUR', '978', '€', 2),
  fjd('FJD', '242', r'$', 2),
  fkp('FKP', '238', '£', 2),
  gbp('GBP', '826', '£', 2),
  gel('GEL', '981', 'ლ', 2),
  ghs('GHS', '936', '₵', 2),
  gip('GIP', '292', '£', 2),
  gmd('GMD', '270', 'D', 2),
  gnf('GNF', '324', '₣', 0),
  gtq('GTQ', '320', 'Q', 2),
  gyd('GYD', '328', r'$', 2),
  hkd('HKD', '344', r'$', 2),
  hnl('HNL', '340', 'L', 2),
  htg('HTG', '332', 'G', 2),
  huf('HUF', '348', 'Ft', 2),
  idr('IDR', '360', 'Rp', 2),
  ils('ILS', '376', '₪', 2),
  inr('INR', '356', '₨', 2),
  iqd('IQD', '368', 'ع.د', 3),
  irr('IRR', '364', '﷼', 2),
  isk('ISK', '352', 'Kr', 0),
  jmd('JMD', '388', r'$', 2),
  jod('JOD', '400', 'د.ا', 3),
  jpy('JPY', '392', '¥', 0),
  kes('KES', '404', 'Sh', 2),
  kgs('KGS', '417', 'с', 2),
  khr('KHR', '116', '៛', 2),
  kmf('KMF', '174', '₣', 0),
  kpw('KPW', '408', '₩', 2),
  krw('KRW', '410', '₩', 0),
  kwd('KWD', '414', 'د.ك', 3),
  kyd('KYD', '136', r'$', 2),
  kzt('KZT', '398', '〒', 2),
  lak('LAK', '418', '₭', 2),
  lbp('LBP', '422', 'ل.ل', 2),
  lkr('LKR', '144', 'Rs', 2),
  lrd('LRD', '430', r'$', 2),
  lsl('LSL', '426', 'L', 2),
  lyd('LYD', '434', 'ل.د', 3),
  mad('MAD', '504', 'د.م.', 2),
  mdl('MDL', '498', 'L', 2),
  mga('MGA', '969', 'MK', 2),
  mkd('MKD', '807', 'ден', 2),
  mmk('MMK', '104', 'K', 2),
  mnt('MNT', '496', '₮', 2),
  mop('MOP', '446', 'P', 2),
  mru('MRU', '929', 'UM', 2),
  mur('MUR', '480', '₨', 2),
  mvr('MVR', '462', 'ރ', 2),
  mwk('MWK', '454', 'MK', 2),
  mxn('MXN', '484', r'$', 2),
  mxv('MXV', '979', '', 2),
  myr('MYR', '458', 'RM', 2),
  mzn('MZN', '943', 'MTn', 2),
  nad('NAD', '516', r'$', 2),
  ngn('NGN', '566', '₦', 2),
  nio('NIO', '558', r'C$', 2),
  nok('NOK', '578', 'kr', 2),
  npr('NPR', '524', '₨', 2),
  nzd('NZD', '554', r'$', 2),
  omr('OMR', '512', 'ر.ع.', 3),
  pab('PAB', '590', 'B/.', 2),
  pen('PEN', '604', 'S/.', 2),
  pgk('PGK', '598', 'K', 2),
  php('PHP', '608', '₱', 2),
  pkr('PKR', '586', '₨', 2),
  pln('PLN', '985', 'zł', 2),
  pyg('PYG', '600', '₲', 0),
  qar('QAR', '634', 'ر.ق', 2),
  ron('RON', '946', 'L', 2),
  rsd('RSD', '941', 'din', 2),
  cny('CNY', '156', '¥', 2),
  rwf('RWF', '646', '₣', 0),
  sar('SAR', '682', 'ر.س', 2),
  sbd('SBD', '090', r'$', 2),
  scr('SCR', '690', '₨', 2),
  sdg('SDG', '938', '£', 2),
  sek('SEK', '752', 'kr', 2),
  sgd('SGD', '702', r'$', 2),
  shp('SHP', '654', '£', 2),
  sle('SLE', '925', 'Le', 2),
  sll('SLL', '694', 'Le', 2),
  sos('SOS', '706', 'Sh', 2),
  srd('SRD', '968', r'$', 2),
  ssp('SSP', '728', '£', 2),
  stn('STN', '930', 'Db', 2),
  svc('SVC', '222', '₡', 2),
  syp('SYP', '760', '£', 2),
  szl('SZL', '748', 'L', 2),
  thb('THB', '764', '฿', 2),
  tjs('TJS', '972', 'ЅМ', 2),
  tmt('TMT', '934', 'm', 2),
  tnd('TND', '788', 'د.ت', 3),
  top('TOP', '776', r'T$', 2),
  try$('TRY', '949', '₺', 2),
  ttd('TTD', '780', r'$', 2),
  twd('TWD', '901', r'NT$', 2),
  tzs('TZS', '834', 'Sh', 2),
  uah('UAH', '980', '₴', 2),
  ugx('UGX', '800', 'Sh', 0),
  usd('USD', '840', r'$', 2),
  usn('USN', '997', '', 2),
  uyi('UYI', '940', '', 2),
  uyu('UYU', '858', r'$U', 2),
  uyw('UYW', '927', '', 2),
  uzs('UZS', '860', 'Sʻ', 2),
  ved('VED', '926', 'Bs.', 2),
  ves('VES', '928', 'Bs.', 2),
  vnd('VND', '704', '₫', 0),
  vuv('VUV', '548', 'Vt', 0),
  wst('WST', '882', 'T', 2),
  xaf('XAF', '950', '₣', 0),
  xag('XAG', '961', '', 2),
  xau('XAU', '959', '', 2),
  xba('XBA', '955', '', 2),
  xbb('XBB', '956', '', 2),
  xbc('XBC', '957', '', 2),
  xbd('XBD', '958', '', 2),
  xcd('XCD', '951', r'$', 2),
  xdr('XDR', '960', 'SDR', 2),
  xof('XOF', '952', '₣', 0),
  xpd('XPD', '964', '', 2),
  xpf('XPF', '953', '₣', 0),
  xpt('XPT', '962', '', 2),
  xsu('XSU', '994', '', 2),
  xts('XTS', '963', '', 2),
  xua('XUA', '965', '', 2),
  xxx('XXX', '999', '', 2),
  yer('YER', '886', '﷼', 2),
  zar('ZAR', '710', 'R', 2),
  zwm('ZMW', '967', 'ZK', 2),
  zwl('ZWL', '932', r'$', 2);

  const FiatCurrency(this.code, this.number, this.icon, this.precision);

  factory FiatCurrency.parse(String currency) {
    return values.firstWhere(
      (c) =>
          c.code == currency.toUpperCase() ||
          c.number == currency ||
          c.icon == currency,
    );
  }

  static FiatCurrency? tryParse(String? currency) {
    if (currency?.isNotEmpty != true) {
      return null;
    }

    try {
      return FiatCurrency.parse(currency!);
    } catch (_) {
      return null;
    }
  }

  static FiatCurrency _default = FiatCurrency.uah;
  static FiatCurrency get $default => _default;
  static void setDefaultCurrency(FiatCurrency currency) => _default = currency;

  final String code;
  final String number;
  final String icon;
  final int precision;

  bool get isDefault => code == $default.code;

  @override
  String toString() => icon.isNotEmpty ? icon : code;
}
