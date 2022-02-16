import java.util.*;

public class ArrayArgumentMethod {
    public static void main(String[] args) {
        // 배열을 입력매개변수로 하는 메서드 호출
        int[] a = new int[] {1, 2, 3};
        printArray(a);
        printArray(new int[] {1, 2, 3});
        // printArray({1, 2, 3}); // 오류 발생
    }

    public static void printArray(int[] a) {
        System.out.println(Arrays.toString(a));
    }
}
