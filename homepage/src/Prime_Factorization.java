import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Prime_Factorization {
	
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int n;//입력받는 값, 2이하면 프로그램 종료, 1000이상이면 다시 입력
		int c;//인수를 저장하는 배열의 인덱스 관리, 만약 c가 0이면 1외에 인수가 없다는 뜻으로 소수
		int k;//n를 2부터 나누는 값
		int y;//2X2X 이런 형태를 만들어주기 위한 반복문과 반복문 안에서의 인덱스 관여
		
		
		int s[] = new int[10];//인수를 저장할 배열
		
		while(true) {
			n = sc.nextInt();
			
			if(n<2) {
				System.out.println("프로그램 종료");
				break;
			} 
			
			if(n>1000) {
				System.out.println("1000이하의 숫자 입력");
				continue;
			}
			c=-1;//do에서 자기자신으로 무조건 한번은 나눠지기때문에 -1로 설정해야 자기자신을 인덱스 0번에 저장가능하다
			
			do{
				k=2;
				while(n%k != 0) {
					k++;
				}
				c++;
				s[c] = k;
				n = n/k;
				
			}while(n!=1);
			
			if(c==0) {
				System.out.println("소수입니다.");
			} else {
				for(y=0; y<c; y++) {
					System.out.print(s[y]+"X");
				}
				System.out.println(s[c]);
			}
		}
		sc.close();
	}

}
