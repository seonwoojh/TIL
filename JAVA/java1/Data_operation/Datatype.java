public class Datatype{
	public static void main(String[] args) {
		System.out.println(6); // Number
		System.out.println("six"); // String
		
		System.out.println("6"); // String 6
		
		System.out.println(6+6); // 12
		System.out.println("6"+"6"); // 66 (더하기가 아닌 문자열 결합 연산자)
		
		System.out.println(6 * 6); // 36
//		System.out.println("6" * "6"); // 문자열타입은 곱하기 연산 불가
		
		System.out.println("1111", length()); // 4
//		System.out.println(1111, length()); // 숫자의 길이 표현 불가
	}
}