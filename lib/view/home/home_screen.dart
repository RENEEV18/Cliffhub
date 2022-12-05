import 'package:cliffhub/core/constants/const.dart';
import 'package:cliffhub/view/home/widgets/container_list.dart';
import 'package:cliffhub/view/login_screen/widgets/maintext_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
           
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                 
                 const MainTextWidget(),
                  IconButton(onPressed: (){}, 
                  icon: const Icon(Icons.message,color: kWhite,),),
                ],
              ),
              kSize,
              SizedBox(
                height: 70,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                    );
                  },
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              kSize,
              const ContainerListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}