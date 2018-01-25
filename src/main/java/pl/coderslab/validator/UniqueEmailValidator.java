package pl.coderslab.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import pl.coderslab.entity.User;
import pl.coderslab.repository.UserRepository;

public class UniqueEmailValidator implements ConstraintValidator<UniqueEmail, String> {
	@Autowired
	UserRepository userRep;

	@Override
	public void initialize(UniqueEmail email) {
	}

	@Override
	public boolean isValid(String email, ConstraintValidatorContext arg1) {

		try {
			User tempUser = new User();
			tempUser = userRep.findOneByEmail(email);
			if (tempUser.getId() > 0) {
				return false;
			} else {
				return true;
			}
		} catch (NullPointerException e) {
		}
		return true;
	}
}
