package com.clinica.teste_pratico.infra.security;

public record LoginResponseDTO(String token, com.clinica.teste_pratico.domain.usuario.UsuarioCargo cargo) {
}

