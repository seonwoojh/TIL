
public class Casting {

	public static void main(String[] args) {
		
		double a = 1.1;
		
		double b = 1; // 1�� int�ε� double������ ������ ��涧 1�� �Ǽ������� �ڵ� ��ȯ��
		double b2 = (double) 1;
		
		System.out.println(b);
		
		// int c = 1.1; // �ݴ�� double�� �����ʹ� int�� ��ȯ�� �� ����. ��ȯ�������� 0.1�� �սǵǱ� ������!!
		
		double d = 1.1;
		int e = (int) 1.1; // 1.1�� ������ ��ȯ(�սǰ���)
		
		System.out.println(e);
		
		// 1 to String
		String f = Integer.toString(1);
		System.out.println(f.getClass());
	}

}
