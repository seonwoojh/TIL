class A {
    A() {
        this(3);
        System.out.println("A 생성자 1");
    }

    A(int a) {
        System.out.println("A 생성자 2");
    }
}

class B extends A {
    B() {
        this(3);
        System.out.println("B 생성자 1");
    }

    B(int a) {
        System.out.println("B 생성자 2");
    }
}

public class SuperMethod_2 {
    public static void main(String[] args) {
        // A 객체 생성
        A aa1 = new A();
        System.out.println();
        A a22 = new A(3);
        System.out.println();

        // B 객체 생성
        B bb1 = new B();
        System.out.println();
        B bb2 = new B(3);
    }    
}
