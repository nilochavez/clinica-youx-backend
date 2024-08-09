package com.clinica.teste_pratico.controller;

import com.clinica.teste_pratico.domain.usuario.*;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/")
 class UsuarioController {

    @Autowired
    private BCryptPasswordEncoder encoder;

    @Autowired
    private UsuarioRepository repository;


    @PostMapping("/registrarUsuario")
    public ResponseEntity register(@RequestBody @Valid RegistroDTO data){
        if(this.repository.findByLogin(data.login()) != null) return ResponseEntity.badRequest().build();

        String encryptedPassword = new BCryptPasswordEncoder().encode(data.senha());
        Usuario newUser = new Usuario(data.login(), encryptedPassword, data.cargo());

        this.repository.save(newUser);

        return ResponseEntity.ok().build();
    }


    @GetMapping("/listarUsuario")
    public ResponseEntity<List<Usuario>> listarTodosUsuarios() {
        List<Usuario> usuarios = repository.findAllUsuarios();
        return ResponseEntity.ok(usuarios);
    }


    @PutMapping("/atualizarUsuario")
    @Transactional
    public ResponseEntity<Usuario> updateUsuario(@RequestBody @Valid AtualizacaoUsuarioDTO data) {
        Optional<Usuario> optionalUsuario = repository.findById(data.id());
        if (optionalUsuario.isPresent()) {
            Usuario usuario = optionalUsuario.get();
            if (data.login() != null) {
                usuario.setLogin(data.login());
            }
            if (data.senha() != null) {
                usuario.setSenha(encoder.encode(data.senha()));
            }
            if (data.cargo() != null) {
                usuario.setCargo(UsuarioCargo.valueOf(data.cargo()));
            }
            repository.save(usuario);
            return ResponseEntity.ok(usuario);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("deletarUsuario/{id}")
    @Transactional
    public ResponseEntity<Void> excluir(@PathVariable Long id) {
        var usuario = repository.findById(id).orElseThrow(() -> new RuntimeException("Usuario não encontrado"));

        repository.delete(usuario);

        return ResponseEntity.noContent().build();
    }
}
