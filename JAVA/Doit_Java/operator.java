public class operator {
    public static void main(String[] args) {

        // 1. 전위형, 후위형 증감 연산자가 동일한 결과를 출력할때
        int a = 3;
        ++a;    // a값에 1을 더하라는 명령(전위형, 후위형 차이 없음)
        System.out.println(a); // 4

        int b = 3;
        b++;   // b값에 1을 더하라는 명령(전위형, 후위형 차이 없음)
        System.out.println(b); // 4


        // 2. 전위형, 후위형 증감 연산자가 서로 다른 결과를 출력할 때

        int a1 = 3;
        int b1 = ++a1;      // a1값에 1을 더하기(전위형) -> a1값을 b1값에 대입
        System.out.println(a1); // 4
        System.out.println(b1); // 4

        int a2 = 3;
        int b2 = ++a1; // a2 값에 b2 값에 대입 -> a2 값에 1을 더하기(후위형)
        System.out.println(a2); // 4
        System.out.println(b2); // 3

        // -------------------------------

        // 산술 연산자
        System.out.println(2 + 3);
        System.out.println(8 - 5);
        System.out.println(7 * 2);
        System.out.println(7 / 2);
        System.out.println(8 % 5);
        System.out.println();

        // 증감 연산자 @case1
        int value1 = 3;
        value1++;
        System.out.println(value1);

        int value2 = 3;
        ++value2;
        System.out.println(value2);
        System.out.println();

        // 증감 연산자 @case2
        int value3 = 3;
        int value4 = value3++;
        System.out.println(value3);
        System.out.println(value4);
        System.out.println();

        int value5 = 3;
        int value6 = ++value5;

        // 증감 연산자 @case3
        int value7 = 3;
        int value8 = 4;
        int value9 = 2 + value7-- + ++value8;
        System.out.println(value7);
        System.out.println(value8);
        System.out.println(value9);
    }
}