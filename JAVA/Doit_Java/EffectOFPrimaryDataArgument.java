public class EffectOFPrimaryDataArgument {
    public static void main(String[] args) {
        int a = 3; // main() 함수의 지역 변수 a
        int result1 = twice(a);
        System.out.println(result1);

        int result2 = twice(a);
        System.out.println(result2);
        System.out.println(a);
    }
    public static int twice(int a) {
        a *= 2; // a = twice() 메서드의 지역변수 a
        return a;
    }
}
