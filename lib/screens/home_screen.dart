import 'package:cats_api_connection/notifiers/home_notifier.dart';
import 'package:cats_api_connection/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gatos"),
        actions: [
          IconButton(
              onPressed: () {
                //Cambiar el estado del tema
                // listen: false, no escucho cambios, sino que los notifico
                // Provider.of<HomeNotifier>(context, listen: false).isDark = true;
                /// 2da forma
                /// read no necesitamos especificar el listen: false
                context.read<HomeNotifier>().switchTheme();
              },
              icon: const Icon(Icons.light)),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: FilledButton(
                onPressed: () async {
                  // Navigator.pushNamed(context, DetailsScreen.routeName);
                  await context.read<HomeNotifier>().getFaqs();
                  print(context.read<HomeNotifier>().faqs);
                },
                child: Text("Get Faqs")),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              final data = context.watch<HomeNotifier>().faqs;
              return Text(data[index].fact);
            },
            itemCount: context.watch<HomeNotifier>().faqs.length,
          )),
        ],
      ),
    );
  }
}
