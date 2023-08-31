package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.AccountDAO;
import com.poly.entity.Account;
import com.poly.service.AccountService;
import com.poly.service.ParamService;
import com.poly.service.SessionService;
import com.poly.store.service.impl.MailerServiceImpl;

import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;

@Controller
public class RegisterController {
	@Autowired
	ServletContext app;
	@Autowired
	AccountDAO accDao;
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService session;
	@Autowired
	MailerServiceImpl mailer;

	@RequestMapping("/register")
	public String index(Model model) {
		return "auth/register";
	}

	public String getRandomString(int n) {
		String txt = "1234567890";
		StringBuilder sb = new StringBuilder();
		while (n > 0) {
			Random rd = new Random();
			sb.append(txt.charAt(rd.nextInt(txt.length())));
			n--;
		}
		return sb.toString();
	}

	@RequestMapping("/register/form")
	public String save(@Validated Account acc, Model model, BindingResult result) throws MessagingException {
		String email = paramService.getString("email", "");
		String pw = paramService.getString("password", "");
		String pwcf = paramService.getString("passwordcf", "");

		String tokencode = getRandomString(6);
		String thongBao = "Thông báo: Mã xác nhận code\r\n" + "\r\n" + "Kính gửi quý khách hàng,\r\n" + "\r\n <br>	"
				+ "Chúng tôi gửi đến quý khách mã xác nhận code mới để đảm bảo tính bảo mật cho tài khoản của quý khách. Mã xác nhận code này được sử dụng để xác thực và bảo vệ quyền riêng tư của quý khách trong quá trình sử dụng dịch vụ của chúng tôi.\r\n <br>	"
				+ "\r\n" + "Dưới đây là mã xác nhận code của quý khách:\r\n" + "<br>" + tokencode + "</br>" + "\r\n"
				+ "\r\n <br>	"
				+ "Vui lòng sử dụng mã xác nhận code này để tiếp tục các hoạt động và giao dịch trên tài khoản của quý khách. Chúng tôi khuyến nghị quý khách không tiết lộ mã xác nhận code này cho bất kỳ ai khác và không gửi mã này qua email hay tin nhắn điện thoại.\r\n <br>	"
				+ "\r\n"
				+ "Nếu quý khách không yêu cầu hoặc không nhớ có bất kỳ hoạt động liên quan đến mã xác nhận code này, vui lòng liên hệ với bộ phận hỗ trợ khách hàng của chúng tôi ngay để được hỗ trợ và đảm bảo an toàn cho tài khoản của quý khách.\r\n <br>	"
				+ "\r\n" + "Xin chân thành cảm ơn quý khách hàng đã sử dụng dịch vụ của chúng tôi.\r\n" + "\r\n <br>"
				+ "Trân trọng,\r\n" + "STVL";

		if (pw.equalsIgnoreCase(pwcf)) {
			mailer.send(email, "Thông báo: Mã xác nhận code", thongBao);
			session.setAttribute("token", tokencode);
			session.setAttribute("userres", acc);
			return "auth/confirm";
		} else {
			model.addAttribute("message", "Xác nhận mật khẩu không chính xác");
			return "auth/register";
		}

	}

	@RequestMapping("/register/confirm")
	public String Mail(Model model, @RequestParam("confirm") String confirm) {
		String token = session.getAttribute("token");

		if (confirm == null) {
			model.addAttribute("message", "Vui lòng nhập mã xác nhận");
		} else {
			if (!confirm.equals(token)) {
				model.addAttribute("message", "Mã xác nhận không chính xác");
			} else {
				Account user = session.getAttribute("userres");
				accDao.save(user);
				model.addAttribute("message", "Đăng ký thành công");
				return "auth/register";
			}
		}

		return "auth/confirm";
	}

}
