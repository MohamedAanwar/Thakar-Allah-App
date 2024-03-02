import 'package:athkar/components/custom_button.dart';
import 'package:athkar/components/custom_textfield.dart';
import 'package:athkar/const.dart';
import 'package:athkar/cubits/cubit/AddTsbihCubit/add_tsbih_cubit_cubit.dart';
import 'package:athkar/models/tsbih_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTsbihForm extends StatefulWidget {
  const AddTsbihForm({super.key});

  @override
  State<AddTsbihForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddTsbihForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidatemode = AutovalidateMode.disabled;
  String? subtitle;
  int? tittle;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Form(
        key: formkey,
        autovalidateMode: autovalidatemode,
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "اضافة تسبيح",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: kPrimaryFont,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextfield(
              onSaved: (value) {
                subtitle = value;
              },
              maxlines: 3,
              conpadver: 12,
              conpadhor: 15,
              labeltext: "مسمي التسبيح",
            ),
            SizedBox(
              height: 18,
            ),
            CustomTextfield(
              keyboardType: TextInputType.number,
              onSaved: (p0) {
                tittle = int.parse(p0!);
              },
              maxlines: 1,
              conpadver: 25,
              conpadhor: 15,
              labeltext: "عدد مرات التسبيح",
            ),
            SizedBox(
              height: 30,
            ),
            BlocBuilder<AddTsbihCubitCubit, AddTsbihCubitState>(
              builder: (context, state) {
                return CustomButton(
                  isloading: state is AddTsbihLoading,
                  text: "اضافة",
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      TsbihModel tsbih =
                          TsbihModel(count: tittle!, content: subtitle!);
                      BlocProvider.of<AddTsbihCubitCubit>(context)
                          .addTsbih(tsbih);
                    } else {
                      autovalidatemode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
