class A {
    void print() {
        System.out.println("A 클래스");
    }
}

class B extends A {
    @Override
    void print() {
        System.out.println("B 클래스");
    }
}

public class MethodOverriding_1 {
    public static void main(String[] args) {
        // A 타입 / A 생성자
        A aa = new A();
        aa.print();

        // B 타입 / B 생성자
        B bb = new B();
        bb.print();

        // A 타입 / B 생성자
        A ab = new B();
        ab.print();
    }
}
