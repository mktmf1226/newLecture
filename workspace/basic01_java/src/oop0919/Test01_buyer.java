package oop0919;

public class Test01_buyer {

	public static void main(String[] args) {
		//상품 구매 및 반품 프로그램
		
		
		//1)상품만들기
		//->Product	  부모 클래스 (상품명, 상품가격)
		//->SmartTV	  자식 클래스
		//->Notebook  자식 클래스
		//->HandPhone 자식 클래스
		
		
		//2)상품 진열하기
		SmartTV tv=new SmartTV();
		Notebook note=new Notebook();
		HandPhone phone=new HandPhone();
		
		
		//3)상품 구매하기
		//->Buyer클래스
		Buyer kim=new Buyer();
		kim.buy(tv);
		kim.buy(note);
		kim.buy(phone);
		kim.buy(phone);
		kim.buy(phone);
		kim.buy(phone);
		kim.buy(phone);
		kim.buy(phone);
		
		kim.disp();
		System.out.println("-------------------------");
		
		
		//4)반품하기
		//->Order클래스 
		//->(Buyer클래스 복사해서 수정)
		//->상품을 중복해서 구매하지 않았다는 전제하에 반품
		Order lee=new Order();
		lee.buy(tv);
		lee.buy(note);
		lee.buy(phone);
		
		lee.disp();
		
		
		System.out.println("<<<<<반품");
		lee.refund(note);
		
		System.out.println("<<<<<결과");
		lee.disp();
		
	}//main() end
}//class end
