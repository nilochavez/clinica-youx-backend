package com.clinica.teste_pratico.domain.paciente;


import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

@Table(name="pacientes")
@Entity(name = "pacientes")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class Paciente {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nome;
    private String cpf;
    private LocalDate dataNascimento;
    private Double peso;
    private Double altura;
    private String uf;

    private  boolean ativo;



    public Paciente(DadosCadastroPaciente dados) {
        this.ativo = true;
        this.nome = dados.nome();
        this.cpf = dados.cpf();
        this.dataNascimento = dados.dataNascimento();
        this.peso = dados.peso();
        this.altura = dados.altura();
        this.uf = dados.uf();

    }

//    public void atualizarInformacoes(AtualizacaoPacienteDTO dados) {
//        if (dados.nome() != null) {
//            this.nome = dados.nome();
//        }
//        if (dados.cpf() != null) {
//            this.cpf = dados.cpf();
//        }
//        if (dados.dataNascimento() != null) {
//            this.dataNascimento = dados.dataNascimento();
//        }
//        if (dados.peso() != null) {
//            this.peso = dados.peso();
//        }
//        if (dados.altura() != null) {
//            this.altura = dados.altura();
//        }
//        if (dados.uf() != null) {
//            this.uf= dados.uf();
//        }
//
//
//
//    }

}
