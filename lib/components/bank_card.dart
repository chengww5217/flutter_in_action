import 'package:flutter/material.dart';
import 'package:flutter_in_action/bean/bank_bean.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BankCard extends StatelessWidget {

  final BankBean bank;

  BankCard(this.bank);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(18, 18, 18, 6),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFF17B68), Color(0xFFE95F66)]),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(blurRadius: 12, spreadRadius: 6, color: Colors.black26)
          ]),
      child: Stack(
        children: [
          buildLogoBg(),
          Padding(
            padding: EdgeInsets.all(26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildBankLogo(),
                Padding(padding: EdgeInsets.only(bottom: 18)),
                buildCardNo(),
                buildDate(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildDate() {
    return Container(
                padding: EdgeInsets.only(left: 74, top: 8, bottom: 10),
                child: Text(
                  bank.date,
                  style: TextStyle(color: Colors.white70),
                ),
              );
  }

  Positioned buildLogoBg() {
    return Positioned(
          child: SvgPicture.asset(
            bank.logo,
            color: Colors.white10,
          ),
          right: -80,
          bottom: -80,
          width: 220,
          height: 220,
        );
  }

  Container buildCardNo() {
    return Container(
      padding: EdgeInsets.only(left: 74),
      child: Text(
        bank.cardNo,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
      ),
    );
  }

  Row buildBankLogo() {
    return Row(
      children: [
        ClipOval(
          child: Container(
            padding: EdgeInsets.all(6),
            color: Colors.white,
            child: SvgPicture.asset(
              bank.logo,
              width: 36,
              height: 36,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bank.name,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                bank.cardType,
                style: TextStyle(color: Colors.white60),
              ),
            ],
          ),
        )
      ],
    );
  }
}
