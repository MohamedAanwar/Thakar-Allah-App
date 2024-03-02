import 'package:athkar/components/TsbihPageCom/add_tsbih_form.dart';
import 'package:athkar/components/TsbihPageCom/tsbih_item.dart';
import 'package:athkar/const.dart';
import 'package:athkar/cubits/cubit/AddTsbihCubit/add_tsbih_cubit_cubit.dart';
import 'package:athkar/cubits/cubit/TsbihFitchData/cubit/tsbih_fitch_data_cubit.dart';
import 'package:athkar/models/tsbih_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTsbihView extends StatefulWidget {
  const AddTsbihView({super.key});

  @override
  State<AddTsbihView> createState() => _AddTsbihViewState();
}

class _AddTsbihViewState extends State<AddTsbihView> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showsheet(context);
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 32,
          ),
          backgroundColor: Colors.white.withOpacity(0.5),
        ),
        backgroundColor: kPrimaryCOlor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kPrimaryCOlor,
          title: Text(
            'الخميس, شعبان12, 1445',
            style: TextStyle(
                fontFamily: kPrimaryFont,
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showsheet(context);
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 32,
                )),
            IconButton(
                onPressed: () {
                  BlocProvider.of<TsbihFitchDataCubit>(context).fetchalltsbih();
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                )),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            Row(
              children: [
                Text(
                  "( سَبَّحَ لِلَّهِ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ )",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: kPrimaryFont,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: BlocBuilder<TsbihFitchDataCubit, TsbihFitchDataState>(
                builder: (context, state) {
                  List<TsbihModel> tsbih =
                      BlocProvider.of<TsbihFitchDataCubit>(context).tsbih ?? [];
                  return ListView.builder(
                    itemCount: tsbih.length,
                    itemBuilder: (context, index) {
                      return TsbihItem(
                        ts: tsbih[index],
                      );
                    },
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }

  void showsheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return BlocConsumer<AddTsbihCubitCubit, AddTsbihCubitState>(
            listener: (context, state) {
              if (state is AddTsbihFailure) {}
              if (state is AddTsbihSucess) {
                BlocProvider.of<TsbihFitchDataCubit>(context).fetchalltsbih();
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SingleChildScrollView(child: AddTsbihForm()),
              );
            },
          );
        });
  }
}
