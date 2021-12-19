public class Print {
    public static void main(String[] args) {
        /* System.out.println() -> 줄 바꿔 출력하기
        주의 : "" = 문자열 / '' = 한개의 문자로 취급함 */
        System.out.println("화면 출력"); // 화면 출력
        System.out.println("화면" + "출력"); // 화면출력
        System.out.println(3.8); // 3.8
        System.out.println(3 + 5); // 8
        System.out.println("화면" + 3); // 화면3
        System.out.println(3 + 5 + "화면"); // 8화면

        // 변수 넣어 출력하기
        int a = 3;
        String b = "화면";
        System.out.println(a); // 3
        System.out.println(b); // 화면
        System.out.println(b + "출력"); // 화면출력
        System.out.println(a + b + "출력"); // 3화면출력

        // System.out.print() -> 1줄로 출력하기
        // System.out.print("화면");
        // System.out.print("출력");
        // System.out.print(3); // 화면출력3

        // System.out.printf() -> 형식대로 출력하기
        System.out.printf("%d\n", 30); // 30(10진수)
        System.out.printf("%o\n", 30); // 36(8진수)
        System.out.printf("%x\n", 30); // 1e(16진수)
        System.out.printf("%s\n", "출력"); // 출력
        System.out.printf("%f\n", 5.8); // 5.800000
        System.out.printf("%4.2f\n", 5.8); // 5.80
        System.out.printf("%d와 %4.2f\n", 4, 5.8); // 4와 5.80

    }
}
