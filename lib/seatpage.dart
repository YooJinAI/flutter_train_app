import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SeatPage extends StatefulWidget {
  final String departureStation;
  final String arrivalStation;

  const SeatPage({
    super.key,
    required this.departureStation,
    required this.arrivalStation,
  });

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  Set<String> selectedSeats = {};

  void _showBookingConfirmDialog() {
    if (selectedSeats.isEmpty) return;

    final selectedSeatsList = selectedSeats.toList()..sort();
    final seatText = selectedSeatsList.join(', ');

    showCupertinoDialog(
      context: context,
      builder:
          (context) => CupertinoAlertDialog(
            title: const Text('예매 하시겠습니까?'),
            content: Text('좌석: $seatText'),
            actions: [
              CupertinoDialogAction(
                child: const Text('취소', style: TextStyle(color: Colors.red)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                child: const Text('확인', style: TextStyle(color: Colors.blue)),
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
            ],
          ),
    );
  }

  Widget _buildSeat(String seatNumber) {
    final isSelected = selectedSeats.contains(seatNumber);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedSeats.remove(seatNumber);
          } else {
            selectedSeats.add(seatNumber);
          }
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('좌석 선택'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.departureStation,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(Icons.arrow_circle_right_outlined, size: 30),
                    ),
                    Text(
                      widget.arrivalStation,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text('선택됨'),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text('선택안됨'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50,
                        height: 30,
                        child: const Center(
                          child: Text('A', style: TextStyle(fontSize: 18)),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 30,
                        child: const Center(
                          child: Text('B', style: TextStyle(fontSize: 18)),
                        ),
                      ),
                      const SizedBox(width: 50),
                      SizedBox(
                        width: 50,
                        height: 30,
                        child: const Center(
                          child: Text('C', style: TextStyle(fontSize: 18)),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 30,
                        child: const Center(
                          child: Text('D', style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    itemCount: 20,
                    itemBuilder: (context, rowIndex) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildSeat('${rowIndex + 1}A'),
                            const SizedBox(width: 4),
                            _buildSeat('${rowIndex + 1}B'),
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: Center(
                                child: Text(
                                  '${rowIndex + 1}',
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                            _buildSeat('${rowIndex + 1}C'),
                            const SizedBox(width: 4),
                            _buildSeat('${rowIndex + 1}D'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                    selectedSeats.isNotEmpty ? _showBookingConfirmDialog : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  '예매 하기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
