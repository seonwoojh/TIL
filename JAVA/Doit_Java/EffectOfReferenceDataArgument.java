// 참조 자료형 매개변수 값의 변화
import java.util.Arrays;

public class EffectOfReferenceDataArgument {
    public static void main(String[] args) {
        int[] array = new int[] {1, 2, 3};
        modifyData(array);
        printArray(array);
    }

    public static void modifyData(int[] a) {
        a[0] = 4;
        a[1] = 5;
        a[2] = 6;
    }
    public static void printArray(int[] a) {
        System.out.println(Arrays.toString(a));
    }
}
