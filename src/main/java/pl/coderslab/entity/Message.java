package pl.coderslab.entity;

import java.time.LocalDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Message {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne(cascade = CascadeType.REMOVE)
	@NotNull
	private User user;
	@NotEmpty
	@NotNull
	@Column(nullable=false)
	private String text;
	private boolean readOrNot=false; // 0 if unread
	private LocalDateTime created;
	
	//crator
	public Message() {
		
	}
	/// get set
	public Long getId() {
		return id;
	}

	public String getText() {
		return text;
	}
	

	public LocalDateTime getCreated() {
		return created;
	}

	public void setCreated(LocalDateTime created) {
		this.created = created;
	}

	public void setText(String text) {
		this.text = text;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean isRead() {
		return readOrNot;
	}

	public void setRead(boolean read) {
		this.readOrNot = read;
	}

}
