import 'package:flutter/material.dart';

import 'package:code_magic_ex/ui/screens/demo/bloc.dart';
import 'package:code_magic_ex/ui/screens/demo/state.dart';
import 'package:code_magic_ex/ui/screens/demo/service.dart';
import 'package:code_magic_ex/ui/screens/github/empty_result_widget.dart';
import 'package:code_magic_ex/ui/screens/github/search_error_widget.dart';
import 'package:code_magic_ex/ui/screens/github/search_loading_widget.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  late ContactService respository;
  late ContactBloc contactBloc;

  @override
  void initState() {
    super.initState();
    respository = ContactService();
    contactBloc = ContactBloc(respository);
    contactBloc.loadEvents();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Example._title",
        home: Scaffold(
            appBar: AppBar(title: const Text("Example._title")),
            body: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: StreamBuilder<Object>(
                  stream: contactBloc.state,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      final result = snapshot.data as ContactsPageState;
                      return Column(
                        children: [
                          Container(
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0))),
                              child: TextField(
                                cursorColor: Colors.grey[300],
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  focusedBorder: InputBorder.none,
                                  prefixIcon: const Icon(Icons.search,
                                      color: Colors.grey),
                                  hintStyle: TextStyle(color: Colors.grey[300]),
                                ),
                              )),
                          _buildChild(result)
                        ],
                      );
                    } else {
                      return const Text("No data yet");
                    }
                  }),
            )));
  }

  Widget _buildChild(ContactsPageState state) {
    if (state.isLoading) {
      return const LoadingWidget();
    } else if (state.hasError) {
      return const SearchErrorWidget();
    } else if(state.contacts.isEmpty){
      return const EmptyWidget();
    } else {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: state.contacts.length,
          itemBuilder: (context, index) {
            final item = state.contacts[index];
            return Text(item.email);
          });
    }
    // throw Exception('${state.runtimeType} is not supported');
  }
}
