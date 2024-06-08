import 'package:flutter/material.dart';
import 'package:flutter_weather/components/button_widget.dart';

class SearchWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final VoidCallback onTap;

  const SearchWidget({super.key, required this.onChanged, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 65,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'City'),
            onChanged: onChanged,
          ),
          const SizedBox(
            height: 16,
          ),
          ButtonWidget(
            isActive: true,
            text: "Search",
            onTap: onTap,
          )
        ],
      ),
    );
  }
}
