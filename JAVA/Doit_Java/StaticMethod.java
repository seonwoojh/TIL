class A {
    void abc() {    // 인스턴스 메서드
        System.out.println("instance 메서드");
    }
    static void bcd () {    // 정적 메서드
        System.out.println("static 메서드");
    }
}
public class StaticMethod {
    public static void main(String[] args) {
        // 인스턴스 메서드 활용(객체를 생성한 후 사용 가능)
        A a1 = new A();
        a1.abc();

        // 정적 메서드 활용

        // 1. 클래스명으로 바로 접근해 사용
        A.bcd();

        // 2. 객체를 생성한 후 사용(권장하지 않음)
        A a2 = new A();
        a2.bcd();
    }
}
