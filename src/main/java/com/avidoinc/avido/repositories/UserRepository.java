package com.avidoinc.avido.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import com.avidoinc.avido.models.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
}
