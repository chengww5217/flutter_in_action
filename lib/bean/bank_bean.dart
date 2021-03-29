class BankBean {
  final String logo;
  final String name;
  final String cardType;
  final String cardNo;
  final String date;

  BankBean(this.logo, this.name, this.cardType, this.cardNo, this.date);
}

BankBean mockBankBean() => BankBean(
    "images/svg/cmb.svg", "招商银行", "储蓄卡", "6210 **** **** 8888", "11/27/2022");
