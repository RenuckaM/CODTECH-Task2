import 'package:flutter/material.dart';
import 'package:notes_app_codetech/types/note.dart';

class NoteScreen extends StatefulWidget {
  static const route = '/note';
  final Note? note;
  const NoteScreen({super.key, this.note});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  bool canAnimate = false;
  Note? currentNote;

  saveChanges() async {
    await currentNote!.save();
    Navigator.pop(context);
  }

  deleteNote() async {
    await currentNote!.delete();
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    if (widget.note == null) {
      currentNote = Note(title: 'Untitled', content: '', tag: '');
    } else {
      currentNote = widget.note;
    }
    setState(() {});
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        canAnimate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Positioned(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                children: [
                  AnimatedOpacity(
                    curve: Curves.ease,
                    opacity: canAnimate ? 1 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Quick Thoughts',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Expanded(child: Container()),
                          widget.note != null
                              ? Row(
                                  children: [
                                    InkWell(
                                      onTap: deleteNote,
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                  ],
                                )
                              : Container(),
                          InkWell(
                            onTap: saveChanges,
                            child: const Icon(
                              Icons.check,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Text(
                          currentNote?.getTimestamp() ?? '',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            // const Text(
                            //   "#",
                            //   style: TextStyle(
                            //     fontSize: 14,
                            //     color: Colors.black,
                            //   ),
                            // ),
                            const SizedBox(width: 8),
                            Container(
                              width: 120,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextFormField(
                                onChanged: (value) => setState(() {
                                  currentNote?.tag = value;
                                }),
                                initialValue: currentNote?.tag ?? '',
                                cursorColor: Colors.black,
                                decoration: const InputDecoration(
                                  hintText: 'Tag',
                                  hintStyle: TextStyle(color: Colors.black54),
                                  border: InputBorder.none,
                                ),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      onChanged: (value) => setState(() {
                        currentNote?.title = value;
                      }),
                      initialValue: currentNote?.title ?? '',
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Title',
                        hintStyle: const TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      onChanged: (value) => setState(() {
                        currentNote?.content = value;
                      }),
                      initialValue: currentNote?.content ?? '',
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Note description',
                        hintStyle: const TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
              scrollDirection: Axis.vertical,
            ),
            bottom: 0,
            left: 0,
            top: 0,
            right: 0,
          ),
        ],
      ),
    );
  }
}
