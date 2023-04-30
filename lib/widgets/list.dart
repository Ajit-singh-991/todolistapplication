import 'package:flutter/material.dart';
import 'package:todolistapplication/ApiConstants/constant_api.dart';
import 'package:todolistapplication/widgets/receipt_page.dart';

//Parent widget of all ListItems, this widget role is just to group all list tiles.
class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<dynamic> _data = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: ApiBaseUrl().fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<dynamic> data = snapshot.data!;
          return data.isNotEmpty
        ?  ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final dynamic item = data[index];
              return GestureDetector(
                onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>   ReceiptPage(
            beneficiaryName: item['beneficiaryName'],
            bank: item['bank'],
            accountNo: item['accountNo'], 
            aadharNo: item['aadharNo'], 
            ifsc: item['ifsc'], 
            mobile: item['mobile'], 
            panNo: item['panNo'], 
            useraccountNo: item['useraccountNo'],
            )),
        );
      },
                child: ListTile(
                  title: Text(item['beneficiaryName']),
                  subtitle: Text(item['bank']),
                ),
              );
            },
          ) : LayoutBuilder(
            builder: (ctx, constraints) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: constraints.maxHeight * 0.5,
                      child: Image.asset('assets/images/waiting.png',
                          fit: BoxFit.cover),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'No tasks added yet...',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    
    );
  }
}
