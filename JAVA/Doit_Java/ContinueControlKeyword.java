public class ContinueControlKeyword {
    public static void main(String[] args) {
        // 단일 반복문에서 continue 사용
        for (int i = 0; i < 10; i ++) {
            continue;
            // System.out.println(i + " "); // unreachable code 오류 발생
        }

        for (int i = 0; i < 10; i++) {
            System.out.print(i + " ");
            continue;
        }
        System.out.println();

        for (int i = 0; i <10; i++) {
            if (i == 5) {
                continue;
            }
            System.out.print(i + " ");
        }
        System.out.println();

        // 다중 반복문에서 continue 사용
        for (int i = 0; i < 5; i ++) {
            for (int j = 0; j < 5; j++) {
                if(j == 3) {
                    continue;
                }
                System.out.println(i + ", " + j);
            }
        }
        System.out.println();

        POS1: for (int i = 0; i < 5; i++) {
            for (int j = 0; j <5; j++) {
                if (j == 3) {
                    continue POS1;
                }
                System.out.println(i + ", " + j);
            }
        }
    }
}
