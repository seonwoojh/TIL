// 클래스 생성
class B {
    int m = 3;
    int n = 4;
    void work1() {
        int k = 5;
        System.out.println(k);
        work2(3); // work2()안에 정의된 지역 변수를 스택 메모리에 추가
    }
    void work2(int i) {
        int j = 4;
        System.out.println(i + j);
    } // int i : 인수를 변수 i에 대입해 입력 매개변수로 활용
}
public class FiledComponent {
    public static void main(String[] args) {
        // 클래스로 객체 생성
        B b = new B();
        // 필드값 출력
        System.out.println(b.m);
        System.out.println(b.n);

        // 메서드 호출
        b.work1(); // work1()안에 정의된 지역 변수를 스택 메모리에 추가
    }
}
