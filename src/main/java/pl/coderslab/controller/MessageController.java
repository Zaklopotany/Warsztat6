package pl.coderslab.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import pl.coderslab.entity.Message;
import pl.coderslab.entity.User;
import pl.coderslab.repository.MessageRepository;
import pl.coderslab.repository.UserRepository;

@Controller
@RequestMapping(path = "message")
public class MessageController {

	@Autowired
	private MessageRepository messageRep;
	@Autowired
	private UserRepository userRep;

	// show sent messages
	@GetMapping("/showSentMessage")
	public String showSentMessage(Model model, @SessionAttribute(name = "user", required = false) User user1) {
		if (user1 == null) {
			return "redirect:/user/login";
		}
		model.addAttribute("sentMessageList", messageRep.allVisibleToSender(user1, true));
		return "message/userSentMessage";
	}

	// show received read and unread messages
	@GetMapping("/showMailBox")
	public String showMailBox(Model model, @SessionAttribute(name = "user", required = false) User user1) {
		if (user1 == null) {
			return "redirect:/user/login";
		}
		model.addAttribute("messageList", messageRep.allVisibleToUserRoN(user1, true, false));
		model.addAttribute("messageListRead", messageRep.allVisibleToUserRoN(user1, true, true));
		return "message/userMessage";
	}

	// open form with new message
	@GetMapping("/sendMessage/{id}")
	public String sendMessage(@PathVariable Long id, Model model,
			@SessionAttribute(name = "user", required = false) User user1) {
		if (user1 == null) {
			return "redirect:/user/login";
		}
		User tempUser = userRep.findOne(id);
		model.addAttribute("message", new Message().setSender(user1).setUser(tempUser)); // for binding purpose
		return "message/sendMessage";
	}

	// open form where id of user is not specified
	@GetMapping("/sendMessage")
	public String sendMessageUnknownUser(Model model, @SessionAttribute(name = "user", required = false) User user1) {
		if (user1 == null) {
			return "redirect:/user/login";
		}
		model.addAttribute("message", new Message().setSender(user1)); // for binding purpose
		return "message/sendMessageUnknown";
	}

	// get new message validate and send
	@PostMapping("/sendMessage")
	public String sendNewMessage(@Valid Message message, BindingResult result, Model model,
			@SessionAttribute(name = "user", required = false) User user1) {
		User tempUser = userRep.findOne(message.getUser().getId());
		model.addAttribute("message", new Message().setSender(user1).setUser(tempUser)); // for binding purpose
		if(user1 == null) {
			return "redirect:/user/login";
		}
		if (result.hasErrors()) {
			return "message/sendMessage";
		} else if (message.getUser().getId() == user1.getId()) {
			model.addAttribute("userError", true);
			return "message/sendMessage";
		} else if (message.getSender().getId() != user1.getId()) {
			model.addAttribute("userCheat", true);
			return "message/sendMessage";
		}
		model.addAttribute("userError", false);
		model.addAttribute("userCheat", false);
		message.setCreated(LocalDateTime.now());
		messageRep.save(message);
		return "redirect:/message/showSentMessage";
	}
	//get new message from sendMessageUnknown
	@PostMapping("/sendMessageUnknown")
	public String sendNewMessageUnknown(@Valid Message message, BindingResult result, Model model,
			@SessionAttribute(name = "user", required = false) User user1) {
		if(user1 == null) {
			return "redirect:/user/login";
		}
		if (result.hasErrors()) {
			return "message/sendMessageUnknown";
		} else if (message.getUser().getId() == user1.getId()) {
			model.addAttribute("userError", true);
			return "message/sendMessageUnknown";
		} else if (message.getSender().getId() != user1.getId()) {
			model.addAttribute("userCheat", true);
			return "message/sendMessageUnknown";
		}
		model.addAttribute("userError", false);
		model.addAttribute("userCheat", false);
		message.setCreated(LocalDateTime.now());
		messageRep.save(message);
		return "redirect:/message/showSentMessage";
	}
	//getting recipient id
	@GetMapping("/sendMessageUnknown/{id}")
	public String sendMessageUnknownId(@PathVariable Long id, Model model, @SessionAttribute(name = "user", required = false) User user1) {
		if (user1 == null ) {
			return "redirect:/user/login";
		}
		model.addAttribute("user", userRep.findOneById(id));
		model.addAttribute("message", new Message().setSender(user1));
		return "message/sendMessageUnknown";
	}
	
	
	//get user sendMessageUnknown
	@PostMapping("/sendMessageUnknown/getUser")
	public String getUserList(Model model, @RequestParam("name") String name, @SessionAttribute(name = "user", required = false) User user1) {
		if (user1 == null ) {
			return "redirect:/user/login";
		}
		model.addAttribute("message", new Message().setSender(user1)); // for binding purpose
		List<User> userList = new ArrayList<>();
		if(name.length() > 0) {
			userList = userRep.allUsersByUsername(name);
		} else {
			model.addAttribute("lackOfUsername", "Wpisz co najmniej jedną litery nazwy użytkonika");
			return "message/sendMessageUnknown";
		}
		if(userList.size() == 0) {
			model.addAttribute("userNone", "Brak użytkowników");
			return "message/sendMessageUnknown";
		}
		model.addAttribute("userList", userList);
		model.addAttribute("userNone", null);
		model.addAttribute("lackOfUsername", null);
		return "/message/sendMessageUnknown";
	}
	
	// show message details
	@GetMapping("/messageDetails/{id}")
	public String showMessageDetails(@PathVariable Long id, Model model,
			@SessionAttribute(name = "user", required = false) User user1) {
		if (user1 == null) {
			return "redirect:/user/login";
		}
		Message tempMessage = messageRep.findOne(id);
		tempMessage.setRead(true);
		messageRep.save(tempMessage);
		model.addAttribute("message", tempMessage);
		return "message/messageDetails";
	}
	
	//delete, checked messages
	@PostMapping("/modifyMessage/delete")
	public String deleteCheckedMessage(HttpServletRequest request, @SessionAttribute(name = "user", required = false) User user1) {
		if(user1==null) {
			return "redirect:/user/login";
		}
		String[] check = request.getParameterValues("check");
		if(check != null) {
			for (int i = 0; i< check.length; i++) {
				Message tempMes = messageRep.UserIdMessage(user1, Long.parseLong(check[i]));
				tempMes.setVisibleToUser(false);
				messageRep.save(tempMes);
			}
		}
		return "redirect:/message/showMailBox";	
	}
	//read checked messages
	@PostMapping("/modifyMessage/read")
	public String readCheckedMessage(HttpServletRequest request, @SessionAttribute(name = "user", required = false) User user1) {
		if(user1==null) {
			return "redirect:/user/login";
		}
		String[] check = request.getParameterValues("check");
		if (check != null) {
			for (int i = 0; i< check.length; i++) {
				Message tempMessage = messageRep.UserIdMessage(user1, Long.parseLong(check[i]));
				tempMessage.setRead(true);
				messageRep.save(tempMessage);
			}
		}
		return "redirect:/message/showMailBox";
	}
	//unread checked messages
	@PostMapping("/modifyMessage/unread")
	public String unreadCheckedMessage(HttpServletRequest request, @SessionAttribute(name = "user", required = false) User user1) {
		if(user1==null) {
			return "redirect:/user/login";
		}
		String[] check = request.getParameterValues("check");
		if (check != null) {
			for (int i = 0; i< check.length; i++) {
				Message tempMessage = messageRep.UserIdMessage(user1, Long.parseLong(check[i]));
				tempMessage.setRead(false);
				messageRep.save(tempMessage);
			}
		}
		return "redirect:/message/showMailBox";	
	}

	//delete sent message (make it invisible for the sender)
	@PostMapping("/modifySentMessage")
	public String modifySentMessage(HttpServletRequest request, @SessionAttribute(name = "user", required = false) User user1) {
		if(user1 == null) {
			return "redirect:/user/login";
		}
		String[] parameters = request.getParameterValues("check");
		if(parameters != null) {
			for(int i =0; i < parameters.length; i++) {
				Message tempMes = messageRep.UserIdMessage(user1, Long.parseLong(parameters[i]));
				tempMes.setVisibleToSender(false);
				messageRep.save(tempMes);
				//modify visibility
			}
		}
		return "redirect:/message/showSentMessage";
	}
	

}
