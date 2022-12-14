import 'package:cliffhub/core/constants/const.dart';
import 'package:flutter/material.dart';

class ContainerListWidget extends StatelessWidget {
  const ContainerListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.separated(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.50,
                  color: kGrey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            color: kBlack,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.messenger_outline_rounded,
                            color: kBlack,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.near_me_outlined,
                            color: kBlack,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark_outline,
                        color: kBlack,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemCount: 5),
    );
  }
}
