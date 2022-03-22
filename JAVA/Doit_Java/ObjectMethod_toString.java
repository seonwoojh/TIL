class A {   // extends Object(컴파일러에 따라 자동으로 추가)
    int a = 3;
    int b = 4;
}

class B {
    int a = 3;
    int b = 4;

    public String toString() {
        return "필드값(a, b) = " + a + " " + b;
    }
}

public class ObjectMethod_toString {
    public static void main(String[] args) {
        // 객체 생성
        A a = new A();
        B b = new B();

        // 메서드 호출
        System.out.println("%x\n", a.hashCode());   // hashcode를 16진수로 표현
        System.out.println(a.toString());
        System.out.println(b);
    }
}
