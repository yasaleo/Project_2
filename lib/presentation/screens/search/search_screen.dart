import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_2/dataLayer/repositories.dart';

import '../../../dataLayer/model/search_model.dart';
import '../../constants/constants.dart';
import '../../widgets/animated_follow_button.dart';
import '../../widgets/custom_cached_image.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<SearchScreen> {
  File? finalImage;

  @override
  Widget build(BuildContext context) {
    // final desize = MediaQuery.of(context).size;
    ValueNotifier<List<SearchModel>> searchlists = ValueNotifier([]);
    return Scaffold(
      backgroundColor: Constants.COLOR_SCAFFOLD_BACKGROUND,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Constants.COLOR_SCAFFOLD_BACKGROUND,
        title: SizedBox(
          height: 50,
          child: TextFormField(
            cursorColor: Constants.COLOR_WHITE,
            style: Constants.TEXTSTYLE_WHITE,
            onChanged: (value) async {
              final searchQueries =
                  await Repositories().searchProfile(query: value);

              searchlists.value = searchQueries;

              log(searchQueries.length.toString());
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide(color: Constants.COLOR_WHITE)),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(color: Constants.COLOR_WHITE),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(color: Constants.COLOR_WHITE),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(color: Constants.COLOR_WHITE),
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child:
            // searchlists.isEmpty

            ValueListenableBuilder(
          valueListenable: searchlists,
          builder: (context, value, child) {
            if (value.isNotEmpty) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final user = value[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(
                        user.name!,
                        style: Constants.TEXTSTYLE_WHITE,
                      ),
                      trailing: AnimatedFollwButton(
                        onClick: () {
                          Repositories().folowRequest(id: user.id!);
                          print("ccccllliiiiiccckkkkkeeeedddd");
                        },
                      ),
                      leading: ClipOval(
                        child: Material(
                          color: Colors.transparent,
                          child: CustomCachedImage(
                            imageUrl: user.profilePic ??
                                "https://freesvg.org/img/abstract-user-flat-4.png",
                            height: 50,
                            width: 50,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: searchlists.value.length,
              );
            }
            return const Center(
              child: Text(
                "type to search",
                style: Constants.TEXTSTYLE_WHITE,
              ),
            );
          },
        ),
      ),
    );
  }
}

// class SimpleCustomtextfield extends StatelessWidget {
//   SimpleCustomtextfield({
//     Key? key,
//   }) : super(key: key);
//   // Function(String) onChanged;
//   List<SearchModel> searchlists = [];
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       cursorColor: Constants.COLOR_WHITE,
//       style: Constants.TEXTSTYLE_WHITE,
//       onChanged: (value) async {
//         final searchQueries = await Repositories().searchProfile(query: value);
//         log(searchQueries.length.toString());
//       },
//       decoration: const InputDecoration(
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(15),
//             ),
//             borderSide: BorderSide(color: Constants.COLOR_WHITE)),
//         disabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(15),
//           ),
//           borderSide: BorderSide(color: Constants.COLOR_WHITE),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(15),
//           ),
//           borderSide: BorderSide(color: Constants.COLOR_WHITE),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(15),
//           ),
//           borderSide: BorderSide(color: Constants.COLOR_WHITE),
//         ),
//       ),
//     );
//   }
// }
