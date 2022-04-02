import 'package:bloc_futurebuilder_example/Counter/CounterCubit.dart';
import 'package:bloc_futurebuilder_example/Counter/Counter_view.dart';
import 'package:bloc_futurebuilder_example/KisilerCubit.dart';
import 'package:bloc_futurebuilder_example/KisilerDaoRepository.dart';
import 'package:bloc_futurebuilder_example/KisilerDurum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => KisilerCubit(KisilerDaoRepository()),
            child: Container(),
          ),

                    BlocProvider(
            create: (context) => CounterCubit(),
            child: Container(),
          )
        ],
        child: MaterialApp(
          title: 'Material App',
          home: AnaSayfa(),
        ));
  }
}

class AnaSayfa extends StatefulWidget {
  AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<KisilerCubit>().kisileriAlveTetikle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: BlocBuilder<KisilerCubit, KisilerDurum>(builder: (context, kisilerDurum) {
        if (kisilerDurum is KisilerYuklendi) {
          var kisiListesi = kisilerDurum.kisiListesi;
          return ListView.builder(
            itemCount: kisiListesi.length,
            itemBuilder: (context, index) {
              var kisi = kisiListesi[index];
              return Card(
                child: Row(
                  children: [Text("${kisi.kisi_ad} - ${kisi.kisi_tel}")],
                ),
              );
            },
          );
        } else
          return Center();
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) => CounterView())),
      ),
    );
  }
}
