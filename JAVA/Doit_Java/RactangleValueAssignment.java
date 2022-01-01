public class RactangleValueAssignment {
    public static void main(String[] args) {
        // 배열 객체의 생성 및 원소 값 대입(방법 1)
        int[][] array1 = new int[2][3];
        array1[0][0] = 1;
        array1[0][1] = 2;
        array1[0][2] = 3;
        array1[1][0] = 4;
        array1[1][1] = 5;
        array1[1][2] = 6;

        System.out.println(array1[0][0] + " " + array1[0][1] + " " + array1[0][2] + " ");
        System.out.println(array1[1][0] + " " + array1[1][1] + " " + array1[1][2] + " ");
        System.out.println();

        int[][] array2 = new int[2][3];
        array2[0][0] = 1;
        array2[0][1] = 2;
        array2[0][2] = 3;
        array2[1][0] = 4;
        array2[1][1] = 5;
        array2[1][2] = 6;

        System.out.println(array2[0][0] + " " + array2[0][1] + " " + array2[0][2] + " ");
        System.out.println(array2[1][0] + " " + array2[1][1] + " " + array2[1][2] + " ");
        System.out.println();

        // 배열 객체의 생성 및 원소 값 대입(방법 2)
        int[][] array3 = new int[][]{{1, 2, 3}, {4, 5, 6}};
        System.out.println(array3[0][0] + " " + array3[0][1] + " " + array3[0][2] + " ");
        System.out.println(array3[1][0] + " " + array3[1][1] + " " + array3[1][2] + " ");
        System.out.println();

        int[][] array4;
        array4 = new int[][] {{1, 2, 3}, {4, 5, 6}};
        System.out.println(array4[0][0] + " " + array4[0][1] + " " + array4[0][2] + " ");
        System.out.println(array4[1][0] + " " + array4[1][1] + " " + array4[1][2] + " ");
        System.out.println();

        // 배열 객체의 생성 및 원소 값 대입(방법 3)
        int[][] array5 = {{1, 2, 3}, {4, 5, 6}};
        System.out.println(array5[0][0] + " " + array5[0][1] + " " + array5[0][2] + " ");
        System.out.println(array5[1][0] + " " + array5[1][1] + " " + array5[1][2] + " ");
    }
}
