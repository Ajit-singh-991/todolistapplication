import 'package:flutter/material.dart';
import 'package:todolistapplication/providers/task.dart';
import 'package:todolistapplication/screens/sucess.dart';
import 'package:todolistapplication/screens/withdrawal.dart';
import 'package:todolistapplication/widgets/tabbar.dart';

class ReceiptPage extends StatefulWidget {
  final String beneficiaryName;
  final String bank;
  final String accountNo;
  final String ifsc;
  final String useraccountNo;
  final String mobile;
  final String aadharNo;
  final String panNo;
  const ReceiptPage(
      {super.key,
      required this.beneficiaryName,
      required this.bank,
      required this.accountNo,
      required this.ifsc,
      required this.useraccountNo,
      required this.mobile,
      required this.aadharNo,
      required this.panNo});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 35.0, 0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.20,
              color: Colors.amber,
              padding: const EdgeInsets.all(26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Beneficiary Name: ${widget.beneficiaryName}'),
                  Text('Account Number: ${widget.accountNo}'),
                  Text('Beneficiary Name: ${widget.bank}'),
                  Text('Bank: ${widget.ifsc}'),
                  Text('Account Number: ${widget.mobile}'),
                  Text('Beneficiary Name: ${widget.aadharNo}'),
                  Text('Bank: ${widget.panNo}'),
                ],
              ),
            ),
          ),
           Expanded(
             child: Container(
              height: MediaQuery.of(context).size.height*0.80,
              child:  SuccessAndRefundList(accountNo: widget.useraccountNo,)),
           ),
        ],
      ),
    );
  }
}
