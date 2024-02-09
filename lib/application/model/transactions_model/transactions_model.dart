class TransactionsListModel {
  List<TransactionList> transactionList = [];

  TransactionsListModel({required this.transactionList});

  TransactionsListModel.fromJson(Map<String, dynamic> json) {
    if (json['transactionList'] != null) {
      transactionList = <TransactionList>[];
      json['transactionList'].forEach((v) {
        transactionList.add(TransactionList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transactionList'] =
        transactionList.map((v) => v.toJson()).toList();
    return data;
  }
}

class TransactionList {
  String? transactionDay;
  List<Transactions>? transactions;

  TransactionList({this.transactionDay, this.transactions});

  TransactionList.fromJson(Map<String, dynamic> json) {
    transactionDay = json['transactionDay'];
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transactionDay'] = this.transactionDay;
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transactions {
  String? transactionType;
  String? transactionTitle;
  double? transactionAmount;

  Transactions(
      {this.transactionType, this.transactionTitle, this.transactionAmount});

  Transactions.fromJson(Map<String, dynamic> json) {
    transactionType = json['transactionType'];
    transactionTitle = json['transactionTitle'];
    transactionAmount = json['transactionAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transactionType'] = this.transactionType;
    data['transactionTitle'] = this.transactionTitle;
    data['transactionAmount'] = this.transactionAmount;
    return data;
  }
}