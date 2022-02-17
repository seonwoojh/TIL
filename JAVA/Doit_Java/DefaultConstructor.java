class A {
    int m;
    void work() {
        System.out.println(m);
    }
    /*
    A() {

    } // 생성자를 포함하지 않으면 컴파일러가 기본 생성자를 자동으로 추가함
     */
}

class B {
    int m;
    void work() {
        System.out.println(m);
    }
    B() {

    } // 기본 생성자를 직접 정의
}

class C {
    int m;
    void work() {
        System.out.println(m); // 생성자로 넘어온 값
    }
    C(int a) {
        m = a;
    } /* 입력매개변수를 포함하고 있는 생성자 정의
        입력매개변수로 전달된 값으로 필드 초기화
    */
}
public class DefaultConstructor {
    public static void main(String[] args) {

        // 클래스의 객체 생성
        A a = new A(); // 컴파일러가 자동으로 추가한 기본 생성자를 호출해 객체 생성
        B b = new B(); // 직접 정의한 기본 생성자를 호출해 객체 생성
//        C c = new C(); // 기본 생성자 호출 불가능
        C c =  new C(3); // 직접 정의한 생성자를 호출해 객체 생성

        // 메서드 호출
        a.work();
        b.work();
        c.work();
    }
}
