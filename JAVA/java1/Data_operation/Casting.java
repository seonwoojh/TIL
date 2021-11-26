
public class Casting {

	public static void main(String[] args) {
		
		double a = 1.1;
		
		double b = 1; // 1은 int인데 double형태의 변수에 담길때 1이 실수형으로 자동 변환됨
		double b2 = (double) 1;
		
		System.out.println(b);
		
		// int c = 1.1; // 반대로 double형 데이터는 int로 변환될 수 없다. 변환과정에서 0.1이 손실되기 때문에!!
		
		double d = 1.1;
		int e = (int) 1.1; // 1.1을 강제로 변환(손실가능)
		
		System.out.println(e);
		
		// 1 to String
		String f = Integer.toString(1);
		System.out.println(f.getClass());
	}

}
