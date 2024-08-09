package com.clinica.teste_pratico.domain.paciente;


import jakarta.validation.constraints.NotNull;

import java.time.LocalDate;

public record AtualizacaoPacienteDTO(
        @NotNull
        Long id,
        String nome,
        String cpf,
        LocalDate dataNascimento,
        Double peso,
        Double altura,
        String uf) {
}



