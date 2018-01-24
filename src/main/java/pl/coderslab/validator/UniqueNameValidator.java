package pl.coderslab.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import pl.coderslab.entity.User;
import pl.coderslab.repository.UserRepository;

public class UniqueNameValidator implements ConstraintValidator<UniqueName, String>{
	@Autowired
	UserRepository userRep;
	@Override
	public void initialize(UniqueName username) {
	}

	@Override
	public boolean isValid(String username, ConstraintValidatorContext arg1) {
		User tempUser = userRep.findOneByUsername(username);
		if(tempUser == null) {
			return true;
		} else {
			return false;			
		}
	}

}
