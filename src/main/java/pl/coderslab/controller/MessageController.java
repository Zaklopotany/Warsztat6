package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import pl.coderslab.entity.User;
import pl.coderslab.repository.MessageRepository;


@Controller
@RequestMapping(path="message")
public class MessageController {
	@Autowired
	private MessageRepository messageRep;
	
	@GetMapping("/showSentMessage")
	public String showSetMessage(Model model) {
		return "message/userMessage";
	}
	
	@GetMapping("/showMailBox")
	public String showMailBox(Model model, @SessionAttribute(name="user") User user1) {
		model.addAttribute("messageList", messageRep.userMessages(user1, false));
		model.addAttribute("messageListRead", messageRep.userMessages(user1, true));
		return "message/userMessage";
	}
	
}
