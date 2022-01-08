public class ReadArrayData_2D {
    public static void main(String[] args) {
        // 2차원 데이터의 배열의 길이
        int[][] array1 = new int[2][3];
        System.out.println(array1.length); // 행 갯수
        System.out.println(array1[0].length); // 첫 번째 행의 열 갯수
        System.out.println(array1[1].length); // 두 번째 행의 열 갯수
        System.out.println();

        int[][] array2 = new int[][] {{1, 2}, {3, 4, 5}};
        System.out.println(array2.length);
        System.out.println(array2[0].length);
        System.out.println(array2[1].length);
        System.out.println();

        // 2차원 배열의 출력 방법
        System.out.println(array2[0][0] + " ");
        System.out.println(array2[0][1] + " ");
        System.out.println();
        System.out.println(array2[1][0] + " ");
        System.out.println(array2[1][1] + " ");
        System.out.println(array2[1][2]);
        System.out.println();

        for(int i = 0; i < array2.length; i++) {
            for(int j = 0; j <array2.length; j++) {
                System.out.println(array2[i][j] + " ");
            } // 2중 for 문 사용
            System.out.println();
        }
        System.out.println();

        for(int[] array: array2) {
            for(int k :array) {
                System.out.println(k + " ");
            }
            System.out.println();
        }
    }
}
