public class SwitchControlStatement {
    public static void main(String[] args) {

        // break가 포함되지 않았을 때
        int value1 = 2;
        switch (value1) {
            case 1:
                System.out.println("A");
            case 2:
                System.out.println("B");
            case 3:
                System.out.println("C");
            default:
                System.out.println("D");
        }
        System.out.println();

        // break가 포함되어 있을 때
        int value2 = 2;
        switch (value2) {
            case 1:
                System.out.println("A");
                break;
            case 2:
                System.out.println("B");
                break;
            case 3:
                System.out.println("C");
                break;
            default:
                System.out.println("D");
                break;
        }
        System.out.println();

        // if else if else 구문으로 변환
        if (value1 == 1) {
            System.out.println("A");
        }
        else if (value2 == 2) {
            System.out.println("B");
        }
        else if (value1 == 3) {
            System.out.println("C");
        }
        else {
            System.out.println("D");
        }
    }
}
