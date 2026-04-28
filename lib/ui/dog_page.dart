// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hw2/dog/bloc/dog_bloc.dart';
// import 'package:hw2/dog/bloc/dog_event.dart';
// import 'package:hw2/dog/bloc/dog_state.dart';

// class DogPage extends StatelessWidget {
//   final DogBloc dogBloc;
//   const DogPage({super.key, required this.dogBloc});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Dogs')),
//       body: BlocBuilder<DogBloc, DogState>(
//         bloc: dogBloc,
//         builder: (context, state) {
//           if (state is DogLoadingState) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (state is DogLoadedState) {
//             final dogs = state.listDogs;
//             return ListView.builder(
//               itemCount: dogs.length,
//               itemBuilder: (context, index) {
//                 final dog = dogs[index];
//                 return Card(
//                   margin: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Image.network(
//                         dog.url,
//                         fit: BoxFit.cover,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'ID: ${dog.id}',
//                           style: const TextStyle(fontSize: 12),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             );
//           }
//           if (state is DogErrorState) {
//             return Center(child: Text(state.message));
//           }
//           return const Center(child: Text('Нажмите на кнопку, чтобы загрузить собак'));
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => dogBloc.add(GetDogsEvent()),
//         child: const Icon(Icons.refresh),
//       ),
//     );
//   }
// }