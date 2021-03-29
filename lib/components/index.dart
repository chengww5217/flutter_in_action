import 'package:flutter/material.dart';
import 'package:flutter_in_action/bean/bank_bean.dart';
import 'package:flutter_in_action/bean/pets_card_bean.dart';
import 'package:flutter_in_action/bean/wechat_moments_bean.dart';
import 'package:flutter_in_action/components/bank_card.dart';
import 'package:flutter_in_action/components/pets_card.dart';
import 'package:flutter_in_action/components/wechat_moments.dart';

class DemoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("基础组件"),
            bottom: TabBar(
              tabs: [
                Tab(text: "宠物卡片"),
                Tab(text: "银行卡"),
                Tab(text: "微信朋友圈"),
              ],
            ),
            centerTitle: true,
          ),
          body: TabBarView(children: [
            Column(children: [PetsCard(mockPetsPost())],),
            Column(children: [BankCard(mockBankBean())],),
            ListView(children: [WeChatMoments(mockWeChatMoments())],)
          ]),
        ));
  }
}
