package pl.coderslab.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pl.coderslab.entity.Message;
import pl.coderslab.entity.User;

public interface MessageRepository extends JpaRepository<Message, Long> {
	List<Message> findByUserIdOrderByCreatedDesc(Long id);
	@Query("Select m from Message m where m.user =:user and readOrNot =:readBool order by created desc")
	List<Message> userMessages(@Param("user") User id, @Param("readBool") boolean readBool );
}
