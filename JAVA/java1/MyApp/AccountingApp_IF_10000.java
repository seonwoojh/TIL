
public class AccountingApp_IF_10000 {

	public static void main(String[] args) {
		
		// variable
		double valueOfSupply = Double.parseDouble(args[0]);
		double vatRate = 0.1;
		double vat = valueOfSupply * vatRate;
		double expenseRate = 0.3;
		double expense = valueOfSupply * expenseRate;
		double Income = valueOfSupply - expense;
		double total = valueOfSupply + vat;
		double dividend1 = Income * 1;
		double dividend2 = Income * 0;
		double dividend3 = Income * 0;
		
		
		System.out.println("Value of supply : " + valueOfSupply);
		System.out.println("VAT : " + vat);
		System.out.println("Total : " + total);
		System.out.println("Expense : " + expense);		
		System.out.println("Income : " + Income);
		System.out.println("Dividend 1 : " + dividend1);
		System.out.println("Dividend 2 : " + dividend2);
		System.out.println("Dividend 3 : " + dividend3);
	}

}
