package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.coderslab.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
	
	User findOneByUsernameAndPassword(String username, String password);
	User findOneByEmailAndPassword(String email, String password);
	User findOneByUsername(String username);
	User findOneByEmail(String email);

}
