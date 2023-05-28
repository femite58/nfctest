const List EMVTAGS = [
  {
    "tag": "06",
    "name": "Object Identifier (OID)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "41",
    "name": "Country code and national data",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "42",
    "name": "Issuer Identification Number (IIN)",
    "description":
        "The number that identifies the major industry and the card issuer and that forms the first part of the Primary Account Number (PAN)",
    "source": "Card",
    "type": "n 6"
  },
  {
    "tag": "43",
    "name": "Card service data",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "44",
    "name": "Initial access data",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "45",
    "name": "Card issuer`s data",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "46",
    "name": "Pre-issuing data",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "47",
    "name": "Card capabilities",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "48",
    "name": "Status information",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "4D",
    "name": "Extended header list",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "4F",
    "name": "Application Identifier (ADF Name)",
    "description":
        "The ADF Name identifies the application as described in [ISO 7816-5]. The AID is made up of the Registered Application Provider Identifier (RID) and the Proprietary Identifier Extension (PIX).",
    "source": "Card",
    "type": "binary 40-128"
  },
  {
    "tag": "50",
    "name": "Application Label",
    "description":
        "Mnemonic associated with the AID according to ISO/IEC 7816-5",
    "source": "Card",
    "type": "ans with the special character limited to space"
  },
  {
    "tag": "51",
    "name": "Path",
    "description":
        "A path may reference any file. It is a concatenation of file identifiers. The path begins with the identifier of a DF (the MF for an absolute path or the current DF for a relative path) and ends with the identifier of the file itself.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "52",
    "name": "Command to perform",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "53",
    "name": "Discretionary data, discretionary template",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "56",
    "name": "Track 1 Data",
    "description":
        "Track 1 Data contains the data objects of the track 1 according to [ISO/IEC 7813] Structure B, excluding start sentinel, end sentinel and LRC. The Track 1 Data may be present in the file read using the READ RECORD command during a mag-stripe mode transaction.",
    "source": "",
    "type": "ans"
  },
  {
    "tag": "57",
    "name": "Track 2 Equivalent Data",
    "description":
        "Contains the data objects of the track 2, in accordance with [ISO/IEC 7813], excluding start sentinel, end sentinel, and LRC.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "58",
    "name": "Track 3 Equivalent Data",
    "description": "",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "59",
    "name": "Card expiration date",
    "description": "",
    "source": "Card",
    "type": ""
  },
  {
    "tag": "5A",
    "name": "Application Primary Account Number (PAN)",
    "description": "Valid cardholder account number",
    "source": "Card",
    "type": "cn variable up to 19"
  },
  {
    "tag": "5B",
    "name": "Name of an individual",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5C",
    "name": "Tag list",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5D",
    "name": "Deleted (see 9D)",
    "description": "",
    "source": "Terminal",
    "type": "H"
  },
  {
    "tag": "5E",
    "name": "Proprietary login data",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F20",
    "name": "Cardholder Name",
    "description": "Indicates cardholder name according to ISO 7813",
    "source": "Card",
    "type": "ans 2-26"
  },
  {
    "tag": "5F21",
    "name": "Track 1, identical to the data coded",
    "description": "",
    "source": "Card",
    "type": ""
  },
  {
    "tag": "5F22",
    "name": "Track 2, identical to the data coded",
    "description": "",
    "source": "Card",
    "type": ""
  },
  {
    "tag": "5F23",
    "name": "Track 3, identical to the data coded",
    "description": "",
    "source": "Card",
    "type": ""
  },
  {
    "tag": "5F24",
    "name": "Application Expiration Date",
    "description":
        "Date after which application expires. The date is expressed in the YYMMDD format. For MasterCard applications, if the value of YY ranges from '00' to '49' the date reads 20YYMMDD. If the value of YY ranges from '50' to '99' the date reads 19YYMMDD.",
    "source": "Card",
    "type": "n 6 (YYMMDD)"
  },
  {
    "tag": "5F25",
    "name": "Application Effective Date",
    "description":
        "Date from which the application may be used. The date is expressed in the YYMMDD format. For MasterCard branded applications if the value of YY ranges from '00' to '49' the date reads 20YYMMDD. If the value of YY ranges from '50' to '99', the date reads 19YYMMDD.",
    "source": "Card",
    "type": "n 6 (YYMMDD)"
  },
  {
    "tag": "5F26",
    "name": "Date, Card Effective",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F27",
    "name": "Interchange control",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F28",
    "name": "Issuer Country Code",
    "description":
        "Indicates the country of the issuer according to ISO 3166-1",
    "source": "Card",
    "type": "n 3"
  },
  {
    "tag": "5F29",
    "name": "Interchange profile",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F2A",
    "name": "Transaction Currency Code",
    "description":
        "Indicates the currency code of the transaction according to ISO 4217",
    "source": "Terminal",
    "type": "n 3"
  },
  {
    "tag": "5F2B",
    "name": "Date of birth",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F2C",
    "name": "Cardholder nationality",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F2D",
    "name": "Language Preference",
    "description":
        "1-4 languages stored in order of preference, each represented by 2 alphabetical characters according to ISO 639 Note: EMVCo strongly recommends that cards be personalised with data element '5F2D' coded in lowercase, but that terminals accept the data element whether it is coded in upper or lower case.",
    "source": "Card",
    "type": "an 2"
  },
  {
    "tag": "5F2E",
    "name": "Cardholder biometric data",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F2F",
    "name": "PIN usage policy",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F30",
    "name": "Service Code",
    "description":
        "Service code as defined in ISO/IEC 7813 for Track 1 and Track 2",
    "source": "Card",
    "type": "n 3"
  },
  {
    "tag": "5F32",
    "name": "Transaction counter",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F33",
    "name": "Date, Transaction",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F34",
    "name": "Application Primary Account Number (PAN) Sequence Number (PSN)",
    "description":
        "Identifies and differentiates cards with the same Application PAN",
    "source": "Card",
    "type": "n 2"
  },
  {
    "tag": "5F35",
    "name": "Sex (ISO 5218)",
    "description":
        "Representation of human sexes through a language-neutral single-digit code (0 = not known, 1 = male, 2 = female, 9 = not applicable)",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F36",
    "name": "Transaction Currency Exponent",
    "description":
        "Identifies the decimal point position from the right of the transaction amount accordin to ISO 4217",
    "source": "Terminal",
    "type": "n 1"
  },
  {
    "tag": "5F37",
    "name": "Static internal authentication (one-step)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F38",
    "name": "Static internal authentication - first associated data",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F39",
    "name": "Static internal authentication - second associated data",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F3A",
    "name": "Dynamic internal authentication",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F3B",
    "name": "Dynamic external authentication",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F3C",
    "name": "Transaction Reference Currency Code",
    "description": "Identifies the common currency used by the terminal",
    "source": "Terminal",
    "type": "binary 2"
  },
  {
    "tag": "5F3D",
    "name": "Transaction Reference Currency Exponent",
    "description":
        "Identifies the decimal point position from the right of the terminal common currency",
    "source": "Terminal",
    "type": "n 1"
  },
  {
    "tag": "5F40",
    "name": "Cardholder portrait image",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F41",
    "name": "Element list",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F42",
    "name": "Address",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F43",
    "name": "Cardholder handwritten signature image",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F44",
    "name": "Application image",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F45",
    "name": "Display message",
    "description": "",
    "source": "",
    "type": ""
  },
  {"tag": "5F46", "name": "Timer", "description": "", "source": "", "type": ""},
  {
    "tag": "5F47",
    "name": "Message reference",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F48",
    "name": "Cardholder private key",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F49",
    "name": "Cardholder public key",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F4A",
    "name": "Public key of certification authority",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F4B",
    "name": "Deprecated (see note 2 below)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F4C",
    "name": "Certificate holder authorization",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F4D",
    "name": "Integrated circuit manufacturer identifier",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F4E",
    "name": "Certificate content",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "5F50",
    "name": "Issuer Uniform resource locator (URL)",
    "description":
        "The URL provides the location of the Issuer's Library Server on the Internet.",
    "source": "Card",
    "type": "ans"
  },
  {
    "tag": "5F53",
    "name": "International Bank Account Number (IBAN)",
    "description":
        "Uniquely identifies the account of a customer at a financial institution as defined in ISO 13616.",
    "source": "Card",
    "type": "variable"
  },
  {
    "tag": "5F54",
    "name": "Bank Identifier Code (BIC)",
    "description": "Uniquely identifies a bank as defined in ISO 9362.",
    "source": "Card",
    "type": "variable"
  },
  {
    "tag": "5F55",
    "name": "Issuer Country Code (alpha2 format)",
    "description":
        "Indicates the country of the issuer as defined in ISO 3166 (using a 2 character alphabetic code)",
    "source": "Card",
    "type": "a 2"
  },
  {
    "tag": "5F56",
    "name": "Issuer Country Code (alpha3 format)",
    "description":
        "Indicates the country of the issuer as defined in ISO 3166 (using a 3 character alphabetic code)",
    "source": "Card",
    "type": "a 3"
  },
  {
    "tag": "5F57",
    "name": "Account Type",
    "description":
        "Indicates the type of account selected on the terminal, coded as specified in Annex G",
    "source": "Terminal",
    "type": "n 2"
  },
  {
    "tag": "60",
    "name": "Template, Dynamic Authentication",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6080",
    "name":
        "Commitment (e.g., a positive number less than the public RSA modulus in use)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6081",
    "name":
        "Challenge (e.g., a number, possibly zero, less than the public RSA exponent in use)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6082",
    "name":
        "Response (e.g., a positive number less than the public RSA modulus in use)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6083",
    "name":
        "Committed challenge (e.g., the hash-code of a commitment data object)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6084",
    "name":
        "Authentication code (e.g., the hash-code of one or more data fields and a commitment data object)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6085",
    "name":
        "Exponential (e.g., a public positive number for establishing a session key by a DH method)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "60A0",
    "name": "Template, Identification data",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "61",
    "name": "Application Template",
    "description":
        "Template containing one or more data objects relevant to an application directory entry according to [ISO 7816-5].",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "62",
    "name": "File Control Parameters (FCP) Template",
    "description": "Identifies the FCP template according to ISO/IEC 7816-4",
    "source": "Card",
    "type": "variable"
  },
  {
    "tag": "6280",
    "name":
        "Number of data bytes in the file, excluding structural information",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6281",
    "name":
        "Number of data bytes in the file, including structural information if any",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6282",
    "name": "File descriptor byte",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6283",
    "name": "File identifier",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6284",
    "name": "DF name",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6285",
    "name":
        "Proprietary information, primitive encoding (i.e., not coded in BER-TLV)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6286",
    "name": "Security attribute in proprietary format",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6287",
    "name":
        "Identifier of an EF containing an extension of the file control information",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6288",
    "name": "Short EF identifier",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "628A",
    "name": "Life cycle status byte (LCS)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "628B",
    "name": "Security attribute referencing the expanded format",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "628C",
    "name": "Security attribute in compact format",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "628D",
    "name": "Identifier of an EF containing security environment templates",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "62A0",
    "name": "Template, Security attribute for data objects",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "62A1",
    "name": "Template, Security attribute for physical interfaces",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "62A2",
    "name":
        "One or more pairs of data objects, short EF identifier (tag 88) - absolute or relative path (tag 51)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "62A5",
    "name": "Proprietary information, constructed encoding",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "62AB",
    "name": "Security attribute in expanded format",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "62AC",
    "name": "Identifier of a cryptographic mechanism",
    "description": "",
    "source": "",
    "type": ""
  },
  {"tag": "63", "name": "Wrapper", "description": "", "source": "", "type": ""},
  {
    "tag": "64",
    "name": "Template, File Management Data (FMD)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "65",
    "name": "Cardholder related data",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "66",
    "name": "Template, Card data",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "67",
    "name": "Template, Authentication data",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "68",
    "name": "Special user requirements",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6A",
    "name": "Template, Login",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6A80",
    "name": "Qualifier",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6A81",
    "name": "Telephone Number",
    "description": "",
    "source": "",
    "type": ""
  },
  {"tag": "6A82", "name": "Text", "description": "", "source": "", "type": ""},
  {
    "tag": "6A83",
    "name": "Delay indicators, for detecting an end of message",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6A84",
    "name": "Delay indicators, for detecting an absence of response",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6B",
    "name": "Template, Qualified name",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6B06",
    "name": "Qualified name",
    "description": "",
    "source": "",
    "type": ""
  },
  {"tag": "6B80", "name": "Name", "description": "", "source": "", "type": ""},
  {"tag": "6BA0", "name": "Name", "description": "", "source": "", "type": ""},
  {
    "tag": "6C",
    "name": "Template, Cardholder image",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6D",
    "name": "Template, Application image",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6E",
    "name": "Application related data",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "6F",
    "name": "File Control Information (FCI) Template",
    "description": "Identifies the FCI template according to ISO/IEC 7816-4",
    "source": "Card",
    "type": "variable"
  },
  {
    "tag": "6FA5",
    "name": "Template, FCI A5",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "70",
    "name": "READ RECORD Response Message Template",
    "description":
        "Template containing the data objects returned by the Card in response to a READ RECORD command. Contains the contents of the record read. (Mandatory for SFIs 1-10. Response messages for SFIs 11-30 are outside the scope of EMV, but may use template '70')",
    "source": "Card",
    "type": "variable"
  },
  {
    "tag": "71",
    "name": "Issuer Script Template 1",
    "description":
        "Contains proprietary issuer data for transmission to the ICC before the second GENERATE AC command",
    "source": "Issuer",
    "type": "binary"
  },
  {
    "tag": "7186",
    "name": "Issuer Script Command",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "719F18",
    "name": "Issuer Script Identifier",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "72",
    "name": "Issuer Script Template 2",
    "description":
        "Contains proprietary issuer data for transmission to the ICC after the second GENERATE AC command",
    "source": "Issuer",
    "type": "binary"
  },
  {
    "tag": "73",
    "name": "Directory Discretionary Template",
    "description":
        "Issuer discretionary part of the directory according to ISO/IEC 7816-5",
    "source": "Card",
    "type": "variable"
  },
  {
    "tag": "77",
    "name": "Response Message Template Format 2",
    "description":
        "Contains the data objects (with tags and lengths) returned by the ICC in response to a command",
    "source": "Card",
    "type": "variable"
  },
  {
    "tag": "78",
    "name": "Compatible Tag Allocation Authority",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "79",
    "name": "Coexistent Tag Allocation Authority",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7A",
    "name": "Template, Security Support (SS)",
    "description": "see 6.4",
    "source": "",
    "type": ""
  },
  {
    "tag": "7A80",
    "name": "Card session counter",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7A81",
    "name": "Session identifier",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7A82",
    "name": "File selection counter",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7A83",
    "name": "File selection counter",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7A84",
    "name": "File selection counter",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7A85",
    "name": "File selection counter",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7A86",
    "name": "File selection counter",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7A87",
    "name": "File selection counter",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7A88",
    "name": "File selection counter",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7A89",
    "name": "File selection counter",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7A8A",
    "name": "File selection counter",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7A8B",
    "name": "File selection counter",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7A8C",
    "name": "File selection counter",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7A8D",
    "name": "File selection counter",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7A8E",
    "name": "File selection counter",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7A93",
    "name": "Digital signature counter",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7A9F2X",
    "name":
        "Internal progression value ('X'-is a specific index, e.g., an index referencing a counter of file selections)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7A9F3Y",
    "name":
        "External progression value ('Y'-is a specific index, e.g., an index referencing an external time stamp)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7B",
    "name": "Template, Security Environment (SE)",
    "description": "see 6.5",
    "source": "",
    "type": ""
  },
  {
    "tag": "7B80",
    "name": "SEID byte, mandatory",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7B8A",
    "name": "LCS byte, optional",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7BAC",
    "name": "Cryptographic mechanism identifier template, optional",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7BA4",
    "name": "Control reference template (CRT)",
    "description": "see 6.3.1",
    "source": "",
    "type": ""
  },
  {
    "tag": "7BAA",
    "name": "Control reference template (CRT)",
    "description": "see 6.3.1",
    "source": "",
    "type": ""
  },
  {
    "tag": "7BB4",
    "name": "Control reference template (CRT)",
    "description": "see 6.3.1",
    "source": "",
    "type": ""
  },
  {
    "tag": "7BB6",
    "name": "Control reference template (CRT)",
    "description": "see 6.3.1",
    "source": "",
    "type": ""
  },
  {
    "tag": "7BB8",
    "name": "Control reference template (CRT)",
    "description": "see 6.3.1",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D",
    "name": "Template, Secure Messaging (SM)",
    "description": "see 6",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D80",
    "name": "Plain value not coded in BER-TLV",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D81",
    "name": "Plain value not coded in BER-TLV",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D82",
    "name":
        "Cryptogram (plain value coded in BER-TLV and including secure messaging data objects)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D83",
    "name":
        "Cryptogram (plain value coded in BER-TLV and including secure messaging data objects)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D84",
    "name":
        "Cryptogram (plain value coded in BER-TLV, but not including secure messaging data objects)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D85",
    "name":
        "Cryptogram (plain value coded in BER-TLV, but not including secure messaging data objects)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D86",
    "name":
        "Padding-content indicator byte followed by cryptogram (plain value not coded in BER-TLV)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D87",
    "name":
        "Padding-content indicator byte followed by cryptogram (plain value not coded in BER-TLV)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D8E",
    "name": "Cryptographic checksum (at least four bytes)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D90",
    "name": "Hash-code",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D91",
    "name": "Hash-code",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D92",
    "name": "Certificate (not BER-TLV coded data)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D93",
    "name": "Certificate (not BER-TLV coded data)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D94",
    "name": "Security environment identifier (SEID byte, see 6.5)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D95",
    "name": "Security environment identifier (SEID byte, see 6.5)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D96",
    "name": "Number Le in the unsecured command APDU (one or two bytes)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D97",
    "name": "Number Le in the unsecured command APDU (one or two bytes)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D99",
    "name":
        "Processing status of the secured response APDU (new SW1-SW2, two bytes)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D9A",
    "name":
        "Input data element for the computation of a digital signature (the value field is signed)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D9B",
    "name":
        "Input data element for the computation of a digital signature (the value field is signed)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D9C",
    "name": "Public key",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D9D",
    "name": "Public key",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7D9E",
    "name": "Digital signature",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DA0",
    "name":
        "Input template for the computation of a hash-code (the template is hashed)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DA1",
    "name":
        "Input template for the computation of a hash-code (the template is hashed)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DA2",
    "name":
        "Input template for the verification of a cryptographic checksum (the template is integrated)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DA4",
    "name": "Control reference template for authentication (AT)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DA5",
    "name": "Control reference template for authentication (AT)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DA8",
    "name":
        "Input template for the verification of a digital signature (the template is signed)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DAA",
    "name": "Template, Control reference for hash-code (HT)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DAB",
    "name": "Template, Control reference for hash-code (HT)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DAC",
    "name":
        "Input template for the computation of a digital signature (the concatenated value fields are signed)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DAD",
    "name":
        "Input template for the computation of a digital signature (the concatenated value fields are signed)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DAE",
    "name":
        "Input template for the computation of a certificate (the concatenated value fields are certified)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DAF",
    "name":
        "Input template for the computation of a certificate (the concatenated value fields are certified)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DB0",
    "name":
        "Plain value coded in BER-TLV and including secure messaging data objects",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DB1",
    "name":
        "Plain value coded in BER-TLV and including secure messaging data objects",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DB2",
    "name":
        "Plain value coded in BER-TLV, but not including secure messaging data objects",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DB3",
    "name":
        "Plain value coded in BER-TLV, but not including secure messaging data objects",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DB4",
    "name": "Control reference template for cryptographic checksum (CCT)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DB5",
    "name": "Control reference template for cryptographic checksum (CCT)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DB6",
    "name": "Control reference template for digital signature (DST)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DB7",
    "name": "Control reference template for digital signature (DST)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DB8",
    "name": "Control reference template for confidentiality (CT)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DB9",
    "name": "Control reference template for confidentiality (CT)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DBA",
    "name": "Response descriptor template",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DBB",
    "name": "Response descriptor template",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DBC",
    "name":
        "Input template for the computation of a digital signature (the template is signed)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DBD",
    "name":
        "Input template for the computation of a digital signature (the template is signed)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7DBE",
    "name":
        "Input template for the verification of a certificate (the template is certified)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7E",
    "name": "Template, Nesting Interindustry data objects",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7F20",
    "name": "Display control template",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7F21",
    "name": "Cardholder certificate",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7F2E",
    "name": "Biometric data template",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7F49",
    "name": "Template, Cardholder public key",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7F4980",
    "name":
        "Algorithm reference as used in control reference data objects for secure messaging",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7F4981",
    "name":
        "RSA Modulus (a number denoted as n coded on x bytes), or DSA First prime (a number denoted as p coded on y bytes), or ECDSA Prime (a number denoted as p coded on z bytes)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7F4982",
    "name":
        "RSA Public exponent (a number denoted as v, e.g., 65537), or DSA Second prime (a number denoted as q dividing p-1, e.g., 20 bytes), or ECDSA First coefficient (a number denoted as a coded on z bytes)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7F4983",
    "name":
        "DSA Basis (a number denoted as g of order q coded on y bytes), or ECDSA Second coefficient (a number denoted as b coded on z bytes)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7F4984",
    "name":
        "DSA Public key (a number denoted as y equal to g to the power x mod p where x is the private key coded on y bytes), or ECDSA Generator (a point denoted as PB on the curve, coded on 2z bytes)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7F4985",
    "name":
        "ECDSA Order (a prime number denoted as q, order of the generator PB, coded on z bytes)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7F4986",
    "name":
        "ECDSA Public key (a point denoted as PP on the curve, equal to x times PB where x is the private key, coded on 2z bytes)",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7F4C",
    "name": "Template, Certificate Holder Authorization",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7F4E",
    "name": "Certificate Body",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7F4E42",
    "name": "Certificate Authority Reference",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7F4E5F20",
    "name": "Certificate Holder Reference",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7F4E5F24",
    "name": "Expiration Date, Certificate",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7F4E5F25",
    "name": "Effective Date, Certificate",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7F4E5F29",
    "name": "Certificate Profile Identifier",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7F4E65",
    "name": "Certificate Extensions",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "7F60",
    "name": "Template, Biometric information",
    "description": "",
    "source": "",
    "type": ""
  },
  {
    "tag": "80",
    "name": "Response Message Template Format 1",
    "description":
        "Contains the data objects (without tags and lengths) returned by the ICC in response to a command",
    "source": "Card",
    "type": "variable"
  },
  {
    "tag": "81",
    "name": "Amount, Authorised (Binary)",
    "description":
        "Authorised amount of the transaction (excluding adjustments)",
    "source": "Terminal",
    "type": "binary"
  },
  {
    "tag": "82",
    "name": "Application Interchange Profile (AIP)",
    "description":
        "Indicates the capabilities of the card to support specific functions in the application",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "83",
    "name": "Command Template",
    "description": "Identifies the data field of a command message",
    "source": "Terminal",
    "type": "binary"
  },
  {
    "tag": "84",
    "name": "Dedicated File (DF) Name",
    "description":
        "Identifies the name of the DF as described in ISO/IEC 7816-4",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "86",
    "name": "Issuer Script Command",
    "description": "Contains a command for transmission to the ICC",
    "source": "Issuer",
    "type": "binary"
  },
  {
    "tag": "87",
    "name": "Application Priority Indicator",
    "description":
        "Indicates the priority of a given application or group of applications in a directory",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "88",
    "name": "Short File Identifier (SFI)",
    "description":
        "Identifies the AEF referenced in commands related to a given ADF or DDF. It is a binary data object having a value in the range 1 to 30 and with the three high order bits set to zero.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "89",
    "name": "Authorisation Code",
    "description":
        "Nonzero value generated by the issuer for an approved transaction.",
    "source": "Issuer",
    "type": "ans 6 (special characters limited to spaces)"
  },
  {
    "tag": "8A",
    "name": "Authorisation Response Code (ARC)",
    "description":
        "Indicates the transaction disposition of the transaction received from the issuer for online authorisations.",
    "source": "Issuer/Terminal",
    "type": "an 2"
  },
  {
    "tag": "8C",
    "name": "Card Risk Management Data Object List 1 (CDOL1)",
    "description":
        "List of data objects (tag and length) to be passed to the ICC in the first GENERATE AC command",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "8D",
    "name": "Card Risk Management Data Object List 2 (CDOL2)",
    "description":
        "List of data objects (tag and length) to be passed to the ICC in the second GENERATE AC command",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "8E",
    "name": "Cardholder Verification Method (CVM) List",
    "description":
        "Identifies a method of verification of the cardholder supported by the application",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "8F",
    "name": "Certification Authority Public Key Index (PKI)",
    "description":
        "Identifies the certification authority's public key in conjunction with the RID",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "90",
    "name": "Issuer Public Key Certificate",
    "description": "Issuer public key certified by a certification authority",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "91",
    "name": "Issuer Authentication Data",
    "description": "Data sent to the ICC for online Issuer Authentication",
    "source": "Issuer",
    "type": "binary 64-128"
  },
  {
    "tag": "92",
    "name": "Issuer Public Key Remainder",
    "description": "Remaining digits of the Issuer Public Key Modulus",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "93",
    "name": "Signed Static Application Data (SAD)",
    "description":
        "Digital signature on critical application parameters that is used in static data authentication (SDA).",
    "source": "Card",
    "type": "binary 512-1984"
  },
  {
    "tag": "94",
    "name": "Application File Locator (AFL)",
    "description":
        "Indicates the location (SFI range of records) of the Application Elementary Files associated with a particular AID, and read by the Kernel during a transaction.",
    "source": "Card",
    "type": "binary, var.; multiple of 4 between 4 and 252"
  },
  {
    "tag": "95",
    "name": "Terminal Verification Results (TVR)",
    "description":
        "Status of the different functions as seen from the terminal",
    "source": "Terminal",
    "type": ""
  },
  {
    "tag": "97",
    "name": "Transaction Certificate Data Object List (TDOL)",
    "description":
        "List of data objects (tag and length) to be used by the terminal in generating the TC Hash Value",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "98",
    "name": "Transaction Certificate (TC) Hash Value",
    "description": "Result of a hash function specified in Book 2, Annex B3.1",
    "source": "Terminal",
    "type": "binary"
  },
  {
    "tag": "99",
    "name": "Transaction Personal Identification Number (PIN) Data",
    "description":
        "Data entered by the cardholder for the purpose of the PIN verification",
    "source": "Terminal",
    "type": "binary"
  },
  {
    "tag": "9A",
    "name": "Transaction Date",
    "description": "Local date that the transaction was authorised",
    "source": "Terminal",
    "type": "n 6 (YYMMDD)"
  },
  {
    "tag": "9B",
    "name": "Transaction Status Information (TSI)",
    "description": "Indicates the functions performed in a transaction",
    "source": "Terminal",
    "type": "binary"
  },
  {
    "tag": "9C",
    "name": "Transaction Type",
    "description":
        "Indicates the type of financial transaction, represented by the first two digits of the ISO 8583:1987 Processing Code. The actual values to be used for the Transaction Type data element are defined by the relevant payment system",
    "source": "Terminal",
    "type": "n 2"
  },
  {
    "tag": "9D",
    "name": "Directory Definition File (DDF) Name",
    "description": "Identifies the name of a DF associated with a directory",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F01",
    "name": "Acquirer Identifier",
    "description":
        "Uniquely identifies the acquirer within each payment system",
    "source": "Terminal",
    "type": "n 6-11"
  },
  {
    "tag": "9F02",
    "name": "Amount, Authorised (Numeric)",
    "description":
        "Authorised amount of the transaction (excluding adjustments)",
    "source": "Terminal",
    "type": "n 12"
  },
  {
    "tag": "9F03",
    "name": "Amount, Other (Numeric)",
    "description":
        "Secondary amount associated with the transaction representing a cashback amount",
    "source": "Terminal",
    "type": "n 12"
  },
  {
    "tag": "9F04",
    "name": "Amount, Other (Binary)",
    "description":
        "Secondary amount associated with the transaction representing a cashback amount",
    "source": "Terminal",
    "type": "binary"
  },
  {
    "tag": "9F05",
    "name": "Application Discretionary Data",
    "description":
        "Issuer or payment system specified data relating to the application",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F06",
    "name": "Application Identifier (AID), Terminal",
    "description": "Identifies the application as described in ISO/IEC 7816-5",
    "source": "Terminal",
    "type": "binary"
  },
  {
    "tag": "9F07",
    "name": "Application Usage Control (AUC)",
    "description":
        "Indicates issuer's specified restrictions on the geographic usage and services allowed for the application",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F08",
    "name": "Application Version Number",
    "description":
        "Version number assigned by the payment system for the application in the Card",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F09",
    "name": "Application Version Number",
    "description":
        "Version number assigned by the payment system for the Kernel application",
    "source": "Terminal",
    "type": "binary"
  },
  {
    "tag": "9F0B",
    "name": "Cardholder Name - Extended",
    "description":
        "Indicates the whole cardholder name when greater than 26 characters using the same coding convention as in ISO 7813",
    "source": "Card",
    "type": "ans 27-45"
  },
  {
    "tag": "9F0D",
    "name": "Issuer Action Code - Default",
    "description":
        "Specifies the issuer's conditions that cause a transaction to be rejected if it might have been approved online, but the terminal is unable to process the transaction online",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F0E",
    "name": "Issuer Action Code - Denial",
    "description":
        "Specifies the issuer's conditions that cause the denial of a transaction without attempt to go online",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F0F",
    "name": "Issuer Action Code - Online",
    "description":
        "Specifies the issuer's conditions that cause a transaction to be transmitted online",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F10",
    "name": "Issuer Application Data (IAD)",
    "description":
        "Contains proprietary application data for transmission to the issuer in an online transaction. Note: For CCD-compliant applications, Annex C, section C7 defines the specific coding of the Issuer Application Data (IAD). To avoid potential conflicts with CCD-compliant applications, it is strongly recommended that the IAD data element in an application that is not CCD-compliant should not use the coding for a CCD-compliant application.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F11",
    "name": "Issuer Code Table Index",
    "description":
        "Indicates the code table according to ISO/IEC 8859 for displaying the Application Preferred Name",
    "source": "Card",
    "type": "n 2"
  },
  {
    "tag": "9F12",
    "name": "Application Preferred Name",
    "description": "Preferred mnemonic associated with the AID",
    "source": "Card",
    "type": "ans"
  },
  {
    "tag": "9F13",
    "name": "Last Online Application Transaction Counter (ATC) Register",
    "description": "ATC value of the last transaction that went online",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F14",
    "name": "Lower Consecutive Offline Limit (LCOL)",
    "description":
        "Issuer-specified preference for the maximum number of consecutive offline transactions for this ICC application allowed in a terminal with online capability",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F15",
    "name": "Merchant Category Code (MCC)",
    "description":
        "Classifies the type of business being done by the merchant, represented according to ISO 8583:1993 for Card Acceptor Business Code",
    "source": "Terminal",
    "type": "n 4"
  },
  {
    "tag": "9F16",
    "name": "Merchant Identifier",
    "description":
        "When concatenated with the Acquirer Identifier, uniquely identifies a given merchant",
    "source": "Terminal",
    "type": "ans 15"
  },
  {
    "tag": "9F17",
    "name": "Personal Identification Number (PIN) Try Counter",
    "description": "Number of PIN tries remaining",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F18",
    "name": "Issuer Script Identifier",
    "description":
        "May be sent in authorisation response from issuer when response contains Issuer Script. Assigned by the issuer to uniquely identify the Issuer Script.",
    "source": "Issuer",
    "type": "binary 32"
  },
  {
    "tag": "9F19",
    "name": "Deleted (see 9F49)",
    "description": "",
    "source": "",
    "type": "H"
  },
  {
    "tag": "9F1A",
    "name": "Terminal Country Code",
    "description":
        "Indicates the country of the terminal, represented according to ISO 3166",
    "source": "Terminal",
    "type": "n 3"
  },
  {
    "tag": "9F1B",
    "name": "Terminal Floor Limit",
    "description":
        "Indicates the floor limit in the terminal in conjunction with the AID",
    "source": "Terminal",
    "type": "binary 32"
  },
  {
    "tag": "9F1C",
    "name": "Terminal Identification",
    "description": "Designates the unique location of a Terminal at a merchant",
    "source": "Terminal",
    "type": "an 8"
  },
  {
    "tag": "9F1D",
    "name": "Terminal Risk Management Data",
    "description":
        "Application-specific value used by the card for risk management purposes",
    "source": "Terminal",
    "type": "binary"
  },
  {
    "tag": "9F1E",
    "name": "Interface Device (IFD) Serial Number",
    "description":
        "Unique and permanent serial number assigned to the IFD by the manufacturer",
    "source": "Terminal",
    "type": "an 8"
  },
  {
    "tag": "9F1F",
    "name": "Track 1 Discretionary Data",
    "description": "Discretionary part of track 1 according to ISO/IEC 7813",
    "source": "Card",
    "type": "ans"
  },
  {
    "tag": "9F20",
    "name": "Track 2 Discretionary Data",
    "description": "Discretionary part of track 2 according to ISO/IEC 7813",
    "source": "Card",
    "type": "cn"
  },
  {
    "tag": "9F21",
    "name": "Transaction Time",
    "description": "Local time at which the transaction was performed.",
    "source": "Terminal",
    "type": "n 6 (HHMMSS)"
  },
  {
    "tag": "9F22",
    "name": "Certification Authority Public Key Index (PKI)",
    "description":
        "Identifies the Certificate Authority's public key in conjunction with the RID for use in offline static and dynamic data authentication.",
    "source": "Terminal",
    "type": "binary 8"
  },
  {
    "tag": "9F23",
    "name": "Upper Consecutive Offline Limit (UCOL)",
    "description":
        "Issuer-specified preference for the maximum number of consecutive offline transactions for this ICC application allowed in a terminal without online capability",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F24",
    "name":
        "Payment Account Reference (PAR) generated or linked directly to the provision request in the token vault",
    "description":
        "Payment Account Reference: EMV contact and contactless chip specifications products may support PAR by assigning a unique EMV tag (9F24) to represent PAR. PAR SHALL be required personalisation data for payment tokens but will be optional for terminals to read and transmit.",
    "source": "Card",
    "type": "ans 24"
  },
  {
    "tag": "9F26",
    "name": "Application Cryptogram (AC)",
    "description":
        "Cryptogram returned by the ICC in response of the GENERATE AC or RECOVER AC command",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F27",
    "name": "Cryptogram Information Data (CID)",
    "description":
        "Indicates the type of cryptogram and the actions to be performed by the terminal",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F29",
    "name": "Extended Selection",
    "description":
        "The value to be appended to the ADF Name in the data field of the SELECT command, if the Extended Selection Support flag is present and set to 1. Content is payment system proprietary.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F2A",
    "name": "Kernel Identifier",
    "description":
        "Indicates the card's preference for the kernel on which the contactless application can be processed.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F2D",
    "name":
        "Integrated Circuit Card (ICC) PIN Encipherment Public Key Certificate",
    "description": "ICC PIN Encipherment Public Key certified by the issuer",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F2E",
    "name":
        "Integrated Circuit Card (ICC) PIN Encipherment Public Key Exponent",
    "description":
        "ICC PIN Encipherment Public Key Exponent used for PIN encipherment",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F2F",
    "name":
        "Integrated Circuit Card (ICC) PIN Encipherment Public Key Remainder",
    "description":
        "Remaining digits of the ICC PIN Encipherment Public Key Modulus",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F32",
    "name": "Issuer Public Key Exponent",
    "description":
        "Issuer public key exponent used for the verification of the Signed Static Application Data and the ICC Public Key Certificate",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F33",
    "name": "Terminal Capabilities",
    "description":
        "Indicates the card data input, CVM, and security capabilities of the Terminal and Reader. The CVM capability (Byte 2) is instantiated with values depending on the transaction amount. The Terminal Capabilities is coded according to Annex A.2 of [EMV Book 4].",
    "source": "Terminal",
    "type": "binary"
  },
  {
    "tag": "9F34",
    "name": "Cardholder Verification Method (CVM) Results",
    "description": "Indicates the results of the last CVM performed",
    "source": "Terminal",
    "type": "binary"
  },
  {
    "tag": "9F35",
    "name": "Terminal Type",
    "description":
        "Indicates the environment of the terminal, its communications capability, and its operational control",
    "source": "Terminal",
    "type": "n 2"
  },
  {
    "tag": "9F36",
    "name": "Application Transaction Counter (ATC)",
    "description":
        "Counter maintained by the application in the ICC (incrementing the ATC is managed by the ICC)",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F37",
    "name": "Unpredictable Number (UN)",
    "description":
        "Value to provide variability and uniqueness to the generation of a cryptogram",
    "source": "Terminal",
    "type": "binary"
  },
  {
    "tag": "9F38",
    "name": "Processing Options Data Object List (PDOL)",
    "description":
        "Contains a list of terminal resident data objects (tags and lengths) needed by the ICC in processing the GET PROCESSING OPTIONS command",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F39",
    "name": "Point-of-Service (POS) Entry Mode",
    "description":
        "Indicates the method by which the PAN was entered, according to the first two digits of the ISO 8583:1987 POS Entry Mode",
    "source": "Terminal",
    "type": "n 2"
  },
  {
    "tag": "9F3A",
    "name": "Amount, Reference Currency (Binary)",
    "description": "Authorised amount expressed in the reference currency",
    "source": "Terminal",
    "type": "binary"
  },
  {
    "tag": "9F3B",
    "name": "Currency Code, Application Reference",
    "description":
        "1-4 currency codes used between the terminal and the ICC when the Transaction Currency Code is different from the Application Currency Code; each code is 3 digits according to ISO 4217",
    "source": "Card",
    "type": "n 3"
  },
  {
    "tag": "9F3C",
    "name": "Currency Code, Transaction Reference",
    "description":
        "Code defining the common currency used by the terminal in case the Transaction Currency Code is different from the Application Currency Code",
    "source": "Terminal",
    "type": "n 3"
  },
  {
    "tag": "9F3D",
    "name": "Currency Exponent, Transaction Reference",
    "description":
        "Indicates the implied position of the decimal point from the right of the transaction amount, with the Transaction Reference Currency Code represented according to ISO 4217",
    "source": "Terminal",
    "type": "n 1"
  },
  {
    "tag": "9F40",
    "name": "Additional Terminal Capabilities (ATC)",
    "description":
        "Indicates the data input and output capabilities of the Terminal and Reader. The Additional Terminal Capabilities is coded according to Annex A.3 of [EMV Book 4].",
    "source": "Terminal",
    "type": "binary"
  },
  {
    "tag": "9F41",
    "name": "Transaction Sequence Counter",
    "description":
        "Counter maintained by the terminal that is incremented by one for each transaction",
    "source": "Terminal",
    "type": "n 4-8"
  },
  {
    "tag": "9F42",
    "name": "Currency Code, Application",
    "description":
        "Indicates the currency in which the account is managed according to ISO 4217",
    "source": "Card",
    "type": "n 3"
  },
  {
    "tag": "9F43",
    "name": "Currency Exponent, Application Reference",
    "description":
        "Indicates the implied position of the decimal point from the right of the amount, for each of the 1-4 reference currencies represented according to ISO 4217",
    "source": "Card",
    "type": "n 1"
  },
  {
    "tag": "9F44",
    "name": "Currency Exponent, Application",
    "description":
        "Indicates the implied position of the decimal point from the right of the amount represented according to ISO 4217",
    "source": "Card",
    "type": "n 1"
  },
  {
    "tag": "9F45",
    "name": "Data Authentication Code",
    "description":
        "An issuer assigned value that is retained by the terminal during the verification process of the Signed Static Application Data",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F46",
    "name": "Integrated Circuit Card (ICC) Public Key Certificate",
    "description": "ICC Public Key certified by the issuer",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F47",
    "name": "Integrated Circuit Card (ICC) Public Key Exponent",
    "description":
        "Exponent ICC Public Key Exponent used for the verification of the Signed Dynamic Application Data",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F48",
    "name": "Integrated Circuit Card (ICC) Public Key Remainder",
    "description": "Remaining digits of the ICC Public Key Modulus",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F49",
    "name": "Dynamic Data Authentication Data Object List (DDOL)",
    "description":
        "List of data objects (tag and length) to be passed to the ICC in the INTERNAL AUTHENTICATE command",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F4A",
    "name": "Static Data Authentication Tag List (SDA)",
    "description":
        "List of tags of primitive data objects defined in this specification whose value fields are to be included in the Signed Static or Dynamic Application Data",
    "source": "Card",
    "type": "-"
  },
  {
    "tag": "9F4B",
    "name": "Signed Dynamic Application Data (SDAD)",
    "description":
        "Digital signature on critical application parameters for CDA",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F4C",
    "name": "ICC Dynamic Number",
    "description":
        "Time-variant number generated by the ICC, to be captured by the terminal",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F4D",
    "name": "Log Entry",
    "description":
        "Provides the SFI of the Transaction Log file and its number of records",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F4E",
    "name": "Merchant Name and Location",
    "description": "Indicates the name and location of the merchant",
    "source": "Terminal",
    "type": "ans"
  },
  {
    "tag": "9F4F",
    "name": "Log Format",
    "description":
        "List (in tag and length format) of data objects representing the logged data elements that are passed to the terminal when a transaction log record is read",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F50",
    "name": "Offline Accumulator Balance",
    "description":
        "Represents the amount of offline spending available in the Card. The Offline Accumulator Balance is retrievable by the GET DATA command, if allowed by the Card configuration.",
    "source": "",
    "type": "n 12"
  },
  {
    "tag": "9F51",
    "name": "Application Currency Code",
    "description": "",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F52",
    "name": "Application Default Action (ADA)",
    "description": "",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F53",
    "name": "Consecutive Transaction Counter International Limit (CTCIL)",
    "description": "",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F54",
    "name": "Cumulative Total Transaction Amount Limit (CTTAL)",
    "description": "",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F55",
    "name": "Geographic Indicator",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "9F56",
    "name": "Issuer Authentication Indicator",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "9F57",
    "name": "Issuer Country Code",
    "description": "",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F58",
    "name": "Consecutive Transaction Counter Limit (CTCL)",
    "description": "",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F59",
    "name": "Consecutive Transaction Counter Upper Limit (CTCUL)",
    "description": "",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F5A",
    "name": "Application Program Identifier (Program ID)",
    "description":
        "Payment system proprietary data element identifying the Application Program ID of the card application. When personalised, the Application Program ID is returned in the FCI Issuer Discretionary Data of the SELECT response (Tag \u2018BF0C'). EMV mode readers that support Dynamic Reader Limits (DRL) functionality examine the Application Program ID to determine the Reader Limit Set to apply.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F5B",
    "name": "Issuer Script Results",
    "description":
        "Indicates the results of Issuer Script processing. When the reader/terminal transmits this data element to the acquirer, in this version of Kernel 3, it is acceptable that only byte 1 is transmitted, although it is preferable for all five bytes to be transmitted.",
    "source": "Terminal",
    "type": "binary"
  },
  {
    "tag": "9F5C",
    "name": "Cumulative Total Transaction Amount Upper Limit (CTTAUL)",
    "description":
        "Visa proprietary data element specifying the maximum total amount of offline transactions in the designated currency or designated and secondary currency allowed for the card application before a transaction is declined after an online transaction is unable to be performed.",
    "source": "Card",
    "type": "n 12"
  },
  {
    "tag": "9F5D",
    "name": "Available Offline Spending Amount (AOSA)",
    "description":
        "Kernel 3 proprietary data element indicating the remaining amount available to be spent offline. The AOSA is a calculated field used to allow the reader to print or display the amount of offline spend that is available on the card.",
    "source": "Card",
    "type": "n 12"
  },
  {
    "tag": "9F5E",
    "name": "Consecutive Transaction International Upper Limit (CTIUL)",
    "description": "",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F5F",
    "name": "DS Slot Availability",
    "description":
        "Contains the Card indication, obtained in the response to the GET PROCESSING OPTIONS command, about the slot type(s) available for data storage.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F60",
    "name": "CVC3 (Track1)",
    "description":
        "The CVC3 (Track1) is a 2-byte cryptogram returned by the Card in the response to the COMPUTE CRYPTOGRAPHIC CHECKSUM command.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F61",
    "name": "CVC3 (Track2)",
    "description":
        "The CVC3 (Track2) is a 2-byte cryptogram returned by the Card in the response to the COMPUTE CRYPTOGRAPHIC CHECKSUM command.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F62",
    "name": "PCVC3 (Track1)",
    "description":
        "PCVC3(Track1) indicates to the Kernel the positions in the discretionary data field of the Track 1 Data where the CVC3 (Track1) digits must be copied.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "9F63",
    "name": "Offline Counter Initial Value",
    "description": "",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F64",
    "name": "NATC (Track1)",
    "description":
        "The value of NATC(Track1) represents the number of digits of the Application Transaction Counter to be included in the discretionary data field of Track 1 Data.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F65",
    "name": "PCVC3 (Track2)",
    "description":
        "PCVC3(Track2) indicates to the Kernel the positions in the discretionary data field of the Track 2 Data where the CVC3 (Track2) digits must be copied.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "9F66",
    "name": "Terminal Transaction Qualifiers (TTQ)",
    "description":
        "Indicates reader capabilities, requirements, and preferences to the card. TTQ byte 2 bits 8-7 are transient values, and reset to zero at the beginning of the transaction. All other TTQ bits are static values, and not modified based on transaction conditions. TTQ byte 3 bit 7 shall be set by the acquirer-merchant to 1b.",
    "source": "Terminal",
    "type": "binary 32"
  },
  {
    "tag": "9F67",
    "name": "MSD Offset",
    "description": "",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F68",
    "name": "Card Additional Processes",
    "description": "",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F69",
    "name": "Card Authentication Related Data",
    "description":
        "Contains the fDDA Version Number, Card Unpredictable Number, and Card Transaction Qualifiers. For transactions where fDDA is performed, the Card Authentication Related Data is returned in the last record specified by the Application File Locator for that transaction.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F6A",
    "name": "Unpredictable Number (Numeric)",
    "description":
        "Unpredictable number generated by the Kernel during a mag-stripe mode transaction. The Unpredictable Number (Numeric) is passed to the Card in the data field of the COMPUTE CRYPTOGRAPHIC CHECKSUM command. The 8-nUN most significant digits must be set to zero.",
    "source": "Card",
    "type": "n 8"
  },
  {
    "tag": "9F6B",
    "name": "Card CVM Limit",
    "description": "",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F6C",
    "name": "Card Transaction Qualifiers (CTQ)",
    "description":
        "In this version of the specification, used to indicate to the device the card CVM requirements, issuer preferences, and card capabilities.",
    "source": "Card",
    "type": "binary 16"
  },
  {
    "tag": "9F6D",
    "name": "VLP Reset Threshold",
    "description": "",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F6E",
    "name": "Third Party Data",
    "description":
        "The Third Party Data contains various information, possibly including information from a third party. If present in the Card, the Third Party Data must be returned in a file read using the READ RECORD command or in the File Control Information Template. 'Device Type' is present when the most significant bit of byte 1 of 'Unique Identifier' is set to 0b. In this case, the maximum length of 'Proprietary Data' is 26 bytes. Otherwise it is 28 bytes.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F6F",
    "name": "DS Slot Management Control",
    "description":
        "Contains the Card indication, obtained in the response to the GET PROCESSING OPTIONS command, about the status of the slot containing data associated to the DS Requested Operator ID.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F70",
    "name": "Protected Data Envelope 1",
    "description":
        "The Protected Data Envelopes contain proprietary information from the issuer, payment system or third party. The Protected Data Envelope can be retrieved with the GET DATA command. Updating the Protected Data Envelope with the PUT DATA command requires secure messaging and is outside the scope of this specification.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "9F71",
    "name": "Protected Data Envelope 2",
    "description": "Same as Protected Data Envelope 1.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "9F72",
    "name": "Protected Data Envelope 3",
    "description": "Same as Protected Data Envelope 1.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "9F73",
    "name": "Protected Data Envelope 4",
    "description": "Same as Protected Data Envelope 1.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "9F74",
    "name": "Protected Data Envelope 5",
    "description": "Same as Protected Data Envelope 1.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "9F75",
    "name": "Unprotected Data Envelope 1",
    "description":
        "The Unprotected Data Envelopes contain proprietary information from the issuer, payment system or third party. Unprotected Data Envelopes can be retrieved with the GET DATA command and can be updated with the PUT DATA (CLA='80') command without secure messaging.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F76",
    "name": "Unprotected Data Envelope 2",
    "description": "Same as Unprotected Data Envelope 1.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F77",
    "name": "Unprotected Data Envelope 3",
    "description": "Same as Unprotected Data Envelope 1.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F78",
    "name": "Unprotected Data Envelope 4",
    "description": "Same as Unprotected Data Envelope 1.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F79",
    "name": "Unprotected Data Envelope 5",
    "description": "Same as Unprotected Data Envelope 1.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F7A",
    "name": "VLP Terminal Support Indicator",
    "description":
        "If present indicates offline and/or online support. If absent indicates online only support",
    "source": "Terminal",
    "type": "n 1"
  },
  {
    "tag": "9F7B",
    "name": "VLP Terminal Transaction Limit",
    "description": "",
    "source": "Terminal",
    "type": "H"
  },
  {
    "tag": "9F7C",
    "name": "Customer Exclusive Data (CED)",
    "description": "Contains data for transmission to the issuer.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F7D",
    "name": "DS Summary 1",
    "description":
        "Contains the Card indication, obtained in the response to the GET PROCESSING OPTIONS command, about either the stored summary associated with DS ODS Card if present, or about a default zero-filled summary if DS ODS Card is not present and DS Unpredictable Number is present.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F7E",
    "name": "Mobile Support Indicator",
    "description":
        "The Mobile Support Indicator informs the Card that the Kernel supports extensions for mobile and requires on device cardholder verification.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "9F7F",
    "name": "DS Unpredictable Number",
    "description":
        "Contains the Card challenge (random), obtained in the response to the GET PROCESSING OPTIONS command, to be used by the Terminal in the summary calculation when providing DS ODS Term.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "A5",
    "name": "File Control Information (FCI) Proprietary Template",
    "description":
        "Identifies the data object proprietary to this specification in the FCI template according to ISO/IEC 7816-4",
    "source": "Card",
    "type": "variable"
  },
  {
    "tag": "BF0C",
    "name": "File Control Information (FCI) Issuer Discretionary Data",
    "description":
        "Issuer discretionary part of the File Control Information Proprietary Template.",
    "source": "Card",
    "type": "variable"
  },
  {
    "tag": "BF50",
    "name": "Visa Fleet - CDO",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "BF60",
    "name": "Integrated Data Storage Record Update Template",
    "description":
        "Part of the command data for the EXTENDED GET PROCESSING OPTIONS command. The IDS Record Update Template contains data to be updated in one or more IDS Records.",
    "source": "Data Exchange",
    "type": "binary"
  },
  {
    "tag": "C3",
    "name": "Card issuer action code -decline",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "C4",
    "name": "Card issuer action code -default",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "C5",
    "name": "Card issuer action code online",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "C6",
    "name": "PIN Try Limit",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "C7",
    "name": "CDOL 1 Related Data Length",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "C8",
    "name": "Card risk management country code",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "C9",
    "name": "Card risk management currency code",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "CA",
    "name": "Lower cummulative offline transaction amount",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "CB",
    "name": "Upper cumulative offline transaction amount",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "CD",
    "name": "Card Issuer Action Code (PayPass) - Default",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "CE",
    "name": "Card Issuer Action Code (PayPass) - Online",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "CF",
    "name": "Card Issuer Action Code (PayPass) - Decline",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "D1",
    "name": "Currency conversion table",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "D2",
    "name": "Integrated Data Storage Directory (IDSD)",
    "description": "Directory of Integrated Data Storage records on the card.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "D3",
    "name": "Additional check table",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "D5",
    "name": "Application Control",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "D6",
    "name": "Default ARPC response code",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "D7",
    "name": "Application Control (PayPass)",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "D8",
    "name": "AIP (PayPass)",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "D9",
    "name": "AFL (PayPass)",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DA",
    "name": "Static CVC3-TRACK1",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DB",
    "name": "Static CVC3-TRACK2",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DC",
    "name": "IVCVC3-TRACK1",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DD",
    "name": "IVCVC3-TRACK2",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF01",
    "name": "Encrypted PIN Block in Tag 9F62 - ISO 95641 Format 0",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF02",
    "name": "PEK Version Number",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF03",
    "name": "PIN Try Limit",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF04",
    "name": "PIN Try Counter (VSDC Application)",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF05",
    "name": "AIP - For VISA Contactless",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF06",
    "name": "Products permitted",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF07",
    "name": "Offline checks mandated",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF08",
    "name": "UDKmac",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF09",
    "name": "UDKenc",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF0B",
    "name": "Retries Permitted Limit",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF0C",
    "name": "Script Message Update",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF0D",
    "name": "Fleet Issuer Action Code - Default",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF0E",
    "name": "Fleet Issuer Action Code - Denial",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF0F",
    "name": "Fleet Issuer Action Code - Online",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF12",
    "name": "Vehicle Registration Number",
    "description": "",
    "source": "Card",
    "type": "A"
  },
  {
    "tag": "DF13",
    "name": "DDA Public Modulus",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF14",
    "name": "Driver Name",
    "description": "",
    "source": "Card",
    "type": "A"
  },
  {
    "tag": "DF15",
    "name": "Driver ID",
    "description": "",
    "source": "Card",
    "type": "A"
  },
  {
    "tag": "DF16",
    "name": "Max Fill Volume",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF17",
    "name": "DDA Public Modulus Length",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF18",
    "name": "Mileage",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF20",
    "name": "Issuer Proprietary Bitmap (IPB)",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF21",
    "name": "Internet Authentication Flag (IAF)",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF22",
    "name": "Encrypted PEK - RFU",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF23",
    "name": "PEK Key Check Value - RFU",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF24",
    "name": "MDK - Key derivation Index",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF25",
    "name": "VISA DPA - MDK - Key derivation Index",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF26",
    "name":
        "Encrypted PIN Block - ISO 9564-1 Format 1 PIN Block (Thales P3 Format 05)",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF40",
    "name": "qVSDC AIP",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF41",
    "name": "VSDC AIP",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF42",
    "name": "UDKac",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF43",
    "name": "UDKmac",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF44",
    "name": "UDKenc",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF47",
    "name": "UDKcvc",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF48",
    "name": "UDKac KCV",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF49",
    "name": "UDKmac KCV",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF4A",
    "name": "UDKenc KCV",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF4B",
    "name": "UDKcvc KCV",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF51",
    "name": "Grand Parent AC",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF52",
    "name": "Parent AC",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF53",
    "name": "Grand Parent MAC",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF54",
    "name": "Parent MAC",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF55",
    "name": "Grand Parent ENC",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF56",
    "name": "Parent ENC/Terminal Action Code - Default",
    "description": "",
    "source": "Card/Terminal",
    "type": "H"
  },
  {
    "tag": "DF57",
    "name": "Terminal Action Code - Decline",
    "description": "",
    "source": "Terminal",
    "type": "H"
  },
  {
    "tag": "DF60",
    "name": "DS Input (Card)",
    "description":
        "Contains Terminal provided data if permanent data storage in the Card was applicable (DS Slot Management Control[8]=1b), remains applicable, or becomes applicable (DS ODS Info[8]=1b). Otherwise this data item is a filler to be supplied by the Kernel. The data is forwarded to the Card with the GENERATE AC command, as per DSDOL formatting.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "DF61",
    "name": "DDA Component Q",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF62",
    "name": "DS ODS Info",
    "description":
        "Contains Terminal provided data to be forwarded to the Card with the GENERATE AC command, as per DSDOL formatting.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "DF63",
    "name": "DDA Component D2",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF64",
    "name": "DDA Component Q Minus 1 Mod P",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF65",
    "name": "DDA Private Exponent",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF6B",
    "name": "Paypass Contactless",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF79",
    "name": "Dynamic Data Authentication Keys",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "DF8101",
    "name": "DS Summary 2",
    "description":
        "This data allows the Kernel to check the consistency between DS Summary 1 and DS Summary 2, and so to ensure that DS ODS Card is provided by a genuine Card. It is located in the ICC Dynamic Data recovered from the Signed Dynamic Application Data.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "DF8102",
    "name": "DS Summary 3",
    "description":
        "This data allows the Kernel to check whether the Card has seen the same transaction data as were sent by the Terminal/Kernel. It is located in the ICC Dynamic Data recovered from the Signed Dynamic Application Data.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "DF8104",
    "name": "Balance Read Before Gen AC",
    "description":
        "The presence of Balance Read Before Gen AC in the TLV Database is an indication to the Kernel to read the offline balance from the Card before the GENERATE AC command. The Kernel stores the offline balance read from the Card in Balance Read Before Gen AC.",
    "source": "",
    "type": "n 12"
  },
  {
    "tag": "DF8105",
    "name": "Balance Read After Gen AC",
    "description":
        "The presence of Balance Read After Gen AC in the TLV Database is an indication to the Kernel to read the offline balance from the Card after the GENERATE AC command. The Kernel stores the offline balance read from the Card in Balance Read After Gen AC.",
    "source": "",
    "type": "n 12"
  },
  {
    "tag": "DF8106",
    "name": "Data Needed",
    "description":
        "List of tags included in the DEK signal to request information from the Terminal.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "DF8107",
    "name": "CDOL1 Related Data",
    "description":
        "Command data field of the GENERATE AC command, coded according to CDOL1.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "DF8108",
    "name": "DS AC Type",
    "description":
        "Contains the AC type indicated by the Terminal for which IDS data must be stored in the Card.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "DF8109",
    "name": "DS Input (Term)",
    "description":
        "Contains Terminal provided data if permanent data storage in the Card was applicable (DS Slot Management Control[8]=1b), remains applicable or becomes applicable (DS ODS Info[8]=1b). DS Input (Term) is used by the Kernel as input to calculate DS Digest H.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "DF810A",
    "name": "DS ODS Info For Reader",
    "description":
        "Contains instructions from the Terminal on how to proceed with the transaction if: - The AC requested by the Terminal does not match the AC proposed by the Kernel - The update of the slot data has failed",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "DF810B",
    "name": "DS Summary Status",
    "description":
        "Information reported by the Kernel to the Terminal about: - The consistency between DS Summary 1 and DS Summary 2 (successful read) - The difference between DS Summary 2 and DS Summary 3 (successful write) This data object is part of the Discretionary Data.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "DF810C",
    "name": "Kernel ID",
    "description":
        "Contains a value that uniquely identifies each Kernel. There is one occurrence of this data object for each Kernel in the Reader.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "DF810D",
    "name": "DSVN Term",
    "description":
        "Integrated data storage support by the Kernel depends on the presence of this data object. If it is absent, or is present with a length of zero, integrated data storage is not supported. Its value is '02' for this version of data storage functionality. This variable length data item has an initial byte that defines the maximum version number supported by the Terminal and a variable number of subsequent bytes that define how the Terminal supports earlier versions of the specification. As this is the first version, no legacy support is described and no additional bytes are present.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "DF810E",
    "name": "Post-Gen AC Put Data Status",
    "description":
        "Information reported by the Kernel to the Terminal, about the processing of PUT DATA commands after processing the GENERATE AC command. Possible values are 'completed' or 'not completed'. In the latter case, this status is not specific about which of the PUT DATA commands failed, or about how many of these commands have failed or succeeded. This data object is part of the Discretionary Data provided by the Kernel to the Terminal.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "DF810F",
    "name": "Pre-Gen AC Put Data Status",
    "description":
        "Information reported by the Kernel to the Terminal, about the processing of PUT DATA commands before sending the GENERATE AC command. Possible values are 'completed' or 'not completed'. In the latter case, this status is not specific about which of the PUT DATA commands failed, or about how many of these commands have failed or succeeded. This data object is part of the Discretionary Data provided by the Kernel to the Terminal.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "DF8110",
    "name": "Proceed To First Write Flag",
    "description":
        "Indicates that the Terminal will send no more requests to read data other than as indicated in Tags To Read. This data item indicates the point at which the Kernel shifts from the Card reading phase to the Card writing phase. If Proceed To First Write Flag is not present or is present with non zero length and value different from zero, then the Kernel proceeds without waiting. If Proceed To First Write Flag is present with zero length, then the Kernel sends a DEK signal to the Terminal and waits for the DET signal. If Proceed To First Write Flag is present with non zero length and value equal to zero, then the Kernel waits for a DET signal from the Terminal without sending a DEK signal.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "DF8111",
    "name": "PDOL Related Data",
    "description":
        "Command data field of the GET PROCESSING OPTIONS command, coded according to PDOL.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "DF8112",
    "name": "Tags To Read",
    "description":
        "List of tags indicating the data the Terminal has requested to be read. This data item is present if the Terminal wants any data back from the Card before the Data Record. This could be in the context of SDS, or for non data storage usage reasons, for example the PAN. This data item may contain configured data. This data object may be provided several times by the Terminal. Therefore, the values of each of these tags must be accumulated in the Tags To Read Yet buffer.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "DF8113",
    "name": "DRDOL Related Data",
    "description":
        "Command data field of the RECOVER AC command, coded according to DRDOL.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "DF8114",
    "name": "Reference Control Parameter",
    "description":
        "Working variable to store the reference control parameter of the GENERATE AC command.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "DF8115",
    "name": "Error Indication",
    "description":
        "Contains information regarding the nature of the error that has been encountered during the transaction processing. This data object is part of the Discretionary Data.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "DF8116",
    "name": "User Interface Request Data",
    "description": "Combines all parameters to be sent with the MSG signal.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "DF8117",
    "name": "Card Data Input Capability",
    "description":
        "Indicates the card data input capability of the Terminal and Reader. The Card Data Input Capability is coded according to Annex A.2 of [EMV Book 4].",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "DF8118",
    "name": "CVM Capability - CVM Required",
    "description":
        "Indicates the CVM capability of the Terminal and Reader when the transaction amount is greater than the Reader CVM Required Limit. The CVM Capability - CVM Required is coded according to Annex A.2 of [EMV Book 4].",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "DF8119",
    "name": "CVM Capability - No CVM Required",
    "description":
        "Indicates the CVM capability of the Terminal and Reader when the transaction amount is less than or equal to the Reader CVM Required Limit. The CVM Capability - No CVM Required is coded according to Annex A.2 of [EMV Book 4].",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "DF811A",
    "name": "Default UDOL",
    "description":
        "The Default UDOL is the UDOL to be used for constructing the value field of the COMPUTE CRYPTOGRAPHIC CHECKSUM command if the UDOL in the Card is not present. The Default UDOL must contain as its only entry the tag and length of the Unpredictable Number (Numeric) and has the value: '9F6A04'.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "DF811B",
    "name": "Kernel Configuration",
    "description": "Indicates the Kernel configuration options.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "DF811C",
    "name": "Max Lifetime of Torn Transaction Log Record",
    "description":
        "Maximum time, in seconds, that a record can remain in the Torn Transaction Log.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "DF811D",
    "name": "Max Number of Torn Transaction Log Records",
    "description":
        "Indicates the maximum number of records that can be stored in the Torn Transaction Log.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "DF811E",
    "name": "Mag-stripe CVM Capability - CVM Required",
    "description":
        "Indicates the CVM capability of the Terminal/Reader in the case of a mag-stripe mode transaction when the Amount, Authorized (Numeric) is greater than the Reader CVM Required Limit.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "DF811F",
    "name": "Security Capability",
    "description":
        "Indicates the security capability of the Kernel. The Security Capability is coded according to Annex A.2 of [EMV Book 4].",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "DF8120",
    "name": "Terminal Action Code - Default",
    "description":
        "Specifies the acquirer's conditions that cause a transaction to be rejected on an offline only Terminal.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "DF8121",
    "name": "Terminal Action Code - Denial",
    "description":
        "Specifies the acquirer's conditions that cause the denial of a transaction without attempting to go online.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "DF8122",
    "name": "Terminal Action Code - Online",
    "description":
        "Specifies the acquirer's conditions that cause a transaction to be transmitted online on an online capable Terminal.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "DF8123",
    "name": "Reader Contactless Floor Limit",
    "description":
        "Indicates the transaction amount above which transactions must be authorized online.",
    "source": "",
    "type": "n 12"
  },
  {
    "tag": "DF8124",
    "name": "Reader Contactless Transaction Limit (No On-device CVM)",
    "description":
        "Indicates the transaction amount above which the transaction is not allowed, when on device cardholder verification is not supported.",
    "source": "",
    "type": "n 12"
  },
  {
    "tag": "DF8125",
    "name": "Reader Contactless Transaction Limit (On-device CVM)",
    "description":
        "Indicates the transaction amount above which the transaction is not allowed, when on device cardholder verification is supported.",
    "source": "",
    "type": "n 12"
  },
  {
    "tag": "DF8126",
    "name": "Reader CVM Required Limit",
    "description":
        "Indicates the transaction amount above which the Kernel instantiates the CVM capabilities field in Terminal Capabilities with CVM Capability - CVM Required.",
    "source": "",
    "type": "n 12"
  },
  {
    "tag": "DF8127",
    "name": "Time Out Value",
    "description":
        "Defines the time in ms before the timer generates a TIMEOUT signal.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "DF8128",
    "name": "IDS Status",
    "description":
        "Indicates if the transaction performs an IDS read and/or write.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "DF8129",
    "name": "Outcome Parameter Set",
    "description":
        "This data object is used to indicate to the Terminal the outcome of the transaction processing by the Kernel. Its value is an accumulation of results about applicable parts of the transaction.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "DF812A",
    "name": "DD Card (Track1)",
    "description":
        "If Track 1 Data is present, then DD Card (Track1) contains a copy of the discretionary data field of Track 1 Data as returned by the Card in the file read using the READ RECORD command during a mag-stripe mode transaction (i.e. without Unpredictable Number (Numeric), Application Transaction Counter, CVC3 (Track1) and nUN included).",
    "source": "Card",
    "type": "ans"
  },
  {
    "tag": "DF812B",
    "name": "DD Card (Track2)",
    "description":
        "DD Card (Track2) contains a copy of the discretionary data field of Track 2 Data as returned by the Card in the file read using the READ RECORD command during a mag-stripe mode transaction (i.e. without Unpredictable Number (Numeric), Application Transaction Counter, CVC3 (Track2) and nUN included).",
    "source": "Card",
    "type": "cn"
  },
  {
    "tag": "DF812C",
    "name": "Mag-stripe CVM Capability - No CVM Required",
    "description":
        "Indicates the CVM capability of the Terminal/Reader in the case of a mag-stripe mode transaction when the Amount, Authorized (Numeric) is less than or equal to the Reader CVM Required Limit.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "DF812D",
    "name": "Message Hold Time",
    "description":
        "Indicates the default delay for the processing of the next MSG signal. The Message Hold Time is an integer in units of 100ms.",
    "source": "",
    "type": "n 6"
  },
  {
    "tag": "DF8130",
    "name": "Hold Time Value",
    "description":
        "Indicates the time that the field is to be turned off after the transaction is completed if requested to do so by the cardholder device. The Hold Time Value is in units of 100ms.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "DF8131",
    "name": "Phone Message Table",
    "description":
        "The Phone Message Table is a variable length list of entries of eight bytes each, and defines for the selected AID the message and status identifiers as a function of the POS Cardholder Interaction Information. Each entry in the Phone Message Table contains the fields shown in the table below. Note that the last entry in the Phone Message Table must always have PCII Mask and PCII Value set to '000000'.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "FF60",
    "name": "Visa International",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "FF62",
    "name": "Visa Magnetic Stripe",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "FF63",
    "name": "Visa Quick VSDC",
    "description": "",
    "source": "Card",
    "type": "H"
  },
  {
    "tag": "FF8101",
    "name": "Torn Record",
    "description":
        "A copy of a record from the Torn Transaction Log that is expired. Torn Record is sent to the Terminal as part of the Discretionary Data.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "FF8102",
    "name": "Tags To Write Before Gen AC",
    "description":
        "List of data objects indicating the Terminal data writing requests to be sent to the Card before processing the GENERATE AC command or the RECOVER AC command. This data object may be provided several times by the Terminal in a DET signal. Therefore, these values must be accumulated in Tags To Write Yet Before Gen AC buffer.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "FF8103",
    "name": "Tags To Write After Gen AC",
    "description":
        "Contains the Terminal data writing requests to be sent to the Card after processing the GENERATE AC command or the RECOVER AC command. The value of this data object is composed of a series of TLVs. This data object may be provided several times by the Terminal in a DET signal. Therefore, these values must be accumulated in Tags To Write Yet After Gen AC.",
    "source": "",
    "type": "binary"
  },
  {
    "tag": "FF8104",
    "name": "Data To Send",
    "description":
        "List of data objects that contains the accumulated data sent by the Kernel to the Terminal in a DEK signal. These data may correspond to Terminal reading requests, obtained from the Card by means of GET DATA or READ RECORD commands, or may correspond to data that the Kernel posts to the Terminal as part of its own processing.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "FF8105",
    "name": "Data Record",
    "description":
        "The Data Record is a list of TLV encoded data objects returned with the Outcome Parameter Set on the completion of transaction processing.",
    "source": "Card",
    "type": "binary"
  },
  {
    "tag": "FF8106",
    "name": "Discretionary Data",
    "description":
        "The Discretionary Data is a list of Kernel-specific data objects sent to the Terminal as a separate field in the OUT signal.",
    "source": "Card",
    "type": "binary"
  }
];

const List CURRENCIES = [
  {'number': '4', 'code': 'AFA', 'name': 'Afghani', 'minor_units': '2'},
  {'number': '8', 'code': 'ALL', 'name': 'Leck', 'minor_units': '2'},
  {'number': '12', 'code': 'DZD', 'name': 'Algerian Dinar', 'minor_units': '2'},
  {
    'number': '20',
    'code': 'ADP',
    'name': 'Andorran Peseta',
    'minor_units': '0'
  },
  {
    'number': '31',
    'code': 'AZM',
    'name': 'Azerbaijanian Manat',
    'minor_units': '2'
  },
  {'number': '32', 'code': 'ARS', 'name': 'Argentine Peso', 'minor_units': '2'},
  {
    'number': '36',
    'code': 'AUD',
    'name': 'Australian Dollar',
    'minor_units': '2'
  },
  {
    'number': '44',
    'code': 'BSD',
    'name': 'Bahamian Dollar',
    'minor_units': '2'
  },
  {'number': '48', 'code': 'BHD', 'name': 'Bahraini Dinar', 'minor_units': '3'},
  {'number': '50', 'code': 'BDT', 'name': 'Taka', 'minor_units': '2'},
  {'number': '51', 'code': 'AMD', 'name': 'Armenian Dram', 'minor_units': '2'},
  {
    'number': '52',
    'code': 'BBD',
    'name': 'Barbados Dollar',
    'minor_units': '2'
  },
  {
    'number': '60',
    'code': 'BMD',
    'name': 'Bermudian Dollar',
    'minor_units': '2'
  },
  {'number': '64', 'code': 'BTN', 'name': 'Ngultrum', 'minor_units': '2'},
  {'number': '68', 'code': 'BOB', 'name': 'Boliviano', 'minor_units': '2'},
  {'number': '72', 'code': 'BWP', 'name': 'Pula', 'minor_units': '2'},
  {'number': '84', 'code': 'BZD', 'name': 'Belize Dollar', 'minor_units': '2'},
  {
    'number': '90',
    'code': 'SBD',
    'name': 'Solomon Islands Dollar',
    'minor_units': '2'
  },
  {'number': '96', 'code': 'BND', 'name': 'Brunei Dollar', 'minor_units': '2'},
  {'number': '100', 'code': 'BGL', 'name': 'Lev', 'minor_units': '2'},
  {'number': '104', 'code': 'MMK', 'name': 'Kyat', 'minor_units': '2'},
  {'number': '108', 'code': 'BIF', 'name': 'Burundi Franc', 'minor_units': '0'},
  {'number': '116', 'code': 'KHR', 'name': 'Riel', 'minor_units': '2'},
  {
    'number': '124',
    'code': 'CAD',
    'name': 'Canadian Dollar',
    'minor_units': '2'
  },
  {
    'number': '132',
    'code': 'CVE',
    'name': 'Cape Verde Escudo',
    'minor_units': '2'
  },
  {
    'number': '136',
    'code': 'KYD',
    'name': 'Cayman Islands Dollar',
    'minor_units': '2'
  },
  {
    'number': '144',
    'code': 'LKR',
    'name': 'Sri Lanka Rupee',
    'minor_units': '2'
  },
  {'number': '152', 'code': 'CLP', 'name': 'Chilean Peso', 'minor_units': '0'},
  {'number': '156', 'code': 'CNY', 'name': 'Yuan Renminbi', 'minor_units': '2'},
  {
    'number': '170',
    'code': 'COP',
    'name': 'Colombian Peso',
    'minor_units': '2'
  },
  {'number': '174', 'code': 'KMF', 'name': 'Comoro Franc', 'minor_units': '0'},
  {
    'number': '188',
    'code': 'CRC',
    'name': 'Costa Rican Colon',
    'minor_units': '2'
  },
  {'number': '191', 'code': 'HRK', 'name': 'Croatian kuna', 'minor_units': '2'},
  {'number': '192', 'code': 'CUP', 'name': 'Cuban Peso', 'minor_units': '2'},
  {'number': '196', 'code': 'CYP', 'name': 'Cyprus Pound', 'minor_units': '2'},
  {'number': '203', 'code': 'CZK', 'name': 'Czech Koruna', 'minor_units': '2'},
  {'number': '208', 'code': 'DKK', 'name': 'Danish Krone', 'minor_units': '2'},
  {
    'number': '214',
    'code': 'DOP',
    'name': 'Dominican Peso',
    'minor_units': '2'
  },
  {'number': '218', 'code': 'ECS', 'name': 'Sucre', 'minor_units': '2'},
  {
    'number': '222',
    'code': 'SVC',
    'name': 'El Salvador Colon',
    'minor_units': '2'
  },
  {
    'number': '230',
    'code': 'ETB',
    'name': 'Ethiopian Birr',
    'minor_units': '2'
  },
  {'number': '232', 'code': 'ERN', 'name': 'Nakfa', 'minor_units': '2'},
  {'number': '233', 'code': 'EEK', 'name': 'Kroon', 'minor_units': '2'},
  {
    'number': '238',
    'code': 'FKP',
    'name': 'Falkland Islands Pound',
    'minor_units': '2'
  },
  {'number': '242', 'code': 'FJD', 'name': 'Fiji Dollar', 'minor_units': '2'},
  {
    'number': '262',
    'code': 'DJF',
    'name': 'Djibouti Franc',
    'minor_units': '0'
  },
  {'number': '270', 'code': 'GMD', 'name': 'Dalasi', 'minor_units': '2'},
  {'number': '288', 'code': 'GHC', 'name': 'Cedi', 'minor_units': '2'},
  {
    'number': '292',
    'code': 'GIP',
    'name': 'Gibraltar Pound',
    'minor_units': '2'
  },
  {'number': '320', 'code': 'GTQ', 'name': 'Quetzal', 'minor_units': '2'},
  {'number': '324', 'code': 'GNF', 'name': 'Guinea Franc', 'minor_units': '0'},
  {'number': '328', 'code': 'GYD', 'name': 'Guyana Dollar', 'minor_units': '2'},
  {'number': '332', 'code': 'HTG', 'name': 'Gourde', 'minor_units': '2'},
  {'number': '340', 'code': 'HNL', 'name': 'Lempira', 'minor_units': '2'},
  {
    'number': '344',
    'code': 'HKD',
    'name': 'Hong Kong Dollar',
    'minor_units': '2'
  },
  {'number': '348', 'code': 'HUF', 'name': 'Forint', 'minor_units': '2'},
  {'number': '352', 'code': 'ISK', 'name': 'Iceland Krona', 'minor_units': '2'},
  {'number': '356', 'code': 'INR', 'name': 'Indian Rupee', 'minor_units': '2'},
  {'number': '360', 'code': 'IDR', 'name': 'Rupiah', 'minor_units': '2'},
  {'number': '364', 'code': 'IRR', 'name': 'Iranian Rial', 'minor_units': '2'},
  {'number': '368', 'code': 'IQD', 'name': 'Iraqi Dinar', 'minor_units': '3'},
  {
    'number': '376',
    'code': 'ILS',
    'name': 'New Israeli Sheqel',
    'minor_units': '2'
  },
  {
    'number': '388',
    'code': 'JMD',
    'name': 'Jamaican Dollar',
    'minor_units': '2'
  },
  {'number': '392', 'code': 'JPY', 'name': 'Yen', 'minor_units': '0'},
  {'number': '398', 'code': 'KZT', 'name': 'Tenge', 'minor_units': '2'},
  {
    'number': '400',
    'code': 'JOD',
    'name': 'Jordanian Dinar',
    'minor_units': '3'
  },
  {
    'number': '404',
    'code': 'KES',
    'name': 'Kenyan Shilling',
    'minor_units': '2'
  },
  {
    'number': '408',
    'code': 'KPW',
    'name': 'North Korean Won',
    'minor_units': '2'
  },
  {'number': '410', 'code': 'KRW', 'name': 'Won', 'minor_units': '0'},
  {'number': '414', 'code': 'KWD', 'name': 'Kuwaiti Dinar', 'minor_units': '3'},
  {'number': '417', 'code': 'KGS', 'name': 'Som', 'minor_units': '2'},
  {'number': '418', 'code': 'LAK', 'name': 'Kip', 'minor_units': '2'},
  {
    'number': '422',
    'code': 'LBP',
    'name': 'Lebanese Pound',
    'minor_units': '2'
  },
  {'number': '426', 'code': 'LSL', 'name': 'Loti', 'minor_units': '2'},
  {'number': '428', 'code': 'LVL', 'name': 'Latvian Lats', 'minor_units': '2'},
  {
    'number': '430',
    'code': 'LRD',
    'name': 'Liberian Dollar',
    'minor_units': '2'
  },
  {'number': '434', 'code': 'LYD', 'name': 'Lybian Dinar', 'minor_units': '3'},
  {
    'number': '440',
    'code': 'LTL',
    'name': 'Lithuanian Litus',
    'minor_units': '2'
  },
  {'number': '446', 'code': 'MOP', 'name': 'Pataca', 'minor_units': '2'},
  {
    'number': '450',
    'code': 'MGF',
    'name': 'Malagasy Franc',
    'minor_units': '0'
  },
  {'number': '454', 'code': 'MWK', 'name': 'Kwacha', 'minor_units': '2'},
  {
    'number': '458',
    'code': 'MYR',
    'name': 'Malaysian Ringgit',
    'minor_units': '2'
  },
  {'number': '462', 'code': 'MVR', 'name': 'Rufiyaa', 'minor_units': '2'},
  {'number': '470', 'code': 'MTL', 'name': 'Maltese Lira', 'minor_units': '2'},
  {'number': '478', 'code': 'MRO', 'name': 'Ouguiya', 'minor_units': '2'},
  {
    'number': '480',
    'code': 'MUR',
    'name': 'Mauritius Rupee',
    'minor_units': '2'
  },
  {'number': '484', 'code': 'MXN', 'name': 'Mexican Peso', 'minor_units': '2'},
  {'number': '496', 'code': 'MNT', 'name': 'Tugrik', 'minor_units': '2'},
  {'number': '498', 'code': 'MDL', 'name': 'Moldovan Leu', 'minor_units': '2'},
  {
    'number': '504',
    'code': 'MAD',
    'name': 'Moroccan Dirham',
    'minor_units': '2'
  },
  {'number': '508', 'code': 'MZM', 'name': 'Metical', 'minor_units': '2'},
  {'number': '512', 'code': 'OMR', 'name': 'Rial Omani', 'minor_units': '3'},
  {
    'number': '516',
    'code': 'NAD',
    'name': 'Namibia Dollar',
    'minor_units': '2'
  },
  {
    'number': '524',
    'code': 'NPR',
    'name': 'Nepalese Rupee',
    'minor_units': '2'
  },
  {
    'number': '532',
    'code': 'ANG',
    'name': 'Netherlands Antillan Guilder',
    'minor_units': '2'
  },
  {
    'number': '533',
    'code': 'AWG',
    'name': 'Aruban Guilder',
    'minor_units': '2'
  },
  {'number': '548', 'code': 'VUV', 'name': 'Vatu', 'minor_units': '0'},
  {
    'number': '554',
    'code': 'NZD',
    'name': 'New Zealand Dollar',
    'minor_units': '2'
  },
  {'number': '558', 'code': 'NIO', 'name': 'Cordoba Oro', 'minor_units': '2'},
  {'number': '566', 'code': 'NGN', 'name': 'Naira', 'minor_units': '2'},
  {
    'number': '578',
    'code': 'NOK',
    'name': 'Norwegian Krone',
    'minor_units': '2'
  },
  {
    'number': '586',
    'code': 'PKR',
    'name': 'Pakistan Rupee',
    'minor_units': '2'
  },
  {'number': '590', 'code': 'PAB', 'name': 'Balboa', 'minor_units': '2'},
  {'number': '598', 'code': 'PGK', 'name': 'Kina', 'minor_units': '2'},
  {'number': '600', 'code': 'PYG', 'name': 'Guarani', 'minor_units': '0'},
  {'number': '604', 'code': 'PEN', 'name': 'Nuevo Sol', 'minor_units': '2'},
  {
    'number': '608',
    'code': 'PHP',
    'name': 'Philippine Peso',
    'minor_units': '2'
  },
  {
    'number': '624',
    'code': 'GWP',
    'name': 'Guinea-Bissau Peso',
    'minor_units': '2'
  },
  {'number': '626', 'code': 'TPE', 'name': 'Timor Escudo', 'minor_units': '0'},
  {'number': '634', 'code': 'QAR', 'name': 'Qatari Rial', 'minor_units': '2'},
  {'number': '642', 'code': 'ROL', 'name': 'Leu', 'minor_units': '2'},
  {'number': '643', 'code': 'RUB', 'name': 'Russian Ruble', 'minor_units': '2'},
  {'number': '646', 'code': 'RWF', 'name': 'Rwanda Franc', 'minor_units': '0'},
  {
    'number': '654',
    'code': 'SHP',
    'name': 'Saint Helena Pound',
    'minor_units': '2'
  },
  {'number': '678', 'code': 'STD', 'name': 'Dobra', 'minor_units': '2'},
  {'number': '682', 'code': 'SAR', 'name': 'Saudi Riyal', 'minor_units': '2'},
  {
    'number': '690',
    'code': 'SCR',
    'name': 'Seychelles Rupee',
    'minor_units': '2'
  },
  {'number': '694', 'code': 'SLL', 'name': 'Leone', 'minor_units': '2'},
  {
    'number': '702',
    'code': 'SGD',
    'name': 'Singapore Dollar',
    'minor_units': '2'
  },
  {'number': '703', 'code': 'SKK', 'name': 'Slovak Koruna', 'minor_units': '2'},
  {'number': '704', 'code': 'VND', 'name': 'Dong', 'minor_units': '2'},
  {'number': '705', 'code': 'SIT', 'name': 'Tolar', 'minor_units': '2'},
  {
    'number': '706',
    'code': 'SOS',
    'name': 'Somali Shilling',
    'minor_units': '2'
  },
  {'number': '710', 'code': 'ZAR', 'name': 'Rand', 'minor_units': '2'},
  {
    'number': '716',
    'code': 'ZWD',
    'name': 'Zimbabwe Dollar',
    'minor_units': '2'
  },
  {
    'number': '736',
    'code': 'SDD',
    'name': 'Sudanese Dinar',
    'minor_units': '2'
  },
  {
    'number': '740',
    'code': 'SRG',
    'name': 'Suriname Guilder',
    'minor_units': '2'
  },
  {'number': '748', 'code': 'SZL', 'name': 'Lilangeni', 'minor_units': '2'},
  {'number': '752', 'code': 'SEK', 'name': 'Swedish Krona', 'minor_units': '2'},
  {'number': '756', 'code': 'CHF', 'name': 'Swiss Franc', 'minor_units': '2'},
  {'number': '760', 'code': 'SYP', 'name': 'Syrian Pound', 'minor_units': '2'},
  {'number': '764', 'code': 'THB', 'name': 'Baht', 'minor_units': '2'},
  {'number': '776', 'code': 'TOP', 'name': 'Pa´anga', 'minor_units': '2'},
  {
    'number': '780',
    'code': 'TTD',
    'name': 'Trinidad and Tobago Dollar',
    'minor_units': '0'
  },
  {'number': '784', 'code': 'AED', 'name': 'UAE Dirham', 'minor_units': '2'},
  {
    'number': '788',
    'code': 'TND',
    'name': 'Tunisian Dinar',
    'minor_units': '3'
  },
  {'number': '792', 'code': 'TRL', 'name': 'Turkish Lira', 'minor_units': '0'},
  {'number': '795', 'code': 'TMM', 'name': 'Manat', 'minor_units': '2'},
  {
    'number': '800',
    'code': 'UGX',
    'name': 'Uganda Shilling',
    'minor_units': '2'
  },
  {'number': '807', 'code': 'MKD', 'name': 'Denar', 'minor_units': '2'},
  {'number': '810', 'code': 'RUR', 'name': 'Russian Ruble', 'minor_units': '2'},
  {
    'number': '818',
    'code': 'EGP',
    'name': 'Egyptian Pound',
    'minor_units': '2'
  },
  {
    'number': '826',
    'code': 'GBP',
    'name': 'Pound Sterling',
    'minor_units': '2'
  },
  {
    'number': '834',
    'code': 'TZS',
    'name': 'Tanzanian Shilling',
    'minor_units': '2'
  },
  {'number': '840', 'code': 'USD', 'name': 'US Dollar', 'minor_units': '2'},
  {'number': '858', 'code': 'UYU', 'name': 'Peso Uruguayo', 'minor_units': '2'},
  {
    'number': '860',
    'code': 'UZS',
    'name': 'Uzbekistan Sum',
    'minor_units': '2'
  },
  {'number': '862', 'code': 'VEB', 'name': 'Bolivar', 'minor_units': '2'},
  {'number': '886', 'code': 'YER', 'name': 'Yemeni Rial', 'minor_units': '2'},
  {
    'number': '891',
    'code': 'YUM',
    'name': 'Yugoslavian Dinar',
    'minor_units': '2'
  },
  {'number': '894', 'code': 'ZMK', 'name': 'Kwacha', 'minor_units': '2'},
  {
    'number': '901',
    'code': 'TWD',
    'name': 'New Taiwan Dollar',
    'minor_units': '2'
  },
  {
    'number': '949',
    'code': 'TRY',
    'name': 'New Turkish Lira',
    'minor_units': '2'
  },
  {
    'number': '950',
    'code': 'XAF',
    'name': 'CFA Franc BEAC',
    'minor_units': '0'
  },
  {
    'number': '951',
    'code': 'XCD',
    'name': 'East Caribbean Dollar',
    'minor_units': '2'
  },
  {
    'number': '952',
    'code': 'XOF',
    'name': 'CFA Franc BCEAO',
    'minor_units': '0'
  },
  {'number': '953', 'code': 'XPF', 'name': 'CFP Franc', 'minor_units': '0'},
  {'number': '972', 'code': 'TJS', 'name': 'Somoni', 'minor_units': '2'},
  {'number': '973', 'code': 'AOA', 'name': 'Kwanza', 'minor_units': '2'},
  {
    'number': '974',
    'code': 'BYR',
    'name': 'Belarussian Ruble',
    'minor_units': '0'
  },
  {'number': '975', 'code': 'BGN', 'name': 'Bulgarian Lev', 'minor_units': '2'},
  {
    'number': '976',
    'code': 'CDF',
    'name': 'Franc Congolais',
    'minor_units': '2'
  },
  {
    'number': '977',
    'code': 'BAM',
    'name': 'Convertible Marks',
    'minor_units': '2'
  },
  {'number': '978', 'code': 'EUR', 'name': 'Euro', 'minor_units': '2'},
  {
    'number': '979',
    'code': 'MXV',
    'name': 'Mexican Unidad de Inversion (UDI)',
    'minor_units': '2'
  },
  {'number': '980', 'code': 'UAH', 'name': 'Hryvnia', 'minor_units': '2'},
  {'number': '981', 'code': 'GEL', 'name': 'Lari', 'minor_units': '2'},
  {
    'number': '983',
    'code': 'ECV',
    'name': 'Unidad de Valor Constante (UVC)',
    'minor_units': '2'
  },
  {'number': '984', 'code': 'BOV', 'name': 'Mvdol', 'minor_units': '2'},
  {'number': '985', 'code': 'PLN', 'name': 'Zloty', 'minor_units': '2'},
  {
    'number': '986',
    'code': 'BRL',
    'name': 'Brazilian Real',
    'minor_units': '2'
  },
  {
    'number': '990',
    'code': 'CLF',
    'name': 'Unidades de fomento',
    'minor_units': '0'
  }
];

const List COUNTRY_CODES = [
  {'code': '004', 'name': 'Afghanistan'},
  {'code': '008', 'name': 'Albania'},
  {'code': '010', 'name': 'Antarctica'},
  {'code': '012', 'name': 'Algeria'},
  {'code': '016', 'name': 'American Samoa'},
  {'code': '020', 'name': 'Andorra'},
  {'code': '024', 'name': 'Angola'},
  {'code': '028', 'name': 'Antigua and Barbuda'},
  {'code': '031', 'name': 'Azerbaijan'},
  {'code': '032', 'name': 'Argentina'},
  {'code': '036', 'name': 'Australia'},
  {'code': '040', 'name': 'Austria'},
  {'code': '044', 'name': 'Bahamas'},
  {'code': '048', 'name': 'Bahrain'},
  {'code': '050', 'name': 'Bangladesh'},
  {'code': '051', 'name': 'Armenia'},
  {'code': '052', 'name': 'Barbados'},
  {'code': '056', 'name': 'Belgium'},
  {'code': '060', 'name': 'Bermuda'},
  {'code': '064', 'name': 'Bhutan'},
  {'code': '068', 'name': 'Bolivia, Plurinational State of'},
  {'code': '070', 'name': 'Bosnia and Herzegovina'},
  {'code': '072', 'name': 'Botswana'},
  {'code': '074', 'name': 'Bouvet Island'},
  {'code': '076', 'name': 'Brazil'},
  {'code': '084', 'name': 'Belize'},
  {'code': '086', 'name': 'British Indian Ocean Territory'},
  {'code': '090', 'name': 'Solomon Islands'},
  {'code': '092', 'name': 'Virgin Islands, British'},
  {'code': '096', 'name': 'Brunei Darussalam'},
  {'code': '100', 'name': 'Bulgaria'},
  {'code': '104', 'name': 'Myanmar'},
  {'code': '108', 'name': 'Burundi'},
  {'code': '112', 'name': 'Belarus'},
  {'code': '116', 'name': 'Cambodia'},
  {'code': '120', 'name': 'Cameroon'},
  {'code': '124', 'name': 'Canada'},
  {'code': '132', 'name': 'Cape Verde'},
  {'code': '136', 'name': 'Cayman Islands'},
  {'code': '140', 'name': 'Central African Republic'},
  {'code': '144', 'name': 'Sri Lanka'},
  {'code': '148', 'name': 'Chad'},
  {'code': '152', 'name': 'Chile'},
  {'code': '156', 'name': 'China'},
  {'code': '158', 'name': 'Taiwan, Province of China'},
  {'code': '162', 'name': 'Christmas Island'},
  {'code': '166', 'name': 'Cocos (Keeling) Islands'},
  {'code': '170', 'name': 'Colombia'},
  {'code': '174', 'name': 'Comoros'},
  {'code': '175', 'name': 'Mayotte'},
  {'code': '178', 'name': 'Congo'},
  {'code': '180', 'name': 'Congo, the Democratic Republic of the'},
  {'code': '184', 'name': 'Cook Islands'},
  {'code': '188', 'name': 'Costa Rica'},
  {'code': '191', 'name': 'Croatia'},
  {'code': '192', 'name': 'Cuba'},
  {'code': '196', 'name': 'Cyprus'},
  {'code': '203', 'name': 'Czech Republic'},
  {'code': '204', 'name': 'Benin'},
  {'code': '208', 'name': 'Denmark'},
  {'code': '212', 'name': 'Dominica'},
  {'code': '214', 'name': 'Dominican Republic'},
  {'code': '218', 'name': 'Ecuador'},
  {'code': '222', 'name': 'El Salvador'},
  {'code': '226', 'name': 'Equatorial Guinea'},
  {'code': '231', 'name': 'Ethiopia'},
  {'code': '232', 'name': 'Eritrea'},
  {'code': '233', 'name': 'Estonia'},
  {'code': '234', 'name': 'Faroe Islands'},
  {'code': '238', 'name': 'Falkland Islands (Malvinas)'},
  {'code': '239', 'name': 'South Georgia and the South Sandwich Islands'},
  {'code': '242', 'name': 'Fiji'},
  {'code': '246', 'name': 'Finland'},
  {'code': '248', 'name': 'Åland Islands'},
  {'code': '250', 'name': 'France'},
  {'code': '254', 'name': 'French Guiana'},
  {'code': '258', 'name': 'French Polynesia'},
  {'code': '260', 'name': 'French Southern Territories'},
  {'code': '262', 'name': 'Djibouti'},
  {'code': '266', 'name': 'Gabon'},
  {'code': '268', 'name': 'Georgia'},
  {'code': '270', 'name': 'Gambia'},
  {'code': '275', 'name': 'Palestinian Territory, Occupied'},
  {'code': '276', 'name': 'Germany'},
  {'code': '288', 'name': 'Ghana'},
  {'code': '292', 'name': 'Gibraltar'},
  {'code': '296', 'name': 'Kiribati'},
  {'code': '300', 'name': 'Greece'},
  {'code': '304', 'name': 'Greenland'},
  {'code': '308', 'name': 'Grenada'},
  {'code': '312', 'name': 'Guadeloupe'},
  {'code': '316', 'name': 'Guam'},
  {'code': '320', 'name': 'Guatemala'},
  {'code': '324', 'name': 'Guinea'},
  {'code': '328', 'name': 'Guyana'},
  {'code': '332', 'name': 'Haiti'},
  {'code': '334', 'name': 'Heard Island and McDonald Islands'},
  {'code': '336', 'name': 'Holy See (Vatican City State)'},
  {'code': '340', 'name': 'Honduras'},
  {'code': '344', 'name': 'Hong Kong'},
  {'code': '348', 'name': 'Hungary'},
  {'code': '352', 'name': 'Iceland'},
  {'code': '356', 'name': 'India'},
  {'code': '360', 'name': 'Indonesia'},
  {'code': '364', 'name': 'Iran, Islamic Republic of'},
  {'code': '368', 'name': 'Iraq'},
  {'code': '372', 'name': 'Ireland'},
  {'code': '376', 'name': 'Israel'},
  {'code': '380', 'name': 'Italy'},
  {'code': '384', 'name': "Côte d'Ivoire"},
  {'code': '388', 'name': 'Jamaica'},
  {'code': '392', 'name': 'Japan'},
  {'code': '398', 'name': 'Kazakhstan'},
  {'code': '400', 'name': 'Jordan'},
  {'code': '404', 'name': 'Kenya'},
  {'code': '408', 'name': "Korea, Democratic People's Republic of"},
  {'code': '410', 'name': 'Korea, Republic of'},
  {'code': '414', 'name': 'Kuwait'},
  {'code': '417', 'name': 'Kyrgyzstan'},
  {'code': '418', 'name': "Lao People's Democratic Republic"},
  {'code': '422', 'name': 'Lebanon'},
  {'code': '426', 'name': 'Lesotho'},
  {'code': '428', 'name': 'Latvia'},
  {'code': '430', 'name': 'Liberia'},
  {'code': '434', 'name': 'Libyan Arab Jamahiriya'},
  {'code': '438', 'name': 'Liechtenstein'},
  {'code': '440', 'name': 'Lithuania'},
  {'code': '442', 'name': 'Luxembourg'},
  {'code': '446', 'name': 'Macao'},
  {'code': '450', 'name': 'Madagascar'},
  {'code': '454', 'name': 'Malawi'},
  {'code': '458', 'name': 'Malaysia'},
  {'code': '462', 'name': 'Maldives'},
  {'code': '466', 'name': 'Mali'},
  {'code': '470', 'name': 'Malta'},
  {'code': '474', 'name': 'Martinique'},
  {'code': '478', 'name': 'Mauritania'},
  {'code': '480', 'name': 'Mauritius'},
  {'code': '484', 'name': 'Mexico'},
  {'code': '492', 'name': 'Monaco'},
  {'code': '496', 'name': 'Mongolia'},
  {'code': '498', 'name': 'Moldova, Republic of'},
  {'code': '499', 'name': 'Montenegro'},
  {'code': '500', 'name': 'Montserrat'},
  {'code': '504', 'name': 'Morocco'},
  {'code': '508', 'name': 'Mozambique'},
  {'code': '512', 'name': 'Oman'},
  {'code': '516', 'name': 'Namibia'},
  {'code': '520', 'name': 'Nauru'},
  {'code': '524', 'name': 'Nepal'},
  {'code': '528', 'name': 'Netherlands'},
  {'code': '531', 'name': 'Curaçao'},
  {'code': '533', 'name': 'Aruba'},
  {'code': '534', 'name': 'Sint Maarten (Dutch part)'},
  {'code': '535', 'name': 'Bonaire, Sint Eustatius and Saba'},
  {'code': '540', 'name': 'New Caledonia'},
  {'code': '548', 'name': 'Vanuatu'},
  {'code': '554', 'name': 'New Zealand'},
  {'code': '558', 'name': 'Nicaragua'},
  {'code': '562', 'name': 'Niger'},
  {'code': '566', 'name': 'Nigeria'},
  {'code': '570', 'name': 'Niue'},
  {'code': '574', 'name': 'Norfolk Island'},
  {'code': '578', 'name': 'Norway'},
  {'code': '580', 'name': 'Northern Mariana Islands'},
  {'code': '581', 'name': 'United States Minor Outlying Islands'},
  {'code': '583', 'name': 'Micronesia, Federated States of'},
  {'code': '584', 'name': 'Marshall Islands'},
  {'code': '585', 'name': 'Palau'},
  {'code': '586', 'name': 'Pakistan'},
  {'code': '591', 'name': 'Panama'},
  {'code': '598', 'name': 'Papua New Guinea'},
  {'code': '600', 'name': 'Paraguay'},
  {'code': '604', 'name': 'Peru'},
  {'code': '608', 'name': 'Philippines'},
  {'code': '612', 'name': 'Pitcairn'},
  {'code': '616', 'name': 'Poland'},
  {'code': '620', 'name': 'Portugal'},
  {'code': '624', 'name': 'Guinea-Bissau'},
  {'code': '626', 'name': 'Timor-Leste'},
  {'code': '630', 'name': 'Puerto Rico'},
  {'code': '634', 'name': 'Qatar'},
  {'code': '638', 'name': 'Réunion'},
  {'code': '642', 'name': 'Romania'},
  {'code': '643', 'name': 'Russian Federation'},
  {'code': '646', 'name': 'Rwanda'},
  {'code': '652', 'name': 'Saint Barthélemy'},
  {'code': '654', 'name': 'Saint Helena, Ascension and Tristan da Cunha'},
  {'code': '659', 'name': 'Saint Kitts and Nevis'},
  {'code': '660', 'name': 'Anguilla'},
  {'code': '662', 'name': 'Saint Lucia'},
  {'code': '663', 'name': 'Saint Martin (French part)'},
  {'code': '666', 'name': 'Saint Pierre and Miquelon'},
  {'code': '670', 'name': 'Saint Vincent and the Grenadines'},
  {'code': '674', 'name': 'San Marino'},
  {'code': '678', 'name': 'Sao Tome and Principe'},
  {'code': '682', 'name': 'Saudi Arabia'},
  {'code': '686', 'name': 'Senegal'},
  {'code': '688', 'name': 'Serbia'},
  {'code': '690', 'name': 'Seychelles'},
  {'code': '694', 'name': 'Sierra Leone'},
  {'code': '702', 'name': 'Singapore'},
  {'code': '703', 'name': 'Slovakia'},
  {'code': '704', 'name': 'Viet Nam'},
  {'code': '705', 'name': 'Slovenia'},
  {'code': '706', 'name': 'Somalia'},
  {'code': '710', 'name': 'South Africa'},
  {'code': '716', 'name': 'Zimbabwe'},
  {'code': '724', 'name': 'Spain'},
  {'code': '732', 'name': 'Western Sahara'},
  {'code': '736', 'name': 'Sudan'},
  {'code': '740', 'name': 'Suriname'},
  {'code': '744', 'name': 'Svalbard and Jan Mayen'},
  {'code': '748', 'name': 'Swaziland'},
  {'code': '752', 'name': 'Sweden'},
  {'code': '756', 'name': 'Switzerland'},
  {'code': '760', 'name': 'Syrian Arab Republic'},
  {'code': '762', 'name': 'Tajikistan'},
  {'code': '764', 'name': 'Thailand'},
  {'code': '768', 'name': 'Togo'},
  {'code': '772', 'name': 'Tokelau'},
  {'code': '776', 'name': 'Tonga'},
  {'code': '780', 'name': 'Trinidad and Tobago'},
  {'code': '784', 'name': 'United Arab Emirates'},
  {'code': '788', 'name': 'Tunisia'},
  {'code': '792', 'name': 'Turkey'},
  {'code': '795', 'name': 'Turkmenistan'},
  {'code': '796', 'name': 'Turks and Caicos Islands'},
  {'code': '798', 'name': 'Tuvalu'},
  {'code': '800', 'name': 'Uganda'},
  {'code': '804', 'name': 'Ukraine'},
  {'code': '807', 'name': 'Macedonia, the former Yugoslav Republic of'},
  {'code': '818', 'name': 'Egypt'},
  {'code': '826', 'name': 'United Kingdom'},
  {'code': '831', 'name': 'Guernsey'},
  {'code': '832', 'name': 'Jersey'},
  {'code': '833', 'name': 'Isle of Man'},
  {'code': '834', 'name': 'Tanzania, United Republic of'},
  {'code': '840', 'name': 'United States'},
  {'code': '850', 'name': 'Virgin Islands, U.S.'},
  {'code': '854', 'name': 'Burkina Faso'},
  {'code': '858', 'name': 'Uruguay'},
  {'code': '860', 'name': 'Uzbekistan'},
  {'code': '862', 'name': 'Venezuela, Bolivarian Republic of'},
  {'code': '876', 'name': 'Wallis and Futuna'},
  {'code': '882', 'name': 'Samoa'},
  {'code': '887', 'name': 'Yemen'},
  {'code': '894', 'name': 'Zambia'}
];

const List ICC_DATA_TAGS = [
  {"tag": "Length Attribute", "requirement": "\u00a0"},
  {"tag": "71", "requirement": "OR"},
  {"tag": "72", "requirement": "OR"},
  {"tag": "82", "requirement": "M"},
  {"tag": "84", "requirement": "M"},
  {"tag": "8A", "requirement": "O"},
  {"tag": "91", "requirement": "OR"},
  {"tag": "95", "requirement": "M"},
  {"tag": "9A", "requirement": "M"},
  {"tag": "9C", "requirement": "M"},
  {"tag": "5F2A", "requirement": "M"},
  {"tag": "9F02", "requirement": "M"},
  {
    "tag": "9F03",
    "requirement": "M for cashback if \u201c9F03\u201d provided by terminal"
  },
  {"tag": "9F09", "requirement": "O"},
  {"tag": "9F10", "requirement": "M if provided by card"},
  {"tag": "9F1A", "requirement": "M"},
  {"tag": "9F1E", "requirement": "O"},
  {"tag": "9F26", "requirement": "M"},
  {"tag": "9F27", "requirement": "M"},
  {"tag": "9F33", "requirement": "M"},
  {"tag": "9F34", "requirement": "M\u00a0"},
  {"tag": "9F35", "requirement": "O"},
  {"tag": "9F36", "requirement": "M"},
  {"tag": "9F37", "requirement": "M"},
  {"tag": "9F41", "requirement": "O"},
  {"tag": "9F53", "requirement": "O"},
  {"tag": "5F34", "requirement": "M\u00a0 if provided by card"},
  {"tag": "9F6E", "requirement": "C"},
  {"tag": "9F7C", "requirement": "O"}
];
