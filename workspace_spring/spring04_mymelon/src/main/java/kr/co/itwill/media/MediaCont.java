package kr.co.itwill.media;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MediaCont {

	//@Autowired 자동으로 만들어진 객체를 연결
	@Autowired
	private MediaDAO dao;
	
	public MediaCont() {
		System.out.println("-----MediaCont() 객체 생성됨");
	}//end

	@RequestMapping("media/list.do")
	public ModelAndView list(int mediagroupno) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("media/list");
		mav.addObject("list", dao.list(mediagroupno));
		mav.addObject("mediagroupno", mediagroupno); //부모 글번호
		return mav;
	}//list() end
	
	@RequestMapping(value="media/create.do", method=RequestMethod.GET)
	public ModelAndView createForm(int mediagroupno) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("media/createForm");
		mav.addObject("mediagroupno", mediagroupno); //부모 글번호
		return mav;
	}//createForm() end
	
	/*
	@RequestMapping(value="media/create.do", method=RequestMethod.POST)
	public ModelAndView createProc(@ModelAttribute MediaDTO dto, HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("media/msgView");
		
		////////////////////////////////////////////////////////
		//첨부된 파일 처리
		//->실제 파일은 /storage 폴더에 저장
		//->저장된 파일 관련 정보는 media테이블에 저장
		
		//파일 저장 폴더의 실제 물리적인 경로 가져오기
		String basePath=req.getRealPath("/storage");	
		
	}//createProc() end
	*/
	
	
}//class end
