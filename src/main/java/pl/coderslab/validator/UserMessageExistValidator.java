package pl.coderslab.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import pl.coderslab.entity.User;
import pl.coderslab.repository.UserRepository;

public class UserMessageExistValidator implements ConstraintValidator<UserMessageExist, User>{
	
	@Autowired
	UserRepository userRep;
	
	private User userTemp;
	
	@Override
	public void initialize(UserMessageExist user) {		
	}

	@Override
	public boolean isValid(User user, ConstraintValidatorContext arg1) {
		userTemp = userRep.findOneById(user.getId());
		if (userTemp != null) {
			return true;
		} else {
			return false;
		}
	}

}
