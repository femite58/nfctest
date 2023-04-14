import 'dart:typed_data';

class EmvUtils {
  static List<Map> emvTags = [
    {'tag': '41', 'description': 'ISO 7816, Country code and national data'},
    {
      'tag': '42',
      'description': 'ISO 7816, Issuer Identification Number (IIN)'
    },
    {'tag': '43', 'description': 'ISO 7816, Card service data'},
    {'tag': '44', 'description': 'ISO 7816, Initial access data'},
    {'tag': '45', 'description': "ISO 7816, Card issuer's data"},
    {'tag': '46', 'description': 'ISO 7816, Pre-issuing data'},
    {'tag': '47', 'description': 'ISO 7816, Card capabilities'},
    {'tag': '48', 'description': 'ISO 7816, Status information'},
    {'tag': '4D', 'description': 'ISO 7816, Extended header list'},
    {
      'tag': '4F',
      'description': 'ISO 7816, Application Identifier (AID), Card'
    },
    {'tag': '50', 'description': 'ISO 7816, Application Label'},
    {'tag': '51', 'description': 'ISO 7816, Path (see 5.2.1)'},
    {'tag': '52', 'description': 'ISO 7816, Command-to-perform'},
    {
      'tag': '53',
      'description': 'ISO 7816, Discretionary data, discretionary template'
    },
    {'tag': '56', 'description': 'ISO 7816, Track 1, Equivalent Data'},
    {'tag': '57', 'description': 'ISO 7816, Track 2, Equivalent Data'},
    {'tag': '58', 'description': 'ISO 7816, Track 3, Equivalent Data'},
    {'tag': '59', 'description': 'ISO 7816, card expiration date'},
    {
      'tag': '5A',
      'description': 'ISO 7816, Application Primary Account Number (PAN)'
    },
    {'tag': '5B', 'description': 'ISO 7816, Name of an individual'},
    {'tag': '5C', 'description': 'ISO 7816, Tag list'},
    {'tag': '5D', 'description': 'ISO 7816, Header list'},
    {'tag': '5E', 'description': 'ISO 7816, Proprietary login data'},
    {'tag': '5F20', 'description': 'ISO 7816, Cardholder name'},
    {
      'tag': '5F21',
      'description': 'ISO 7816, Track 1, identical to the data coded'
    },
    {
      'tag': '5F22',
      'description': 'ISO 7816, Track 2, identical to the data coded'
    },
    {
      'tag': '5F23',
      'description': 'ISO 7816, Track 3, identical to the data coded'
    },
    {'tag': '5F24', 'description': 'ISO 7816, Date, Application Expiration'},
    {'tag': '5F25', 'description': 'ISO 7816, Date, Application Effective'},
    {'tag': '5F26', 'description': 'ISO 7816, Date, Card Effective'},
    {'tag': '5F27', 'description': 'ISO 7816, Interchange control'},
    {'tag': '5F28', 'description': 'ISO 7816, Country Code, Issuer'},
    {'tag': '5F29', 'description': 'ISO 7816, Interchange profile'},
    {'tag': '5F2A', 'description': 'ISO 7816, Currency Code, Transaction'},
    {'tag': '5F2B', 'description': 'ISO 7816, Date of birth'},
    {'tag': '5F2C', 'description': 'ISO 7816, Cardholder nationality'},
    {'tag': '5F2D', 'description': 'ISO 7816, Language Preference'},
    {'tag': '5F2E', 'description': 'ISO 7816, Cardholder biometric data'},
    {'tag': '5F2F', 'description': 'ISO 7816, PIN usage policy'},
    {'tag': '5F30', 'description': 'ISO 7816, Service Code'},
    {'tag': '5F32', 'description': 'ISO 7816, Transaction counter'},
    {'tag': '5F33', 'description': 'ISO 7816, Date, Transaction'},
    {
      'tag': '5F34',
      'description':
          'ISO 7816, Application Primary Account Number (PAN) Sequence Number / Card Sequence Number (CSN)'
    },
    {'tag': '5F35', 'description': 'ISO 7816, Sex (ISO 5218)'},
    {'tag': '5F36', 'description': 'ISO 7816, Currency Exponent, Transaction'},
    {
      'tag': '5F37',
      'description': 'ISO 7816, Static internal authentication (one-step)'
    },
    {
      'tag': '5F38',
      'description':
          'ISO 7816, Static internal authentication - first associated data'
    },
    {
      'tag': '5F39',
      'description':
          'ISO 7816, Static internal authentication - second associated data'
    },
    {'tag': '5F3A', 'description': 'ISO 7816, Dynamic internal authentication'},
    {'tag': '5F3B', 'description': 'ISO 7816, Dynamic external authentication'},
    {'tag': '5F3C', 'description': 'ISO 7816, Dynamic mutual authentication'},
    {'tag': '5F40', 'description': 'ISO 7816, Cardholder portrait image'},
    {'tag': '5F41', 'description': 'ISO 7816, Element list'},
    {'tag': '5F42', 'description': 'ISO 7816, Address'},
    {
      'tag': '5F43',
      'description': 'ISO 7816, Cardholder handwritten signature image'
    },
    {'tag': '5F44', 'description': 'ISO 7816, Application image'},
    {'tag': '5F45', 'description': 'ISO 7816, Display message'},
    {'tag': '5F46', 'description': 'ISO 7816, Timer'},
    {'tag': '5F47', 'description': 'ISO 7816, Message reference'},
    {'tag': '5F48', 'description': 'ISO 7816, Private Key, Cardholder'},
    {'tag': '5F49', 'description': 'ISO 7816, Public Key, Cardholder'},
    {
      'tag': '5F4A',
      'description': 'ISO 7816, Public Key, Certification Authority'
    },
    {'tag': '5F4B', 'description': 'ISO 7816, Deprecated (see note 2 below)'},
    {
      'tag': '5F4C',
      'description': 'ISO 7816, Certificate holder authorization'
    },
    {
      'tag': '5F4D',
      'description': 'ISO 7816, Integrated circuit manufacturer identifier'
    },
    {'tag': '5F4E', 'description': 'ISO 7816, Certificate content'},
    {'tag': '5F50', 'description': 'ISO 7816, Uniform resource locator (URL)'},
    {'tag': '5F52', 'description': 'ISO 7816, ATR Historical Bytes'},
    {'tag': '60', 'description': 'ISO 7816, Template, Dynamic Authentication'},
    {
      'tag': '60x80',
      'description':
          'ISO 7816, Commitment (e.g., a positive number less than the public RSA modulus in use)'
    },
    {
      'tag': '60x81',
      'description':
          'ISO 7816, Challenge (e.g., a number, possibly zero, less than the public RSA exponent in use)'
    },
    {
      'tag': '60x82',
      'description':
          'ISO 7816, Response (e.g., a positive number less than the public RSA modulus in use)'
    },
    {
      'tag': '60x83',
      'description':
          'ISO 7816, Committed challenge (e.g., the hash-code of a commitment data object)'
    },
    {
      'tag': '60x84',
      'description':
          'ISO 7816, Authentication code (e.g., the hash-code of one or more data fields and a commitment data object)'
    },
    {
      'tag': '60x85',
      'description':
          'ISO 7816, Exponential (e.g., a public positive number for establishing a session key by a DH method)'
    },
    {'tag': '60xA0', 'description': 'ISO 7816, Template, Identification data'},
    {'tag': '61', 'description': 'ISO 7816, Template, Application'},
    {
      'tag': '62',
      'description': 'ISO 7816, Template, File Control Parameters (FCP)'
    },
    {
      'tag': '62x80',
      'description':
          'ISO 7816, Number of data bytes in the file, excluding structural information'
    },
    {
      'tag': '62x81',
      'description':
          'ISO 7816, Number of data bytes in the file, including structural information if any'
    },
    {'tag': '62x82', 'description': 'ISO 7816, File descriptor byte'},
    {'tag': '62x83', 'description': 'ISO 7816, File identifier'},
    {'tag': '62x84', 'description': 'ISO 7816, DF name'},
    {
      'tag': '62x85',
      'description':
          'ISO 7816, Proprietary information, primitive encoding (i.e., not coded in BER-TLV)'
    },
    {
      'tag': '62x86',
      'description': 'ISO 7816, Security attribute in proprietary format'
    },
    {
      'tag': '62x87',
      'description':
          'ISO 7816, Identifier of an EF containing an extension of the file control information'
    },
    {'tag': '62x88', 'description': 'ISO 7816, Short EF identifier'},
    {'tag': '62x8A', 'description': 'ISO 7816, Life cycle status byte (LCS)'},
    {
      'tag': '62x8B',
      'description':
          'ISO 7816, Security attribute referencing the expanded format'
    },
    {
      'tag': '62x8C',
      'description': 'ISO 7816, Security attribute in compact format'
    },
    {
      'tag': '62x8D',
      'description':
          'ISO 7816, Identifier of an EF containing security environment templates'
    },
    {
      'tag': '62xA0',
      'description': 'ISO 7816, Template, Security attribute for data objects'
    },
    {
      'tag': '62xA1',
      'description':
          'ISO 7816, Template, Security attribute for physical interfaces'
    },
    {
      'tag': '62xA2',
      'description':
          'ISO 7816, One or more pairs of data objects, short EF identifier (tag 88) - absolute or relative path (tag 51)'
    },
    {
      'tag': '62xA5',
      'description': 'ISO 7816, Proprietary information, constructed encoding'
    },
    {
      'tag': '62xAB',
      'description': 'ISO 7816, Security attribute in expanded format'
    },
    {
      'tag': '62xAC',
      'description': 'ISO 7816, Identifier of a cryptographic mechanism'
    },
    {'tag': '63', 'description': 'ISO 7816, Wrapper'},
    {
      'tag': '64',
      'description': 'ISO 7816, Template, File Management Data (FMD)'
    },
    {'tag': '65', 'description': 'ISO 7816, Cardholder related data'},
    {'tag': '66', 'description': 'ISO 7816, Template, Card data'},
    {'tag': '67', 'description': 'ISO 7816, Template, Authentication data'},
    {'tag': '68', 'description': 'ISO 7816, Special user requirements'},
    {'tag': '6A', 'description': 'ISO 7816, Template, Login'},
    {'tag': '6Ax80', 'description': 'ISO 7816, Qualifier'},
    {'tag': '6Ax81', 'description': 'ISO 7816, Telephone Number'},
    {'tag': '6Ax82', 'description': 'ISO 7816, Text'},
    {
      'tag': '6Ax83',
      'description':
          'ISO 7816, Delay indicators, for detecting an end of message'
    },
    {
      'tag': '6Ax84',
      'description':
          'ISO 7816, Delay indicators, for detecting an absence of response'
    },
    {'tag': '6B', 'description': 'ISO 7816, Template, Qualified name'},
    {'tag': '6Bx06', 'description': 'ISO 7816, Qualified name'},
    {'tag': '6Bx80', 'description': 'ISO 7816, Name'},
    {'tag': '6BxA0', 'description': 'ISO 7816, Name'},
    {'tag': '6C', 'description': 'ISO 7816, Template, Cardholder image'},
    {'tag': '6D', 'description': 'ISO 7816, Template, Application image'},
    {'tag': '6Dx67x53', 'description': 'ISO 7816, Image Encoding Format'},
    {'tag': '6E', 'description': 'ISO 7816, Application related data'},
    {
      'tag': '6F',
      'description':
          'ISO 7816, Template, File Control Parameters and File Management Data (FCI)'
    },
    {'tag': '70', 'description': 'EMV, Template, AEF Data'},
    {'tag': '73', 'description': 'ISO 7816, Template, Directory Discretionary'},
    {
      'tag': '78',
      'description': 'ISO 7816, Compatible Tag Allocation Authority'
    },
    {
      'tag': '79',
      'description': 'ISO 7816, Coexistent Tag Allocation Authority'
    },
    {
      'tag': '7A',
      'description': 'ISO 7816, Template, Security Support (SS);see 6.4'
    },
    {'tag': '7Ax80', 'description': 'ISO 7816, Card session counter'},
    {'tag': '7Ax81', 'description': 'ISO 7816, Session identifier'},
    {'tag': '7Ax82', 'description': 'ISO 7816, File selection counter'},
    {'tag': '7Ax83', 'description': 'ISO 7816, File selection counter'},
    {'tag': '7Ax84', 'description': 'ISO 7816, File selection counter'},
    {'tag': '7Ax85', 'description': 'ISO 7816, File selection counter'},
    {'tag': '7Ax86', 'description': 'ISO 7816, File selection counter'},
    {'tag': '7Ax87', 'description': 'ISO 7816, File selection counter'},
    {'tag': '7Ax88', 'description': 'ISO 7816, File selection counter'},
    {'tag': '7Ax89', 'description': 'ISO 7816, File selection counter'},
    {'tag': '7Ax8A', 'description': 'ISO 7816, File selection counter'},
    {'tag': '7Ax8B', 'description': 'ISO 7816, File selection counter'},
    {'tag': '7Ax8C', 'description': 'ISO 7816, File selection counter'},
    {'tag': '7Ax8D', 'description': 'ISO 7816, File selection counter'},
    {'tag': '7Ax8E', 'description': 'ISO 7816, File selection counter'},
    {'tag': '7Ax93', 'description': 'ISO 7816, Digital signature counter'},
    {
      'tag': '7Ax9F2X',
      'description':
          "ISO 7816, Internal progression value ('X'-is a specific index, e.g., an index referencing a counter of file selections)"
    },
    {
      'tag': '7Ax9F3Y',
      'description':
          "ISO 7816, External progression value ('Y'-is a specific index, e.g., an index referencing an external time stamp)"
    },
    {
      'tag': '7B',
      'description': 'ISO 7816, Template, Security Environment (SE); see 6.5'
    },
    {'tag': '7Bx80', 'description': 'ISO 7816, SEID byte, mandatory'},
    {'tag': '7Bx8A', 'description': 'ISO 7816, LCS byte, optional'},
    {'tag': '7BxA4', 'description': 'ISO 7816, SE Authentication (AT)'},
    {'tag': '7BxA6', 'description': 'ISO 7816, SE Key Agreement (KAT)'},
    {'tag': '7BxAA', 'description': 'ISO 7816, SE Hashing (HT)'},
    {
      'tag': '7BxAC',
      'description':
          'ISO 7816, Cryptographic mechanism identifier template, optional'
    },
    {'tag': '7BxB4', 'description': 'ISO 7816, SE Cryptographic Checksum'},
    {'tag': '7BxB6', 'description': 'ISO 7816, SE Digital signature (DST)'},
    {'tag': '7BxB8', 'description': 'ISO 7816, SE Confidentiality (CT)'},
    {
      'tag': '7D',
      'description': 'ISO 7816, Template, Secure Messaging (SM);see 6'
    },
    {
      'tag': '7Dx80',
      'description': 'ISO 7816, Plain value not coded in BER-TLV'
    },
    {
      'tag': '7Dx81',
      'description': 'ISO 7816, Plain value not coded in BER-TLV'
    },
    {
      'tag': '7Dx82',
      'description':
          'ISO 7816, Cryptogram (plain value coded in BER-TLV and including secure messaging data objects)'
    },
    {
      'tag': '7Dx83',
      'description':
          'ISO 7816, Cryptogram (plain value coded in BER-TLV and including secure messaging data objects)'
    },
    {
      'tag': '7Dx84',
      'description':
          'ISO 7816, Cryptogram (plain value coded in BER-TLV, but not including secure messaging data objects)'
    },
    {
      'tag': '7Dx85',
      'description':
          'ISO 7816, Cryptogram (plain value coded in BER-TLV, but not including secure messaging data objects)'
    },
    {
      'tag': '7Dx86',
      'description':
          'ISO 7816, Padding-content indicator byte followed by cryptogram (plain value not coded in BER-TLV)'
    },
    {
      'tag': '7Dx87',
      'description':
          'ISO 7816, Padding-content indicator byte followed by cryptogram (plain value not coded in BER-TLV)'
    },
    {
      'tag': '7Dx8E',
      'description': 'ISO 7816, Cryptographic checksum (at least four bytes)'
    },
    {'tag': '7Dx90', 'description': 'ISO 7816, Hash-code'},
    {'tag': '7Dx91', 'description': 'ISO 7816, Hash-code'},
    {
      'tag': '7Dx92',
      'description': 'ISO 7816, Certificate (not BER-TLV coded data)'
    },
    {
      'tag': '7Dx93',
      'description': 'ISO 7816, Certificate (not BER-TLV coded data)'
    },
    {
      'tag': '7Dx94',
      'description':
          'ISO 7816, Security environment identifier (SEID byte, see 6.5)'
    },
    {
      'tag': '7Dx95',
      'description':
          'ISO 7816, Security environment identifier (SEID byte, see 6.5)'
    },
    {
      'tag': '7Dx96',
      'description':
          'ISO 7816, Number Le in the unsecured command APDU (one or two bytes)'
    },
    {
      'tag': '7Dx97',
      'description':
          'ISO 7816, Number Le in the unsecured command APDU (one or two bytes)'
    },
    {
      'tag': '7Dx99',
      'description':
          'ISO 7816, Processing status of the secured response APDU (new SW1-SW2, two bytes)'
    },
    {
      'tag': '7Dx9A',
      'description':
          'ISO 7816, Input data element for the computation of a digital signature (the value field is signed)'
    },
    {
      'tag': '7Dx9B',
      'description':
          'ISO 7816, Input data element for the computation of a digital signature (the value field is signed)'
    },
    {'tag': '7Dx9C', 'description': 'ISO 7816, Public key'},
    {'tag': '7Dx9D', 'description': 'ISO 7816, Public key'},
    {'tag': '7Dx9E', 'description': 'ISO 7816, Digital signature'},
    {
      'tag': '7DxA0',
      'description':
          'ISO 7816, Input template for the computation of a hash-code (the template is hashed)'
    },
    {
      'tag': '7DxA1',
      'description':
          'ISO 7816, Input template for the computation of a hash-code (the template is hashed)'
    },
    {
      'tag': '7DxA2',
      'description':
          'ISO 7816, Input template for the verification of a cryptographic checksum (the template is integrated)'
    },
    {
      'tag': '7DxA4',
      'description':
          'ISO 7816, Control reference template for authentication (AT)'
    },
    {
      'tag': '7DxA5',
      'description':
          'ISO 7816, Control reference template for authentication (AT)'
    },
    {
      'tag': '7DxA8',
      'description':
          'ISO 7816, Input template for the verification of a digital signature (the template is signed)'
    },
    {
      'tag': '7DxAA',
      'description': 'ISO 7816, Template, Control reference for hash-code (HT)'
    },
    {
      'tag': '7DxAB',
      'description': 'ISO 7816, Template, Control reference for hash-code (HT)'
    },
    {
      'tag': '7DxAC',
      'description':
          'ISO 7816, Input template for the computation of a digital signature (the concatenated value fields are signed)'
    },
    {
      'tag': '7DxAD',
      'description':
          'ISO 7816, Input template for the computation of a digital signature (the concatenated value fields are signed)'
    },
    {
      'tag': '7DxAE',
      'description':
          'ISO 7816, Input template for the computation of a certificate (the concatenated value fields are certified)'
    },
    {
      'tag': '7DxAF',
      'description':
          'ISO 7816, Input template for the computation of a certificate (the concatenated value fields are certified)'
    },
    {
      'tag': '7DxB0',
      'description':
          'ISO 7816, Plain value coded in BER-TLV and including secure messaging data objects'
    },
    {
      'tag': '7DxB1',
      'description':
          'ISO 7816, Plain value coded in BER-TLV and including secure messaging data objects'
    },
    {
      'tag': '7DxB2',
      'description':
          'ISO 7816, Plain value coded in BER-TLV, but not including secure messaging data objects'
    },
    {
      'tag': '7DxB3',
      'description':
          'ISO 7816, Plain value coded in BER-TLV, but not including secure messaging data objects'
    },
    {
      'tag': '7DxB4',
      'description':
          'ISO 7816, Control reference template for cryptographic checksum (CCT)'
    },
    {
      'tag': '7DxB5',
      'description':
          'ISO 7816, Control reference template for cryptographic checksum (CCT)'
    },
    {
      'tag': '7DxB6',
      'description':
          'ISO 7816, Control reference template for digital signature (DST)'
    },
    {
      'tag': '7DxB7',
      'description':
          'ISO 7816, Control reference template for digital signature (DST)'
    },
    {
      'tag': '7DxB8',
      'description':
          'ISO 7816, Control reference template for confidentiality (CT)'
    },
    {
      'tag': '7DxB9',
      'description':
          'ISO 7816, Control reference template for confidentiality (CT)'
    },
    {'tag': '7DxBA', 'description': 'ISO 7816, Response descriptor template'},
    {'tag': '7DxBB', 'description': 'ISO 7816, Response descriptor template'},
    {
      'tag': '7DxBC',
      'description':
          'ISO 7816, Input template for the computation of a digital signature (the template is signed)'
    },
    {
      'tag': '7DxBD',
      'description':
          'ISO 7816, Input template for the computation of a digital signature (the template is signed)'
    },
    {
      'tag': '7DxBE',
      'description':
          'ISO 7816, Input template for the verification of a certificate (the template is certified)'
    },
    {
      'tag': '7E',
      'description': 'ISO 7816, Template, Nesting Interindustry data objects'
    },
    {'tag': '7F20', 'description': 'ISO 7816, Display control template'},
    {'tag': '7F21', 'description': 'ISO 7816, Cardholder certificate'},
    {'tag': '7F2E', 'description': 'ISO 7816, Biometric data template'},
    {'tag': '7F49', 'description': 'ISO 7816, Template, Cardholder public key'},
    {
      'tag': '7F49x80',
      'description':
          'ISO 7816, Algorithm reference as used in control reference data objects for secure messaging'
    },
    {
      'tag': '7F49x81',
      'description':
          'ISO 7816, RSA Modulus (a number denoted as n coded on x bytes), or DSA First prime (a number denoted as p coded on y bytes), or ECDSA Prime (a number denoted as p coded on z bytes)'
    },
    {
      'tag': '7F49x82',
      'description':
          'ISO 7816, RSA Public exponent (a number denoted as v, e.g., 65537), or DSA Second prime (a number denoted as q dividing p-1, e.g., 20 bytes), or ECDSA First coefficient (a number denoted as a coded on z bytes)'
    },
    {
      'tag': '7F49x83',
      'description':
          'ISO 7816, DSA Basis (a number denoted as g of order q coded on y bytes), or ECDSA Second coefficient (a number denoted as b coded on z bytes)'
    },
    {
      'tag': '7F49x84',
      'description':
          'ISO 7816, DSA Public key (a number denoted as y equal to g to the power x mod p where x is the private key coded on y bytes), or ECDSA Generator (a point denoted as PB on the curve, coded on 2z bytes)'
    },
    {
      'tag': '7F49x85',
      'description':
          'ISO 7816, ECDSA Order (a prime number denoted as q, order of the generator PB, coded on z bytes)'
    },
    {
      'tag': '7F49x86',
      'description':
          'ISO 7816, ECDSA Public key (a point denoted as PP on the curve, equal to x times PB where x is the private key, coded on 2z bytes)'
    },
    {
      'tag': '7F4C',
      'description': 'ISO 7816, Template, Certificate Holder Authorization'
    },
    {'tag': '7F4E', 'description': 'ISO 7816, Certificate Body'},
    {
      'tag': '7F4Ex42',
      'description': 'ISO 7816, Certificate Authority Reference'
    },
    {
      'tag': '7F4Ex5F20',
      'description': 'ISO 7816, Certificate Holder Reference'
    },
    {
      'tag': '7F4Ex5F24',
      'description': 'ISO 7816, Expiration Date, Certificate'
    },
    {
      'tag': '7F4Ex5F25',
      'description': 'ISO 7816, Effective Date, Certificate'
    },
    {
      'tag': '7F4Ex5F29',
      'description': 'ISO 7816, Certificate Profile Identifier'
    },
    {'tag': '7F4Ex65', 'description': 'ISO 7816, Certificate Extensions'},
    {'tag': '7F60', 'description': 'ISO 7816, Template, Biometric information'},
    {'tag': '06', 'description': 'Object Identifier (OID)'},
    {
      'tag': '5F53',
      'description': 'EMV, International Bank Account Number (IBAN)'
    },
    {'tag': '5F54', 'description': 'EMV, Bank Identifier Code (BIC)'},
    {'tag': '5F55', 'description': 'EMV, Issuer Country Code (alpha2 format)'},
    {'tag': '5F56', 'description': 'EMV, Issuer Country Code (alpha3 format)'},
    {'tag': '5F57', 'description': 'EMV, Account Type'},
    {'tag': '6FxA5', 'description': 'EMV, Template, FCI A5'},
    {'tag': '71', 'description': 'EMV, Template, Issuer Script 1'},
    {'tag': '71x86', 'description': 'EMV, Issuer Script Command'},
    {'tag': '71x9F18', 'description': 'EMV, Issuer Script Identifier'},
    {'tag': '72', 'description': 'EMV, Template, Issuer Script 2'},
    {'tag': '77', 'description': 'EMV, Template, Response Message Format 2'},
    {'tag': '80', 'description': 'EMV, Template, Response Message Format 1'},
    {'tag': '81', 'description': 'EMV, Authorised Amount (Binary)'},
    {'tag': '82', 'description': 'EMV, Application Interchange Profile (AIP)'},
    {'tag': '83', 'description': 'EMV, Template, Command'},
    {'tag': '84', 'description': 'EMV, Dedicated File (DF) Name'},
    {'tag': '86', 'description': 'EMV, Issuer Script Command'},
    {'tag': '87', 'description': 'EMV, Application Priority Indicator'},
    {'tag': '88', 'description': 'EMV, Short File Identifier (SFI)'},
    {'tag': '89', 'description': 'EMV, Authorization Code'},
    {'tag': '8A', 'description': 'EMV, Authorization Response Code (ARC)'},
    {'tag': '8C', 'description': 'EMV, Card Risk Management DOL 1 (CDOL1)'},
    {'tag': '8D', 'description': 'EMV, Card Risk Management DOL 2 (CDOL2)'},
    {
      'tag': '8E',
      'description': 'EMV, Cardholder Verification Method (CVM) List'
    },
    {
      'tag': '8F',
      'description': 'EMV, Public Key Index, Certification Authority, Card'
    },
    {'tag': '90', 'description': 'EMV, Public Key Certificate, Issuer'},
    {'tag': '91', 'description': 'EMV, Issuer Authentication Data'},
    {'tag': '92', 'description': 'EMV, Public Key Remainder, Issuer'},
    {'tag': '93', 'description': 'EMV, Signed Static Application Data (SAD)'},
    {'tag': '94', 'description': 'EMV, Application File Locator (AFL)'},
    {'tag': '95', 'description': 'EMV, Terminal Verification Results (TVR)'},
    {'tag': '97', 'description': 'EMV, Transaction Certificate DOL (TDOL)'},
    {
      'tag': '98',
      'description': 'EMV, Transaction Certificate (TC) Hash Value'
    },
    {'tag': '99', 'description': 'EMV, Transaction PIN Data'},
    {'tag': '9A', 'description': 'EMV, Date, Transaction'},
    {'tag': '9B', 'description': 'EMV, Transaction Status Information (TSI)'},
    {'tag': '9C', 'description': 'EMV, Transaction Type'},
    {'tag': '9D', 'description': 'EMV, Directory Definition File (DDF) Name'},
    {'tag': '9F01', 'description': 'EMV, Acquirer Identifier'},
    {'tag': '9F02', 'description': 'EMV, Authorised Amount (Numeric)'},
    {'tag': '9F03', 'description': 'EMV, Amount, Other (Numeric)'},
    {'tag': '9F04', 'description': 'EMV, Amount, Other (Binary)'},
    {'tag': '9F05', 'description': 'EMV, Discretionary Data, Application'},
    {
      'tag': '9F06',
      'description': 'EMV, Application Identifier (AID), Terminal'
    },
    {'tag': '9F07', 'description': 'EMV, Application Usage Control (AUC)'},
    {'tag': '9F08', 'description': 'EMV, Application Version Number, Card'},
    {'tag': '9F09', 'description': 'EMV, Application Version Number, Terminal'},
    {
      'tag': '9F0A',
      'description':
          'EMV, Application Selection Registered Proprietary Data (ASRPD)'
    },
    {'tag': '9F0B', 'description': 'EMV, Cardholder Name - Extended'},
    {
      'tag': '9F0C',
      'description': 'EMV, Issuer Identification Number Extended (IINE)'
    },
    {'tag': '9F0D', 'description': 'EMV, Issuer Action Code - Default'},
    {'tag': '9F0E', 'description': 'EMV, Issuer Action Code - Denial'},
    {'tag': '9F0F', 'description': 'EMV, Issuer Action Code - Online'},
    {'tag': '9F10', 'description': 'EMV, Issuer Application Data (IAD)'},
    {'tag': '9F11', 'description': 'EMV, Issuer Code Table Index'},
    {'tag': '9F12', 'description': 'EMV, Application Preferred Name'},
    {'tag': '9F13', 'description': 'EMV, Last Online ATC Register'},
    {
      'tag': '9F14',
      'description': 'EMV, Lower Consecutive Offline Limit (LCOL)'
    },
    {'tag': '9F15', 'description': 'EMV, Merchant Category Code (MCC)'},
    {'tag': '9F16', 'description': 'EMV, Merchant Identifier'},
    {'tag': '9F17', 'description': 'EMV, PIN Try Counter'},
    {'tag': '9F18', 'description': 'EMV, Issuer Script Identifier'},
    {'tag': '9F19', 'description': 'EMV Tokenisation, Token Requestor ID'},
    {'tag': '9F1A', 'description': 'EMV, Country Code, Terminal'},
    {'tag': '9F1B', 'description': 'EMV, Terminal Floor Limit'},
    {'tag': '9F1C', 'description': 'EMV, Terminal Identification'},
    {'tag': '9F1D', 'description': 'EMV, Terminal Risk Management Data'},
    {'tag': '9F1E', 'description': 'EMV, Interface Device (IFD) Serial Number'},
    {'tag': '9F1F', 'description': 'EMV, Track 1, Discretionary Data'},
    {'tag': '9F20', 'description': 'EMV, Track 2, Discretionary Data'},
    {'tag': '9F21', 'description': 'EMV, Time, Transaction'},
    {
      'tag': '9F22',
      'description': 'EMV, Public Key Index, Certification Authority, Terminal'
    },
    {
      'tag': '9F23',
      'description': 'EMV, Upper Consecutive Offline Limit (UCOL)'
    },
    {
      'tag': '9F24',
      'description': 'EMV Tokenisation, Payment Account Reference (PAR)'
    },
    {'tag': '9F25', 'description': 'EMV Tokenisation, Last 4 Digits of PAN'},
    {'tag': '9F26', 'description': 'EMV, Cryptogram, Application'},
    {'tag': '9F27', 'description': 'EMV, Cryptogram Information Data (CID)'},
    {
      'tag': '9F28',
      'description': 'EMV, Contactless Application Capabilities Type'
    },
    {'tag': '9F29', 'description': 'EMV, Extended Selection'},
    {'tag': '9F2A', 'description': 'EMV, Kernel Identifier'},
    {
      'tag': '9F2D',
      'description': 'EMV, Public Key Certificate, ICC PIN Encipherment'
    },
    {
      'tag': '9F2E',
      'description': 'EMV, Public Key Exponent, ICC PIN Encipherment'
    },
    {
      'tag': '9F2F',
      'description': 'EMV, Public Key Remainder, ICC PIN Encipherment'
    },
    {'tag': '9F32', 'description': 'EMV, Public Key Exponent, Issuer'},
    {'tag': '9F33', 'description': 'EMV, Terminal Capabilities'},
    {
      'tag': '9F34',
      'description': 'EMV, Cardholder Verification Method (CVM) Results'
    },
    {'tag': '9F35', 'description': 'EMV, Terminal Type'},
    {
      'tag': '9F36',
      'description': 'EMV, Application Transaction Counter (ATC)'
    },
    {'tag': '9F37', 'description': 'EMV, Unpredictable Number'},
    {'tag': '9F38', 'description': 'EMV, Processing Options DOL (PDOL)'},
    {'tag': '9F39', 'description': 'EMV, POS Entry Mode'},
    {'tag': '9F3A', 'description': 'EMV, Amount, Reference Currency (Binary)'},
    {'tag': '9F3B', 'description': 'EMV, Currency Code, Application Reference'},
    {'tag': '9F3C', 'description': 'EMV, Currency Code, Transaction Reference'},
    {
      'tag': '9F3D',
      'description': 'EMV, Currency Exponent, Transaction Reference'
    },
    {'tag': '9F3E', 'description': 'EMV, Terminal Categories Supported List'},
    {'tag': '9F3F', 'description': 'EMV, Selection Data Object List (SDOL)'},
    {
      'tag': '9F40',
      'description': 'EMV, Additional Terminal Capabilities (ATC)'
    },
    {'tag': '9F41', 'description': 'EMV, Transaction Sequence Counter'},
    {'tag': '9F42', 'description': 'EMV, Currency Code, Application'},
    {
      'tag': '9F43',
      'description': 'EMV, Currency Exponent, Application Reference'
    },
    {'tag': '9F44', 'description': 'EMV, Currency Exponent, Application'},
    {'tag': '9F45', 'description': 'EMV, Data Authentication Code'},
    {'tag': '9F46', 'description': 'EMV, Public Key Certificate, ICC'},
    {'tag': '9F47', 'description': 'EMV, Public Key Exponent, ICC'},
    {'tag': '9F48', 'description': 'EMV, Public Key Remainder, ICC'},
    {'tag': '9F49', 'description': 'EMV, Data Object List, Dynamic (DDOL)'},
    {
      'tag': '9F4A',
      'description': 'EMV, Tag List, Static Data Authentication (SDA)'
    },
    {
      'tag': '9F4B',
      'description': 'EMV, Signed Dynamic Application Data (SDAD)'
    },
    {'tag': '9F4C', 'description': 'EMV, ICC Dynamic Number'},
    {'tag': '9F4D', 'description': 'EMV, Log Entry'},
    {'tag': '9F4E', 'description': 'EMV, Merchant Name and Location'},
    {'tag': '9F4F', 'description': 'EMV, Log Format'},
    {'tag': 'A5', 'description': 'EMV, FCI Proprietary Template'},
    {'tag': 'BF0C', 'description': 'EMV, FCI Issuer Discretionary Data'}
  ];

  // 70145a0840179541046963575f24032608319f4a0182
  static decode(dynamic todecode) {
    String hex = '';
    if (todecode.runtimeType == String) {
      hex = todecode;
    } else {
      hex = todecode.map((t) => t.toRadixString(16).padLeft(2, '0')).join('');
    }
    RegExp regex = RegExp(
        r'^(' +
            '${emvTags.where((e) => !e['tag'].contains('x')).map((e) => e['tag']).join('|')})',
        caseSensitive: false);
    String sval = hex;
    int frolen = 0;
    List decoded = [];
    while (sval.isNotEmpty) {
      var val = sval;
      while (regex.hasMatch(val)) {
        String tag = regex.firstMatch(val)?[0] as String;
        frolen += tag.length + 2;
        try {
          var lenhex = val.substring(tag.length, tag.length + 2);
          var len = int.parse('0x$lenhex');
          var newVal = val.substring(tag.length + lenhex.length,
              tag.length + lenhex.length + (len * 2));
          var desc = emvTags
              .firstWhere((e) => e['tag'] == tag.toUpperCase())['description'];
          var deccopy = [...decoded];
          deccopy.sort(
              (a, b) => a['rawValue'].length.compareTo(b['rawValue'].length));
          decoded.add({
            'tag': tag,
            'lenHex': lenhex,
            'description': desc,
            'ownerTag': decoded.isEmpty
                ? ''
                : deccopy.firstWhere(
                    (d) => d['rawValue'].contains('$tag$lenhex$newVal'))['tag'],
            'rawValue': newVal,
            'decodedValue': RegExp(
                        r'name|country|sex|language|currency|nationality',
                        caseSensitive: false)
                    .hasMatch(desc)
                ? () {
                    List<int> l = [];
                    for (int i = 0; i < newVal.length; i += 2) {
                      l.add(int.parse('0x${newVal[i]}${newVal[i + 1]}'));
                    }
                    return String.fromCharCodes(Uint8List.fromList(l));
                  }()
                : newVal,
          });
          val = newVal;
        } catch (e) {
          break;
        }
      }
      sval = '';
      int strlen = frolen + decoded.last['rawValue'].length as int;
      if (strlen < hex.length) {
        sval = hex.substring(strlen);
        frolen = hex.length - sval.length;
      }
    }
    return decoded;
  }
}
