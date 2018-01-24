package pl.coderslab.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import pl.coderslab.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
	
	User findOneByUsernameAndPassword(String username, String password);
	User findOneByEmailAndPassword(String email, String password);
	User findOneByUsername(String username);
	User findOneByEmail(String email);
	User findOneById(Long id);
	
	@Query("Select u from User u where u.username like %?1%")
	List<User> allUsersByUsername(String username);
	

}
