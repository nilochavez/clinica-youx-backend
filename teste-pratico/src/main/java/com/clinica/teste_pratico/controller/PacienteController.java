package com.clinica.teste_pratico.controller;

import com.clinica.teste_pratico.domain.paciente.*;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("pacientes")
public class PacienteController {

    @Autowired
    private PacienteRepository repository;

    @Autowired
    private PasswordEncoder encoder;

    @PostMapping
    @Transactional
    public void cadastrar(@RequestBody @Valid DadosCadastroPaciente dados){
       Paciente paciente =  new Paciente(dados);
        paciente.setCpf(encoder.encode(paciente.getCpf()));
        repository.save(paciente);
        System.out.println(dados);
    }

    @GetMapping
    public Page<DadosListagemPaciente> listar(Pageable paginacao){

        return repository.findAllByAtivoTrue(paginacao).map(DadosListagemPaciente::new);
    }


    @PutMapping
    @Transactional
    public ResponseEntity updatePaciente(@RequestBody @Valid AtualizacaoPacienteDTO data){
        Optional<Paciente> optionalPaciente = repository.findById(data.id());
        if (optionalPaciente.isPresent()) {
            Paciente paciente = optionalPaciente.get();
            paciente.setNome(data.nome());
            paciente.setCpf(encoder.encode(data.cpf()));
            paciente.setDataNascimento(data.dataNascimento());
            paciente.setUf(data.uf());
            paciente.setAltura(data.altura());
            paciente.setPeso(data.peso());
            return ResponseEntity.ok(paciente);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

@DeleteMapping("/{id}")
@Transactional
public ResponseEntity<Void> excluir(@PathVariable Long id) {
    var paciente = repository.findById(id).orElseThrow(() -> new RuntimeException("Paciente não encontrado"));

    repository.delete(paciente);

    return ResponseEntity.noContent().build();
}

}