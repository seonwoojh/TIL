import java.util.Arrays;

public class ModificationOfStringData {
    public static void main(String[] args) {
        // 문자열 수정
        String str1 = new String("안녕");
        String str2 = str1;

        str1 = "안녕하세요"; // 새로운 객체 생성

        System.out.println(str1);
        System.out.println(str2);


        // 배열 참조 자료형

        int[] array1 = new int[] {3, 4, 5};
        int[] array2 = array1;
        array1[0] = 6;
        array1[1] = 7;
        array1[2] = 8; // array2가 가르키는 값도 변경된다.

        System.out.println(Arrays.toString(array1));
        System.out.println(Arrays.toString(array2));

    }
}
