const _uahIcon = '₴';
const _usdIcon = r'$';
const _eurIcon = '€';

enum Currency {
  aed('AED', '784'),
  afn('AFN', '971'),
  all('ALL', '008'),
  amd('AMD', '051'),
  ang('ANG', '532'),
  aoa('AOA', '973'),
  ars('ARS', '032'),
  aud('AUD', '036'),
  awg('AWG', '533'),
  azn('AZN', '944'),
  bam('BAM', '977'),
  bbd('BBD', '052'),
  bdt('BDT', '050'),
  bgn('BGN', '975'),
  bhd('BHD', '048'),
  bif('BIF', '108'),
  bmd('BMD', '060'),
  bnd('BND', '096'),
  bob('BOB', '068'),
  bov('BOV', '984'),
  brl('BRL', '986'),
  bsd('BSD', '044'),
  btn('BTN', '064'),
  bwp('BWP', '072'),
  byn('BYN', '933'),
  bzd('BZD', '084'),
  cad('CAD', '124'),
  cdf('CDF', '976'),
  che('CHE', '947'),
  chf('CHF', '756'),
  chw('CHW', '948'),
  clf('CLF', '990'),
  clp('CLP', '152'),
  cop('COP', '170'),
  cou('COU', '970'),
  crc('CRC', '188'),
  cuc('CUC', '931'),
  cup('CUP', '192'),
  cve('CVE', '132'),
  czk('CZK', '203'),
  djf('DJF', '262'),
  dkk('DKK', '208'),
  dop('DOP', '214'),
  dzd('DZD', '012'),
  egp('EGP', '818'),
  ern('ERN', '232'),
  etb('ETB', '230'),
  eur('EUR', '978'),
  fjd('FJD', '242'),
  fkp('FKP', '238'),
  gbp('GBP', '826'),
  gel('GEL', '981'),
  ghs('GHS', '936'),
  gip('GIP', '292'),
  gmd('GMD', '270'),
  gnf('GNF', '324'),
  gtq('GTQ', '320'),
  gyd('GYD', '328'),
  hkd('HKD', '344'),
  hnl('HNL', '340'),
  htg('HTG', '332'),
  huf('HUF', '348'),
  idr('IDR', '360'),
  ils('ILS', '376'),
  inr('INR', '356'),
  iqd('IQD', '368'),
  irr('IRR', '364'),
  isk('ISK', '352'),
  jmd('JMD', '388'),
  jod('JOD', '400'),
  jpy('JPY', '392'),
  kes('KES', '404'),
  kgs('KGS', '417'),
  khr('KHR', '116'),
  kmf('KMF', '174'),
  kpw('KPW', '408'),
  krw('KRW', '410'),
  kwd('KWD', '414'),
  kyd('KYD', '136'),
  kzt('KZT', '398'),
  lak('LAK', '418'),
  lbp('LBP', '422'),
  lkr('LKR', '144'),
  lrd('LRD', '430'),
  lsl('LSL', '426'),
  lyd('LYD', '434'),
  mad('MAD', '504'),
  mdl('MDL', '498'),
  mga('MGA', '969'),
  mkd('MKD', '807'),
  mmk('MMK', '104'),
  mnt('MNT', '496'),
  mop('MOP', '446'),
  mru('MRU', '929'),
  mur('MUR', '480'),
  mvr('MVR', '462'),
  mwk('MWK', '454'),
  mxn('MXN', '484'),
  mxv('MXV', '979'),
  myr('MYR', '458'),
  mzn('MZN', '943'),
  nad('NAD', '516'),
  ngn('NGN', '566'),
  nio('NIO', '558'),
  nok('NOK', '578'),
  npr('NPR', '524'),
  nzd('NZD', '554'),
  omr('OMR', '512'),
  pab('PAB', '590'),
  pen('PEN', '604'),
  pgk('PGK', '598'),
  php('PHP', '608'),
  pkr('PKR', '586'),
  pln('PLN', '985'),
  pyg('PYG', '600'),
  qar('QAR', '634'),
  ron('RON', '946'),
  rsd('RSD', '941'),
  cny('CNY', '156'),
  rwf('RWF', '646'),
  sar('SAR', '682'),
  sbd('SBD', '090'),
  scr('SCR', '690'),
  sdg('SDG', '938'),
  sek('SEK', '752'),
  sgd('SGD', '702'),
  shp('SHP', '654'),
  sle('SLE', '925'),
  sll('SLL', '694'),
  sos('SOS', '706'),
  srd('SRD', '968'),
  ssp('SSP', '728'),
  stn('STN', '930'),
  svc('SVC', '222'),
  syp('SYP', '760'),
  szl('SZL', '748'),
  thb('THB', '764'),
  tjs('TJS', '972'),
  tmt('TMT', '934'),
  tnd('TND', '788'),
  top('TOP', '776'),
  try_('TRY', '949'),
  ttd('TTD', '780'),
  twd('TWD', '901'),
  tzs('TZS', '834'),
  uah('UAH', '980'),
  ugx('UGX', '800'),
  usd('USD', '840'),
  usn('USN', '997'),
  uyi('UYI', '940'),
  uyu('UYU', '858'),
  uyw('UYW', '927'),
  uzs('UZS', '860'),
  ved('VED', '926'),
  ves('VES', '928'),
  vnd('VND', '704'),
  vuv('VUV', '548'),
  wst('WST', '882'),
  xaf('XAF', '950'),
  xag('XAG', '961'),
  xau('XAU', '959'),
  xba('XBA', '955'),
  xbb('XBB', '956'),
  xbc('XBC', '957'),
  xbd('XBD', '958'),
  xcd('XCD', '951'),
  xdr('XDR', '960'),
  xof('XOF', '952'),
  xpd('XPD', '964'),
  xpf('XPF', '953'),
  xpt('XPT', '962'),
  xsu('XSU', '994'),
  xts('XTS', '963'),
  xua('XUA', '965'),
  xxx('XXX', '999'),
  yer('YER', '886'),
  zar('ZAR', '710'),
  zwm('ZMW', '967'),
  zwl('ZWL', '932'),
  unknown('unknown', 'unknown');

  const Currency(this.code, this.number);

  factory Currency._parse(String currency) {
    switch (currency.toLowerCase()) {
      case _uahIcon:
        return Currency.uah;
      case _usdIcon:
        return Currency.usd;
      case _eurIcon:
        return Currency.eur;

      default:
        return values.firstWhere(
          (c) => c.code == currency.toUpperCase() || c.number == currency,
          orElse: () => Currency.unknown,
        );
    }
  }

  factory Currency.parse(String? currency) {
    if (currency?.isNotEmpty != true) {
      return Currency.$default;
    }

    return Currency._parse(currency!);
  }

  static Currency? tryParse(String? currency) {
    if (currency?.isNotEmpty != true) {
      return null;
    }

    return Currency._parse(currency!);
  }

  static Currency $default = Currency.uah;
  static void setDefaultCurrency(Currency currency) => $default = currency;

  final String code;
  final String number;

  bool get isDefault => code == $default.code;

  String get icon {
    switch (this) {
      case Currency.uah:
        return _uahIcon;
      case Currency.usd:
        return _usdIcon;
      case Currency.eur:
        return _eurIcon;

      default:
        return code;
    }
  }
}
