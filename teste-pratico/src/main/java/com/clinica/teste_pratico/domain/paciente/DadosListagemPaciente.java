package com.clinica.teste_pratico.domain.paciente;

public record DadosListagemPaciente(Long id, String nome, String cpf, Double peso, Double altura,
                                    java.time.LocalDate dataNascimento, String uf) {

    public DadosListagemPaciente(Paciente paciente){
        this(paciente.getId(), paciente.getNome(),  paciente.getCpf(), paciente.getPeso(),
                paciente.getAltura(), paciente.getDataNascimento(), paciente.getUf());
    }
}