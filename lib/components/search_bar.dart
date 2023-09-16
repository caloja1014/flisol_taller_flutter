import 'package:flutter/material.dart';

class SearchBarCustom extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onSearch;
  bool isDisabled;
  SearchBarCustom({
    super.key,
    required this.controller,
    required this.onSearch,
    this.isDisabled = false,
  });

  @override
  State<SearchBarCustom> createState() => _SearchBarCustomState();
}

class _SearchBarCustomState extends State<SearchBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: TextField(
          enabled: !widget.isDisabled,
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.left,
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 0,
            ),
            hintText: 'Busca tu pokemon...',
            prefixIcon: IconButton(
              onPressed: () {
                final text = widget.controller.text;
                if (text.isNotEmpty) {
                  widget.onSearch(widget.controller.text);
                }
              },
              icon: const Icon(Icons.search),
            ),
            suffixIcon: IconButton(
              alignment: Alignment.center,
              onPressed: () {
                widget.controller.clear();
              },
              icon: const Icon(Icons.clear),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onSubmitted: (string) {
            if (string.isNotEmpty) {
              widget.onSearch(string);
            }
          },
        ));
  }
}
