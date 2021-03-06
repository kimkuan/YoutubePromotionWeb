package org.kpu.myweb.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.kpu.myweb.domain.ApplyVO;
import org.kpu.myweb.domain.EnterpriseVO;
import org.kpu.myweb.domain.UserVO;
import org.kpu.myweb.domain.YoutuberVO;
import org.kpu.myweb.domain.EnterpriseVO;
import org.kpu.myweb.service.EnterpriseService;
import org.kpu.myweb.service.UserService;
import org.kpu.myweb.service.YoutuberService;
import org.kpu.myweb.youtube.YoutubeAPI2;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(value="/enter")
public class EnterpriseController {
	
	@Autowired
	private EnterpriseService enterpriseService;
	@Autowired
	private UserService userService;
	@Autowired
	private YoutuberService youtuberservice;
	
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String readenterprise(HttpSession session, Model model) throws Exception {
		int id = (Integer) session.getAttribute("ID");
    	EnterpriseVO enter = enterpriseService.readUser(id);
    	UserVO user = userService.readUser(id);
    	model.addAttribute("enter",enter);
        return "enterprise/profile";
    }
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
    public String updateProfileGet(@RequestParam("id") int id, Model model) throws Exception {
    	EnterpriseVO enterprise = enterpriseService.readUser(id);
    	UserVO user = userService.readUser(id);
    	model.addAttribute("user", user.getUsername());
    	model.addAttribute("enterprise",enterprise);
        return "enterprise/profile_update";
    }
    
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateProfilePost(@ModelAttribute("enterprise") EnterpriseVO vo,
    									@ModelAttribute("user") UserVO user) throws Exception {

    	enterpriseService.updateUser(vo);
		
		if(user.getPassword() != "") {// 비밀번호 변경
			user.setId(vo.getId());
			userService.updateUser(user); 
		}
        return "redirect:/enter/profile";
    }
    
    /* 회원목록 확인 */
	@RequestMapping(value = {"/list"}, method = RequestMethod.GET)
	public String UserList(Model model) throws Exception {
		List<YoutuberVO> youtuber = youtuberservice.readYoutuberList();
		model.addAttribute("youtuber", youtuber);
		return "enterprise/youtuber_list";
	}
	
}