import java.util.Arrays;
public class ReadArrayData {
    public static void main(String[] args) {
        int[] array = new int[] {3, 4, 5, 6, 7};

        // 배열의 길이 구하기
        System.out.println(array.length);

        // 출력하기 1
        System.out.println(array[0] + " ");
        System.out.println(array[1] + " ");
        System.out.println(array[2] + " ");
        System.out.println(array[3] + " ");
        System.out.println(array[4] + " "); // 배열의 인덱스 번호를 사용해 배열의 모든 원소 값을 1개씩 출력

        // 출력하기 2
        for(int i = 0; i < array.length; i++) {
            System.out.println(array[i] + " ");
        } // for문 사용
        System.out.println();

        // 출력하기 3
        for(int k: array) {
            System.out.println(k + " ");
        } // for - each문 사용
        System.out.println();

        // 출력하기 4
        System.out.println(Arrays.toString(array)); // Arrays 클래스의 toString() 메서드 이용
    }
}
