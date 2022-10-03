
class Symbol{

 String symbol ;//": "AFDS.ZW",
 String symbolId; //": "50",
 String companyId ;//": "1",
 String isActive; //": "1",
  String isin; //": "ZW0009011025",
  String symbolName; //: "AFDIS DISTILLERS LIMITED",
 String symbolTypeId;//SYMBOL_TYPE_ID": "1",
 String depositoryId ; //DEPOSITORY_ID": "2"

  Symbol({
        required this.symbol,
        required this.symbolId,
        required this.companyId,
        required this.isActive,
        required this.isin,
        required this.symbolName,
        required this.symbolTypeId,
        required this.depositoryId
  });

  factory Symbol.fromJson(Map<String, dynamic> json){
    return Symbol(symbol: json['SYMBOL'], symbolId: json['SYMBOL_ID'],
        companyId: json['COMPANYID'],isActive: json['ACTIVE'],
        isin: json['ISIN'],symbolName: json['SYMBOLNAME'],
        symbolTypeId: json['SYMBOL_TYPE_ID'], depositoryId: json['DEPOSITORY_ID'],
                 );
  }


}
