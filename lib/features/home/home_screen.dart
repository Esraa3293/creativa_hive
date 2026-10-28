import 'package:creativa_storage/features/home/cubit/home_cubit.dart';
import 'package:creativa_storage/features/home/cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Enter your name"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<HomeCubit>().createName(controller.text);
                  },
                  child: Text("add"),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<HomeCubit>().getName();
                  },
                  child: Text("get"),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<HomeCubit>().deleteName();
                  },
                  child: Text("delete"),
                ),
                BlocBuilder<HomeCubit, HomeStates>(
                  builder: (context, state) {
                    if(state is HomeDataLoadedState){
                      return Text(state.name,style: TextStyle(
                        fontSize: 30
                      ),);
                    }
                    return Text("",style: TextStyle(fontSize: 30),);
                  }
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
