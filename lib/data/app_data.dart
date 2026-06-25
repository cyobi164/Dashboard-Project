import '../models/receipt.dart';
import '../models/transaction.dart';

final recepits = [
  Receipt(
    shop: "7-Eleven", 
    amount: 1000, 
    date: "Mar 1", 
    receiptNo: "10012"
  ),

  Receipt(
    shop: "McDonald's", 
    amount: 3000, 
    date: "Jun 30", 
    receiptNo: "11093"
  ),

  Receipt(
    shop: "Amazon", 
    amount: 30000, 
    date: "Apr 23", 
    receiptNo: "11673"
  ),

  Receipt(
    shop: "GU", 
    amount: 3000, 
    date: "Jan 12", 
    receiptNo: "12884"
  ),
];

final total = recepits.fold(0.0, (sum, recepits) => sum + recepits.amount);


// Transaction
final transactions = [
  Transaction(title: "Food", amount: -3500, isIncome: false, date: "Jan 5"),
  Transaction(title: "Netflix", amount: -1200, isIncome: false, date: "Feb 20"),
  Transaction(title: "Salary", amount: 200000, isIncome: true, date: "Mar 25"), 
  Transaction(title: "Coffee", amount: -450, isIncome: false, date: "Mar 26"),
  Transaction(title: "Conbini", amount: -500, isIncome: false, date: "Apr 1"),
   Transaction(title: "Friend A", amount: 5000, isIncome: true, date: "Apr 10"),
];