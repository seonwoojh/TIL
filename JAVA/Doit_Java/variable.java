public class variable {
    public static void main(String[] args) {
        // 변수
        boolean aBcD;       // 대문자는 새로운 단어의 앞 글자에 사용 권장
        byte 가나다;       // 한글로 작성 가능(권장하지 않음)
        short _abcd;
        char $ab_cd;
        // int 3abcd;       // 숫자는 이름 맨 앞에 올 수 없음.
        long abcd3;
        // float int;       // 자바 예약어는 사용할 수 없다.
        double main;
        // int my Work;     // 스페이스, 특수 키는 사용할 수 없음.
        String myClassName;
        int ABC;        //  전부 대문자로 작성(권장하지 않음)

        // 상수
        final double PI;
        final int MY_DATA;
        final float myData;     // 소문자 사용(권장하지 않음)

        // ----------------------------------------------------------------

        // 변수의 생존 기간

        int value1 = 3; // 변수 value1이 생성되는 시점
        {
            int value2 = 5; // 변수 value2가 생성되는 시점
            System.out.println(value1);`
            System.out.println(value2);
        } // }가 닫히는 부분에서 변수 value2가 사라짐
        System.out.println(value1);
//        System.out.println(value2);     // 변수가 사라져서 오류발생
    } // 변수 value1이 사라지는 시점
}
