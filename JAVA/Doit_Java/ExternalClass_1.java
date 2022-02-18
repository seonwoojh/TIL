class A {
    int m = 3;
    int n = 4;

    void print() {
        System.out.println(m + "," + n);
    }
} // 외부 클래스 A는 public 선언 불가능

public class ExternalClass_1 {
    public static void main(String[] args) {
        A a = new A();
        a.print(); // public 여부와 관계없이 같은 패키지 내에서는 객체의 생성 및 활용 불가능
    }
}
