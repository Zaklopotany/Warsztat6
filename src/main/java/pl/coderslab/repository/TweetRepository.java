package pl.coderslab.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;

public interface TweetRepository extends JpaRepository<Tweet, Long>{
	@Query("Select t from Tweet t order by created desc")
	List<Tweet> orderListTweet();
	List<Tweet> findByUserId(Long id);
	List<Tweet> findByUserOrderByCreatedDesc(User user);
	Tweet findById(Long id);
}
