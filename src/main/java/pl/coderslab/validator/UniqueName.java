package pl.coderslab.validator;

import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Retention(RUNTIME)
@Target(ElementType.FIELD)
@Constraint(validatedBy = UniqueNameValidator.class)
public @interface UniqueName {
	String message() default "{UniqueName.error.message}";
	Class<?>[] groups() default{};
	Class<? extends Payload>[] payload() default {}; 
}
