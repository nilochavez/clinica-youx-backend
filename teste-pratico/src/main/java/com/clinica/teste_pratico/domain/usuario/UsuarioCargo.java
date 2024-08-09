package com.clinica.teste_pratico.domain.usuario;

public enum UsuarioCargo {

    ADMIN("medico"),

    USER("enfermeiro");

    private String cargo;

    private UsuarioCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getCargo() {
        return cargo;
    }
}
