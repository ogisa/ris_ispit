package spring.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import model.Radnik;
import spring.repository.RadnikR;

@Service
public class UserDetailProvider implements UserDetailsService {
	@Autowired
	RadnikR rr;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Radnik r = rr.findByKorIme(username);
		UserDetails ud = new CustomUserDetail(r);
		return ud;
	}
}