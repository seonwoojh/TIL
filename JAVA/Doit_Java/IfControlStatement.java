public class IfControlStatement {
    public static void main(String[] args) {

        // 1. 단일 if 구문
        if (5 > 3) {
            System.out.println("출력 1"); // 실행됨.

        }
        if (5 < 3) {
            System.out.println("출력 2"); // 실행 안됨.
        }
        {
            int a = 3;
            if (a == 3) {
                System.out.println("출력 3"); // 실행됨.
            }

            boolean b = false;
            if (b) {
                System.out.println("출력 4"); // 실행 안됨.
            }
        }
        // 2. if-else 구문
        if (5 > 3) {
            System.out.println("실행 1"); // 실행됨
        }
        else {
            System.out.println("실행 2"); // 실행 안됨.
        }
        {
            int a, b;
            a = 5; b = 0;
            if (a > 5) {
                b = 10;
            }
            else {
                b = 20;
            }
            System.out.println(b); // 20
        }
        // 삼항 연산자로 변환
        {
            int a, b;
            a = 5; b = 0;
            b = (a > 5) ? 10 : 20;
            System.out.println(b); // 20
        }
        {
            // 90 이상 : A, 80 이상 ~ 90미만 : B , 70 이상 ~ 80미만 : C, 70 미만 : F
            int a = 85;
            if (a >= 90) {
                System.out.println("A학점");
            } else if (a >= 80) {
                System.out.println("B학점");
            } else if (a >= 70) {
                System.out.println("C학점");
            }
            else {
                System.out.println("F학점"); // 코드는 순서대로 실행되고 조건을 만족하면 if문에서 탈출하고 뒤에 코드는 읽지 않기때문에
                                            // 코드 순서에 유의해야함.
            }
        }
    }
}
