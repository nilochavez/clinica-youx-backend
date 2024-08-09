package com.clinica.teste_pratico.domain.usuario;

import jakarta.validation.constraints.NotNull;

public record AtualizacaoUsuarioDTO(@NotNull Long id,
                                    String login,
                                    String senha,
                                    String cargo) {
}
