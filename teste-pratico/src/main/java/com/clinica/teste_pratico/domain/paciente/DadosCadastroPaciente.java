package com.clinica.teste_pratico.domain.paciente;

import jakarta.validation.Valid;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;


import java.time.LocalDate;


public record DadosCadastroPaciente(

        @NotBlank(message = "O nome é obrigatório")
        String nome,

        @NotBlank(message = "O CPF é obrigatório")
        @Size(min = 11, max = 11, message = "O CPF deve ter 11 caracteres")
        String cpf,

        @NotBlank
        LocalDate dataNascimento,

        @NotBlank
        Double altura,

        @NotBlank
        Double peso,

        @NotBlank(message = "A UF é obrigatória")
        @Size(min = 2, max = 2, message = "A UF deve ter 2 caracteres")
        String uf

        ) {
}
