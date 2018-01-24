package pl.coderslab.validator;

import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Retention(RUNTIME)
@Target({ElementType.METHOD, ElementType.FIELD, ElementType.TYPE})
@Constraint(validatedBy = UserMessageExistValidator.class)
public @interface UserMessageExist {
	String message() default "{UserMessageExist.error.message}";
	Class<?>[] groups() default{};
	Class<? extends Payload>[] payload() default {}; 

}
