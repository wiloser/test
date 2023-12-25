import 'package:flutter/material.dart';

class OptionList extends StatelessWidget {
  final List<CustomOptionCard> cards;

  const OptionList({
    super.key,
    required this.cards,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: cards.length, // 列表项的总数
      itemBuilder: (BuildContext context, int index) {
        return cards[index];
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }
}

class CustomOptionCard extends StatelessWidget {
  final bool activate;
  final Color activateColor;
  final Function() onTap;

  const CustomOptionCard({
    super.key,
    required this.activate,
    required this.activateColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          padding: const EdgeInsets.only(right: 10, left: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(249, 134, 58, 1), // 边框颜色
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
            color: activate
                ? const Color.fromRGBO(245, 218, 155, 0.5)
                : Colors.transparent,
          ),
          child: const Row(
            children: [
              Text('A   '),
              Text('网络层'),
            ],
          ),
        ));
  }
}
