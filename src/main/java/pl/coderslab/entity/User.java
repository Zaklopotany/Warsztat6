package pl.coderslab.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import pl.coderslab.beans.Encoding;
import pl.coderslab.validator.UniqueEmail;
import pl.coderslab.validator.UniqueName;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty
	@Column(nullable = false, unique = true)
	@UniqueName
	private String username;

	@NotEmpty
	@Size(min=4)
	@Column(nullable = false)
	private String password;

	private boolean enabled = false;

	@NotEmpty
	@Email
	@Column(nullable = false, unique = true)
	@UniqueEmail
	private String email;

/*	@OneToMany(mappedBy="user", cascade = CascadeType.REMOVE)
	private List<Message> message;
*/
	// get set
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = Encoding.encodePassToString(password);
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
				+ ", email=" + email + "]";
	}
}
