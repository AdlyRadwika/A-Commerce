import 'package:flutter/material.dart';

class BuyerInfo extends StatelessWidget {
  final String title;
  final String icon;
  final String iconLabel;
  final String iconDetail;
  final String userName;
  final String userDetail;


  const BuyerInfo({
    Key? key,
    required this.title,
    required this.icon,
    required this.iconLabel,
    required this.iconDetail,
    required this.userName,
    required this.userDetail
  }) : super(key: key);

  getIconFromString(String icon) {
    switch(icon){
      case 'home':
        return const Icon(
          Icons.home,
          size: 40,
        );
      case 'credit card':
        return const Icon(
          Icons.credit_card,
          size: 40,
        );
      default:
        return const Icon(
          Icons.question_mark,
          size: 40,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Shipping to",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8,),
        Container(
          padding: const EdgeInsets.all(8),
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: Colors.black,
                  width: 1
              )
          ),
          child: Row(
            children: [
              getIconFromString(icon),
              const SizedBox(width: 8,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      iconLabel,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(iconDetail),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(userDetail)
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
