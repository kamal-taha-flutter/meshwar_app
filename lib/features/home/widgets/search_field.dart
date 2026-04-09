import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
                              elevation: 2,
                              shadowColor: Colors.grey,
                              borderRadius: BorderRadius.circular(16),

                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Looking for shoes',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  prefixIcon: Icon(
                                    CupertinoIcons.search,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            );
  }
}

