package pl.coderslab.controller;

import java.time.LocalDateTime;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import pl.coderslab.entity.Comments;
import pl.coderslab.entity.User;
import pl.coderslab.repository.CommentsRepository;
@RequestMapping(value="/comment")
@Controller
public class CommentController {
	@Autowired
	CommentsRepository commentsRep;
	
	//add new comment 
	@PostMapping("/addComment")
	public String addComment(@Valid Comments comment, BindingResult result, Model model, @SessionAttribute(name ="user") User user1) {
		if(result.hasErrors()) {
			return "app/tweetDetails";
		}
		comment.setCreated(LocalDateTime.now());
		commentsRep.save(comment);
		return "redirect:/tweet/details/"+comment.getPost().getId();
		
	}
}
