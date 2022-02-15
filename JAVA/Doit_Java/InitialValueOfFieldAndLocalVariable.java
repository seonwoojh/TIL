class C {
    boolean m1; // 필드는 초기화하지 않아도 값이 강제 초기화돼 출력 가능
    int m2;
    double m3;
    String m4;
    void printFieldValue() {
        System.out.println(m1);
        System.out.println(m2);
        System.out.println(m3);
        System.out.println(m4);
    }
    void printLocalVariable() {
        int k;
//            System.out.println(k); 지역 변수를 초기화하지 않아 오류 발생
    }
}
public class InitialValueOfFieldAndLocalVariable {
    public static void main(String[] args) {
        // 클래스를 활용해 객체 생성
        C c = new C();
        // 객체 활용
        c.printFieldValue();
    }

}
