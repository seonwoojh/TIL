// 클래스 내부에서 필드, 메서드에 앞에 붙는 자동으로 붙는 this 키워드
class A {
    int m;
    int n;
    void init(int a, int b) {
        int c;
        c = 3;
        this.m = a;     // this.를 생략했을 때 자동으로 추가
        this.n = b;     // this.를 생략했을 때 자동으로 추가
    }
    void work() {
        this.init(2, 3);        // this.를 생략했을 때 자동으로 추가
    }
}

public class ThisKeyword_1 {
    public static void main(String[] args) {
        // 클래스 객체 생성
        A a = new A();
        // 메서드 호출 / 필드값 활용
        a.work();
        System.out.println(a.m);
        System.out.println(a.n);
    }
}
