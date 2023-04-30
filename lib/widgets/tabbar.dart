import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:todolistapplication/ApiConstants/constant_api.dart';
class SuccessAndRefundList extends StatefulWidget {
  final String accountNo;
  const SuccessAndRefundList({Key? key, required this.accountNo}) : super(key: key);

  @override
  State<SuccessAndRefundList> createState() => _SuccessAndRefundListState();
}

class _SuccessAndRefundListState extends State<SuccessAndRefundList> {

  List<dynamic>? _successList;
  List<dynamic>? _refundList;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse(ApiBaseUrl.getAccountsHistory+widget.accountNo));
    if (response.statusCode == 200) {
      final dynamic jsonData = json.decode(response.body);
      if (jsonData['status'] == true && jsonData['data'] is Map<String, dynamic>) {
        setState(() {
          _successList = jsonData['data']['successList'];
          _refundList = jsonData['data']['refundList'];
        });
      } else {
        throw Exception('Failed to parse data');
      }
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print(e.toString());
    // handle error
  }
}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 24),
            const TabBar(
              tabs: [
                Tab(text: 'Success'),
                Tab(text: 'Refund'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _successList == null
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: _successList!.length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = _successList![index];
                            return Container(
                              height: MediaQuery.of(context).size.height*0.8,
                              child: Column(
                                children: [
                                  Text(item['name']),
                                  Text(item['accountNo']),
                                  Text(item['originalAmount']),
                                  Text(item['createdAt']),
                                ],
                              ),
                            );
                          },
                        ),
                  _refundList == null
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: _refundList!.length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = _refundList![index];
                            return Container(
                              height: MediaQuery.of(context).size.height*0.8,
                              child: Column(
                                children: [
                                  Text(item['name']),
                                  Text(item['accountNo']),
                                  Text(item['originalAmount']),
                                  Text(item['createdAt']),
                                ],
                              ),
                            );
                          },
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
