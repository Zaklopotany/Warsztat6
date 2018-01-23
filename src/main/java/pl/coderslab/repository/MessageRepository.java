package pl.coderslab.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pl.coderslab.entity.Message;
import pl.coderslab.entity.User;

public interface MessageRepository extends JpaRepository<Message, Long> {
	
	@Query("Select m from Message m where m.user =:user and readOrNot =:readBool order by created desc")
	List<Message> userMessages(@Param("user") User id, @Param("readBool") boolean readBool );
	/**
	 * 
	 * @param sender  
	 * @param isVisible // 1 - is visible to user, 0 - is not visible (deleted) 
	 * @return return List of Messages 
	 */
	@Query("Select m from Message m where m.sender =:sender and m.isVisibleToSender =:isVisible order by created desc")
	List<Message> allVisibleToSender(@Param("sender") User sender, @Param("isVisible") boolean isVisible);
	
	@Query("Select m from Message m where m.user =:user and m.isVisibleToUser =:isVisible order by created desc")
	List<Message> allVisibleToUser(@Param("user") User user, @Param("isVisible") boolean isVisible);
	
	
	/**
	 * 
	 * @param user
	 * @param isVisible // 1 - is visible to user, 0 - is not visible (deleted)
	 * @param readBool // 0 - is read, 0 - is unread
	 * @return List of Messages according to parameters
	 */
	@Query("Select m from Message m where m.user =:user and m.isVisibleToUser =:isVisible and readOrNot =:readBool order by created desc")
	List<Message> allVisibleToUserRoN(@Param("user") User user, @Param("isVisible") boolean isVisible, @Param("readBool") boolean readBool);
	
	List<Message> findByUserIdOrderByCreatedDesc(Long id);
	List<Message> findBySenderIdOrderByCreatedDesc(Long id);
	
}
