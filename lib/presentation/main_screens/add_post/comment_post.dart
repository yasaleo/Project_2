import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../data_layer/model/get_comment.dart';
import '../../../data_layer/repositeries/repositories.dart';
import '../../constants/constants.dart';
import '../../widgets/custom_cached_image.dart';

class CommentButton extends StatefulWidget {
  CommentButton({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;

  @override
  State<CommentButton> createState() => _CommentButtonState();
}

class _CommentButtonState extends State<CommentButton> {
  TextEditingController commentController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        foregroundColor: Constants.COLOR_BLACK,
      ),
      onPressed: () {
        commentBottamSheet(context);
      },
      icon: const Icon(Ionicons.chatbox_outline),
      label: const Text("69 comments"),
    );
  }

  Future<dynamic> commentBottamSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            color: const Color.fromRGBO(0, 0, 0, 0.001),
            child: GestureDetector(
              onTap: () {},
              child: DraggableScrollableSheet(
                initialChildSize: 0.6,
                minChildSize: 0.4,
                maxChildSize: 0.75,
                builder: (_, controller) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Constants.COLOR_BLACK,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.remove,
                          color: Colors.grey[600],
                        ),
                        const Text(
                          'Comments',
                          style: Constants.TEXTSTYLE_WHITE,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Form(
                                  key: formkey,
                                  child: SizedBox(
                                    height: 50,
                                    width: 250,
                                    child: TextFormField(
                                      controller: commentController,
                                      style: const TextStyle(
                                        color: Constants.COLOR_WHITE,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      cursorColor: Constants.COLOR_WHITE,
                                      decoration: const InputDecoration(
                                        hintText: "enter comment",
                                        hintStyle: TextStyle(
                                          color: Constants.COLOR_WHITE,
                                        ),
                                        disabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "can't post empty comment";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                child: IconButton(
                                    onPressed: () async {
                                      if (formkey.currentState!.validate()) {
                                        await Repositories().addComment(
                                            id: widget.id,
                                            comment: commentController.text);

                                        commentController.clear();
                                       setState(() {
                                         
                                       });
                                      }
                                    },
                                    icon: const Icon(
                                      Ionicons.send_outline,
                                      color: Constants.COLOR_WHITE,
                                      size: 18,
                                    )),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: FutureBuilder(
                            future: Repositories().getComments(id: widget.id),
                            builder: (BuildContext context,
                                AsyncSnapshot<GetCommentModel> snapshot) {
                              if (snapshot.hasData) {
                                final comments = snapshot.requireData;
                                return ListView.builder(
                                  controller: controller,
                                  itemCount: comments.comments!.length,
                                  itemBuilder: (context, index) {
                                    final commentDetails =
                                        comments.comments![index];
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, bottom: 8),
                                      child: SizedBox(
                                        height: 45,
                                        width: double.infinity,
                                        child: ListTile(
                                          leading: ClipOval(
                                            child: Material(
                                              color: Colors.transparent,
                                              child: CustomCachedImage(
                                                imageUrl: commentDetails
                                                    .userid!.profilePic!,
                                                height: 35,
                                                width: 35,
                                                size: 35,
                                              ),
                                            ),
                                          ),
                                          title: Text(
                                            commentDetails.userid!.name!,
                                            style: Constants.TEXTSTYLE_WHITE,
                                          ),
                                          trailing: Text(
                                            commentDetails.comment!,
                                            style: Constants.TEXTSTYLE_WHITE,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                              if (!snapshot.hasData ||
                                  snapshot.data == null ||
                                  snapshot.hasError) {
                                return const Center(
                                  child: Text(
                                    "WOW such an empty",
                                    style: Constants.TEXTSTYLE_WHITE,
                                  ),
                                );
                              }
                              return Constants.CIRCULARINDICATOR;
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
