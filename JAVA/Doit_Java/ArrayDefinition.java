public class ArrayDefinition {
    public static void main(String[] args) {
        // 배열 선언 방법 1
        int[] array1 = new int[3];
        int[] array2;
        array2 = new int[3]; // 자료형 뒤에 대괄호 표기

        // 배열 선언 방법 2
        int array3[] = new int[3];
        int array4[];
        array4 = new int[3]; // 변수명 뒤에 대괄호 표기

        // 다양한 배열 선언(기본 자료형 배열, 참조 자료형 배열)
        boolean[] array5 = new boolean[3];
        int[] array6 = new int[5];
        double[] array7 = new double[7];
        String[] array8 = new String[9];
    }
}
