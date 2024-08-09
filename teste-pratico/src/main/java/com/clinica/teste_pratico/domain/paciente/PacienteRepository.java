package com.clinica.teste_pratico.domain.paciente;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface PacienteRepository extends JpaRepository<Paciente, Long> {

    Page<Paciente> findAllByAtivoTrue(Pageable paginacao);


    @Override
    @Query("""
            select p
            from pacientes p
            where p.id = :id
            """)
    Optional<Paciente> findById(Long id);
}

