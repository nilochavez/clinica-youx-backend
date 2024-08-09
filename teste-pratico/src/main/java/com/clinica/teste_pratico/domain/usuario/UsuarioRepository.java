package com.clinica.teste_pratico.domain.usuario;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.List;
import java.util.Optional;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

    @Query(""" 
        SELECT u FROM Usuario u
        """)
    List<Usuario> findAllUsuarios();

    UserDetails findByLogin(String login);

    @Override
    @Query("""
            select u
            from Usuario u
            where u.id = :id
            """)
    Optional<Usuario> findById(Long id);
}
