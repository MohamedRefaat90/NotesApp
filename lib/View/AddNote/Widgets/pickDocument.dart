import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../AddNote_cubit/add_note_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class pickDocument extends StatefulWidget {
  const pickDocument({
    super.key,
  });

  @override
  State<pickDocument> createState() => _pickDocumentState();
}

class _pickDocumentState extends State<pickDocument> {
  List<String>? docs = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.pick_doc,
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                MaterialButton(
                  onPressed: () async {
                    docs = await BlocProvider.of<AddNoteCubit>(context)
                        .pickDocument();

                    print(docs);
                  },
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    AppLocalizations.of(context)!.add_doc,
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ],
            ),
            SizedBox(height: 10),
            docs!.isNotEmpty
                ? SizedBox(
                    height: 60,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: docs!.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      itemBuilder: (context, index) => Container(
                        child: Image.asset(
                            BlocProvider.of<AddNoteCubit>(context)
                                .imageofDoc(docs![index])),
                      ),
                    ),
                  )
                : Container()
          ],
        );
      },
    );
  }
}
