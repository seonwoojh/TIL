class Animal {
    void cry() {}
}

class Bird extends Animal {
    @Override
    void cry() {
        System.out.println("짹짹");
    }
}

class Cat extends Animal {
    @Override
    void cry() {
        System.out.println("야옹");
    }
}

class Dog extends Animal {
    @Override
    void cry() {
        System.out.println("멍멍");
    }
}

public class MethodOverriding_2 {
    public static void main(String[] args) {
        // 각각의 타입으로 선언 + 각각의 타입으로 생성
        Animal aa = new Animal();
        Bird bb = new Bird();
        Cat cc = new Cat();
        Dog dd = new Dog();
        aa.cry();
        bb.cry();
        cc.cry();
        dd.cry();
        System.out.println();

        // Animal 타입으로 선언 + 자식 클래스 타입으로 생성
        Animal ab = new Bird();
        Animal ac = new Cat();
        Animal ad = new Dog();
        ab.cry();
        ac.cry();
        ad.cry();
        System.out.println();

        // 배열로 관리
        Animal[] animals = {ab, ac, ad};
        for(Animal animal : animals) {
            animal.cry();
        }
    }

