// import 'package:flutter/material.dart';

// class TicketDetailsPage extends StatelessWidget {
//   const TicketDetailsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Ticket'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Image.asset('assets/event_image.png',
//                 height: 150), // Replace with event image.
//             const SizedBox(height: 20),
//             const EventDetailRow(
//                 label: 'Event', value: 'California Art Festival 2023'),
//             const EventDetailRow(label: 'Date', value: 'March 19, 2023'),
//             const EventDetailRow(label: 'Time', value: '10:00 PM - 12:00 PM'),
//             const EventDetailRow(label: 'Ticket Set', value: 'Regular x1'),
//             const EventDetailRow(label: 'Venue', value: 'The Living'),
//             const SizedBox(height: 20),
//             Expanded(
//               child: Center(
//                 child: Container(
//                   height: 150,
//                   width: double.infinity,
//                   color: Colors.grey[300], // Replace with QR/Barcode widget.
//                   child: const Center(child: Text('QR Code Placeholder')),
//                 ),
//               ),
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Download image logic
//                     },
//                     child: const Text('Download Image'),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Share QR logic
//                     },
//                     child: const Text('Share QR'),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class EventDetailRow extends StatelessWidget {
//   final String label, value;

//   const EventDetailRow({super.key, required this.label, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
//           Text(value),
//         ],
//       ),
//     );
//   }
// }
