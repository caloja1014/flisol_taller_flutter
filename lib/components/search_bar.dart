import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onSearch;
  const SearchBar({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: TextField(
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