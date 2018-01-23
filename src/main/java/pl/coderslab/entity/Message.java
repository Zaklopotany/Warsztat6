package pl.coderslab.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
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
	@ManyToOne
//	@NotNull
	private User user;
	
	@ManyToOne
//	 @NotNull
	private User sender;
	@NotEmpty
	@NotNull
	@Column(nullable = false)
	private String text;
	private boolean readOrNot = false; // 0 if unread
	private LocalDateTime created;
	private boolean isVisibleToSender = true;
	private boolean isVisibleToUser = true;

	// crator
	public Message() {

	}

	/// get set
	public Long getId() {
		return id;
	}

	public String getText() {
		return text;
	}

	public boolean getVisibleToSender() {
		return isVisibleToSender;
	}

	public void setVisibleToSender(boolean isVisibleToSender) {
		this.isVisibleToSender = isVisibleToSender;
	}

	public boolean getVisibleToUser() {
		return isVisibleToUser;
	}

	public void setVisibleToUser(boolean isVisibleToUser) {
		this.isVisibleToUser = isVisibleToUser;
	}

	public User getSender() {
		return sender;
	}

	public Message setSender(User sender) {
		this.sender = sender;
		return this;
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

	public Message setUser(User user) {
		this.user = user;
		return this;
	}

	public boolean isRead() {
		return readOrNot;
	}

	public void setRead(boolean read) {
		this.readOrNot = read;
	}

}
