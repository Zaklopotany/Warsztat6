package pl.coderslab.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pl.coderslab.entity.Comments;
@Repository
public interface CommentsRepository extends JpaRepository<Comments, Long>{
 	List<Comments> findByPostIdOrderByCreatedDesc(Long id);
	
}
