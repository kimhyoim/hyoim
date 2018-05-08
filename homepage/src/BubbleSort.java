import java.util.Scanner;

public class BubbleSort {

	public static void main(String[] args) {

		int s[] = new int[5];

		Scanner sc = new Scanner(System.in);

		System.out.println("5개 숫자를 입력해주세요.");
		for (int i = 0; i < s.length; i++) {
			s[i] = sc.nextInt();
		}

		for (int k = 0; k < s.length; k++) {
			for (int j = 0; j < s.length - 1; j++) {
				if (s[j] > s[j + 1]) {
					int tmp = 0;
					tmp = s[j];
					s[j] = s[j + 1];
					s[j + 1] = tmp;
				}
			}
		}
		for (int a = 0; a < s.length; a++) {
			System.out.print(s[a]);
		}

	}

}
